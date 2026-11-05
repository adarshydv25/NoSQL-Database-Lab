MYSQL - RELATIONAL STUDENT DATABASE

Open MySQL Workbench or mysql command line and run:
  source 01_MySQL/student_database.sql

Or open student_database.sql and execute the complete script.

The script creates database CollegeDB_RDBMS, table Student, inserts five records,
selects all records and shows a course-wise query.

Comparison with MongoDB:
- Schema: MySQL uses a defined table structure; MongoDB documents can have flexible fields.
- Storage: MySQL stores rows and columns; MongoDB stores BSON documents in collections.
- Flexibility: MySQL is strong for structured data and constraints; MongoDB handles changing
  document structures more naturally.
- Scalability: MySQL commonly scales vertically and can be distributed with extra design;
  MongoDB supports horizontal scaling through sharding.
Neither database is always better. Choose based on application requirements.
