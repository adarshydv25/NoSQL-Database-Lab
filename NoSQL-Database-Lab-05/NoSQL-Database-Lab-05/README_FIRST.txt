NOSQL DATABASE DESIGN - LAB SHEET 05
Riak KV and Neo4j Practical Package

CONTENTS
01_Riak_Install
02_Riak_Buckets
03_Riak_Profiles
04_Riak_Shopping_Cart
05_Riak_Data_Types
06_Riak_Quorums
07_Riak_Scaling
08_Riak_Transaction_Like
09_Riak_Query_By_Data
10_Riak_Sets
11_Neo4j_Student_Course_Department
12_Neo4j_Social_Network
13_Neo4j_Ecommerce
14_Neo4j_Transactions
15_Neo4j_Python_Application
REPORT_AND_VIVA

REQUIREMENTS
Riak KV:
- Linux system (Ubuntu/Debian recommended for the lab environment)
- A compatible Riak KV package or supported container image
- curl
- Riak HTTP interface enabled and reachable (default commonly port 8098)
- riak-admin and riak attach may be available depending on installation

Neo4j:
- Neo4j Desktop or Neo4j Server
- Neo4j Browser or cypher-shell
- Python 3 and neo4j Python driver for Practical 15

IMPORTANT VERSION NOTE
Riak KV packaging, repository availability and supported versions vary. Riak KV is an
older product and may not be available from current Linux package repositories. Follow
the official Riak KV documentation for a version compatible with your Linux distribution.
The Riak commands in this package assume the HTTP API is enabled on localhost:8098.
Do not assume that installing a package automatically enables the HTTP interface.

HOW TO USE
1. Extract this ZIP.
2. Read each practical's README or comments.
3. Execute Riak curl commands in a Linux terminal where Riak is running.
4. Execute .cypher files in Neo4j Browser or cypher-shell.
5. For Python practical, install the driver and configure your local Neo4j connection.
6. Capture your own real output screenshots and add them to your college practical record.

The examples use fictional student and user information. Never use real passwords,
session tokens, personal data or payment details in a lab database.
