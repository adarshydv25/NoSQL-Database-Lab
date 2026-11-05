PRACTICAL 15 - PYTHON APPLICATION USING NEO4J

1. Start Neo4j and create/open a database.
2. Note the Bolt URI, usually bolt://localhost:7687.
3. Set environment variables:
   Windows PowerShell:
     $env:NEO4J_URI="bolt://localhost:7687"
     $env:NEO4J_USER="neo4j"
     $env:NEO4J_PASSWORD="your_local_password"
4. Install driver:
     py -m pip install -r requirements.txt
5. Run:
     py app.py

The app creates sample Person and Course nodes, adds ENROLLED_IN relationships,
reads students by course, updates a person's city and deletes a demo person.
It also shows a transaction-managed wallet transfer as an example of atomic graph updates.

Never put your actual database password in a public repository.
