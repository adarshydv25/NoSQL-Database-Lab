# NoSQL Database Design - Lab Sheet 02

**Name:** ______________________________  
**Course:** BCA  
**Semester:** __________________________  
**Roll Number:** _______________________  
**Session:** ___________________________  
**Subject:** NoSQL Database Design  

## Aim
To implement student-related data using relational and NoSQL databases and understand
document, key-value, wide-column, graph and distributed database models.

## Software / Tools
MySQL, MongoDB, Redis, Cassandra, HBase, Neo4j and Docker (for optional distributed demos).

## Common Dataset
Use the five student records listed in `README_FIRST.txt`.

## Practical format (repeat for each question)
**Question No.:** ______  
**Aim:** __________________________________  
**Commands / Program:** Attach or paste the relevant script.  
**Output:** Paste a screenshot of your actual execution.  
**Result:** The operation was executed and the displayed output was checked.  
**Teacher's Signature:** __________________

## Result / Learning
The lab demonstrates that different NoSQL databases store and query data in different
ways. MongoDB stores documents, Redis stores key-value pairs, Cassandra stores wide-column
data, HBase stores data by row key and column family, and Neo4j stores connected data as
a graph. Distributed models such as sharding and replication support scale and availability.

## Screenshot checklist
- [ ] MySQL table and five inserted rows
- [ ] MongoDB Students CRUD output
- [ ] MongoDB Orders aggregation output
- [ ] Redis SET, GET, update, DEL and key listing
- [ ] Cassandra table and queries
- [ ] HBase create, put, get, scan and delete
- [ ] Neo4j nodes and ENROLLED_IN relationships
- [ ] MongoDB/Cassandra/Neo4j comparison
- [ ] Single-server CRUD verification
- [ ] Sharding status and distribution (only if configured)
- [ ] Replica set status and secondary read (only if configured)
- [ ] Cassandra multi-node status (only if configured)
- [ ] Sharding + replication architecture / verification
- [ ] MapReduce-style course-wise count and average
- [ ] Five distribution-model diagrams and explanations
