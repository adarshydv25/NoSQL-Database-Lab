NOSQL DATABASE DESIGN - LAB SHEET 02
BCA Practical Work | Student Database and Distributed NoSQL Models

IMPORTANT
This package contains runnable scripts/configuration examples and a practical record guide.
It is written as a student lab submission starter, not as proof that every database service
has already been installed or executed on your computer. Run the sections that match the
software available on your machine and add your own screenshots/output before submission.

SUGGESTED WINDOWS FOLDER
C:\BCA_Projects\NoSQL-Database-Lab-02

FOLDER MAP
01_MySQL                 MySQL table, inserts and comparison
02_MongoDB               CollegeDB CRUD, Orders, sharding, MapReduce-style aggregation
03_Redis                 Student key-value commands
04_Cassandra              Keyspace, table, CRUD, multi-node notes
05_HBase                  HBase table and CRUD shell commands
06_Neo4j                  Student-Course graph queries
07_Distribution_Models    Architecture explanations and diagrams
08_Docker_Demos           Local MongoDB replica set and sharded-cluster examples
09_Report                 Practical record template and comparison tables

QUICK START
1. Install/start the database you are going to practise.
2. Open the relevant folder and read its README.txt.
3. Run the commands in order. Use your own local database credentials if required.
4. Take screenshots of commands and their actual outputs.
5. Fill your name, roll number, date and teacher remarks in the report template.

DATASET USED
Five sample students:
101 Aarav Sharma, BCA, Semester 5, 82
102 Priya Verma, BCA, Semester 5, 91
103 Rahul Singh, BSc IT, Semester 3, 76
104 Neha Gupta, BCA, Semester 3, 88
105 Karan Joshi, BSc IT, Semester 5, 69

The same basic records are reused across database examples so comparisons are fair.

NOTES
- MongoDB shell commands use mongosh.
- Redis commands use redis-cli.
- Cassandra commands use cqlsh.
- HBase commands use the HBase shell.
- Neo4j commands use the Cypher query editor / cypher-shell.
- The sharding and replication examples require multiple MongoDB processes/containers.
  They are separate advanced demos; do not run them on a production database.
- HBase and Cassandra multi-node examples need more RAM and setup than basic local CRUD.
- Never paste real passwords into screenshots or commit them to GitHub.
