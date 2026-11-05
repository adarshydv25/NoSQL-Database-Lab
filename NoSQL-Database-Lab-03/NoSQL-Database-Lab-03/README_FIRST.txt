NOSQL DATABASE DESIGN - LAB SHEET 03
MongoDB Practical Package | 15 Mini Systems

This package contains runnable mongosh JavaScript scripts for all 15 questions.
It is a practical starter package: run the scripts and capture your own actual output
screenshots before submitting. Do not claim a query was executed unless you ran it.

REQUIREMENTS
- MongoDB Community Server running locally
- mongosh installed
- VS Code (optional, for editing scripts)

HOW TO RUN
1. Start MongoDB Server.
2. Open PowerShell/CMD and run: mongosh
3. From mongosh, run a script using its full path, for example:
   load("C:/BCA_Projects/NoSQL-Database-Lab-03/01_Student_Activity_Tracking.js")
4. Repeat for the other numbered scripts.
   Alternatively, copy and paste the script contents into mongosh.

DATABASE
All practicals use the database named NoSQL_Lab3. Each question uses its own collection
(or a clearly named set of collections) to keep examples separate.

SAMPLE DATA
The scripts insert sample records so queries can be demonstrated immediately.
Most scripts drop and recreate their own collection at the beginning. This makes each
script repeatable, but it also removes old sample data in that collection.

IMPORTANT
- Task 11 (transactions) requires MongoDB running as a replica set or sharded cluster.
  A standalone MongoDB server does not support multi-document transactions.
- The scripts are designed for learning and local practical work, not production use.
- Do not use real bank details, passwords, customer information or private data.
- Use your own screenshots of actual execution for the practical file.
