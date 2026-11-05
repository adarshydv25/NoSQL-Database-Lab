-- CASSANDRA LAB SHEET 4 — Q11 TO Q14
-- Execute with cqlsh -f this_file.cql

-- Q11 CollegeDB and Students
CREATE KEYSPACE IF NOT EXISTS CollegeDB
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE CollegeDB;
CREATE TABLE IF NOT EXISTS Students (
 student_id int PRIMARY KEY, name text, course text, semester int, marks decimal
);
INSERT INTO Students (student_id,name,course,semester,marks) VALUES (1,'Aarav Sharma','BCA',5,82.5);
INSERT INTO Students (student_id,name,course,semester,marks) VALUES (2,'Priya Verma','BCA',5,88.0);
INSERT INTO Students (student_id,name,course,semester,marks) VALUES (3,'Rahul Singh','BSc IT',4,76.0);
INSERT INTO Students (student_id,name,course,semester,marks) VALUES (4,'Neha Gupta','BCA',5,91.0);
INSERT INTO Students (student_id,name,course,semester,marks) VALUES (5,'Kabir Joshi','BCom',3,79.0);
SELECT * FROM Students;

-- Q12 Employees CRUD
CREATE TABLE IF NOT EXISTS Employees (
 employee_id int PRIMARY KEY, name text, department text, salary decimal
);
INSERT INTO Employees (employee_id,name,department,salary) VALUES (101,'Amit Kumar','IT',35000);
INSERT INTO Employees (employee_id,name,department,salary) VALUES (102,'Sara Khan','HR',32000);
SELECT * FROM Employees;
UPDATE Employees SET salary=38000 WHERE employee_id=101;
SELECT * FROM Employees WHERE employee_id=101;
DELETE FROM Employees WHERE employee_id=102;
SELECT * FROM Employees;

-- Q13 Events partitioned by user; timestamp is clustering column
CREATE TABLE IF NOT EXISTS UserEvents (
 user_id text, event_time timestamp, event_id uuid, event_type text, status text,
 PRIMARY KEY ((user_id), event_time, event_id)
) WITH CLUSTERING ORDER BY (event_time DESC);
INSERT INTO UserEvents (user_id,event_time,event_id,event_type,status)
VALUES ('U01','2026-11-01T10:00:00Z',uuid(),'LOGIN','SUCCESS');
INSERT INTO UserEvents (user_id,event_time,event_id,event_type,status)
VALUES ('U01','2026-11-01T10:10:00Z',uuid(),'VIEW','SUCCESS');
INSERT INTO UserEvents (user_id,event_time,event_id,event_type,status)
VALUES ('U02','2026-11-01T11:00:00Z',uuid(),'PAYMENT','PENDING');
SELECT * FROM UserEvents WHERE user_id='U01'
AND event_time >= '2026-11-01T00:00:00Z'
AND event_time < '2026-11-02T00:00:00Z';

-- Q14 Consistency levels
-- With RF=1 these levels have the same single replica to contact.
CONSISTENCY ONE;
SELECT * FROM Students WHERE student_id=1;
CONSISTENCY QUORUM;
SELECT * FROM Students WHERE student_id=1;
CONSISTENCY ALL;
SELECT * FROM Students WHERE student_id=1;
CONSISTENCY QUORUM;
UPDATE Students SET marks=84.0 WHERE student_id=1;

-- To compare behavior meaningfully, use a multi-node cluster and RF=3.
-- Example only: replace datacenter1 with your actual datacenter name.
-- CREATE KEYSPACE CollegeDB_RF3 WITH replication =
-- {'class':'NetworkTopologyStrategy','datacenter1':3};
