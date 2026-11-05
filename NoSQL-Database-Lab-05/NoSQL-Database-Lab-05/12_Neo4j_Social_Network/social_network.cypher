// Practical 12: Social Network
CREATE CONSTRAINT person_name_unique IF NOT EXISTS
FOR (p:Person) REQUIRE p.personId IS UNIQUE;

UNWIND [
 {id:1,name:"Aarav"},
 {id:2,name:"Priya"},
 {id:3,name:"Rahul"},
 {id:4,name:"Neha"}
] AS row
MERGE (:Person {personId:row.id, name:row.name});

MERGE (a:Person {personId:1})-[:FRIENDS_WITH]->(p:Person {personId:2});
MERGE (a)-[:FOLLOWS]->(r:Person {personId:3});
MERGE (n:Person {personId:4})-[:FOLLOWS]->(a);
MERGE (a)-[:WORKS_AT]->(:Company {name:"Tech Solutions"});
MERGE (p)-[:WORKS_AT]->(:Company {name:"Tech Solutions"});

// Find a person's friends
MATCH (p:Person {personId:1})-[:FRIENDS_WITH]-(friend:Person)
RETURN p.name, friend.name;

// Find followers of a person
MATCH (follower:Person)-[:FOLLOWS]->(p:Person {personId:1})
RETURN follower.name, p.name;

// Find people followed by Aarav
MATCH (:Person {personId:1})-[:FOLLOWS]->(p:Person)
RETURN p.name;

// Visualize social graph
MATCH (p:Person)-[r]->(other)
RETURN p,r,other;
