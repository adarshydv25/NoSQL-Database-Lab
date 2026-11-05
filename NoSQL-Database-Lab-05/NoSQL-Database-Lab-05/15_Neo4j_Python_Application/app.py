import os
from neo4j import GraphDatabase

URI = os.getenv("NEO4J_URI", "bolt://localhost:7687")
USER = os.getenv("NEO4J_USER", "neo4j")
PASSWORD = os.getenv("NEO4J_PASSWORD")

if not PASSWORD:
    raise SystemExit("Set NEO4J_PASSWORD environment variable before running.")

driver = GraphDatabase.driver(URI, auth=(USER, PASSWORD))


def create_sample_graph(tx):
    tx.run("""
        MERGE (c:Course {code:'BCA'})
        SET c.name = 'Bachelor of Computer Applications'
        MERGE (d:Department {name:'Computer Applications'})
        MERGE (c)-[:BELONGS_TO]->(d)
    """)
    tx.run("""
        UNWIND $students AS row
        MERGE (s:Student {studentId:row.id})
        SET s.name = row.name, s.city = row.city
        WITH s
        MATCH (c:Course {code:'BCA'})
        MERGE (s)-[:ENROLLED_IN]->(c)
    """, students=[
        {"id": 101, "name": "Aarav Sharma", "city": "Roorkee"},
        {"id": 102, "name": "Priya Verma", "city": "Haridwar"},
        {"id": 103, "name": "Rahul Singh", "city": "Dehradun"},
    ])


def students_in_course(tx, course_code):
    result = tx.run("""
        MATCH (s:Student)-[:ENROLLED_IN]->(c:Course {code:$code})
        RETURN s.studentId AS id, s.name AS name, s.city AS city
        ORDER BY id
    """, code=course_code)
    return [record.data() for record in result]


def update_student_city(tx, student_id, city):
    result = tx.run("""
        MATCH (s:Student {studentId:$id})
        SET s.city = $city
        RETURN s.studentId AS id, s.name AS name, s.city AS city
    """, id=student_id, city=city)
    return result.single()


def delete_demo_student(tx, student_id):
    tx.run("""
        MATCH (s:Student {studentId:$id})
        DETACH DELETE s
    """, id=student_id)


def transfer_wallet(tx, from_id, to_id, amount):
    # Both account updates run in one managed transaction.
    sender = tx.run(
        "MATCH (a:Wallet {id:$id}) RETURN a.balance AS balance",
        id=from_id
    ).single()
    if sender is None or sender["balance"] < amount:
        raise ValueError("Sender missing or insufficient balance")

    tx.run("""
        MATCH (a:Wallet {id:$from}), (b:Wallet {id:$to})
        SET a.balance = a.balance - $amount,
            b.balance = b.balance + $amount
    """, from=from_id, to=to_id, amount=amount)


with driver.session() as session:
    session.execute_write(create_sample_graph)
    print("Students in BCA:")
    for row in session.execute_read(students_in_course, "BCA"):
        print(row)

    print("Updated student:")
    print(session.execute_write(update_student_city, 101, "Haridwar"))

    # Create wallet examples and perform one atomic transfer.
    session.run("""
        MERGE (:Wallet {id:'W1', balance:5000})
        MERGE (:Wallet {id:'W2', balance:3000})
    """)
    session.execute_write(transfer_wallet, "W1", "W2", 500)
    print("Wallet balances after transfer:")
    for record in session.run("MATCH (w:Wallet) RETURN w.id AS id, w.balance AS balance ORDER BY id"):
        print(record.data())

    # Delete a dedicated demo student only if present.
    session.execute_write(delete_demo_student, 103)

driver.close()
print("Neo4j practical completed.")
