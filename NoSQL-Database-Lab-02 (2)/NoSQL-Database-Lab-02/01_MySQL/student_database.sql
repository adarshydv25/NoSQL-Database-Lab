CREATE DATABASE IF NOT EXISTS CollegeDB_RDBMS;
USE CollegeDB_RDBMS;

DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(60) NOT NULL,
    Course VARCHAR(30) NOT NULL,
    Semester INT NOT NULL,
    Marks DECIMAL(5,2) NOT NULL
);

INSERT INTO Student (Student_ID, Name, Course, Semester, Marks) VALUES
(101, 'Aarav Sharma', 'BCA', 5, 82),
(102, 'Priya Verma', 'BCA', 5, 91),
(103, 'Rahul Singh', 'BSc IT', 3, 76),
(104, 'Neha Gupta', 'BCA', 3, 88),
(105, 'Karan Joshi', 'BSc IT', 5, 69);

SELECT * FROM Student;
SELECT * FROM Student WHERE Course = 'BCA';
SELECT COUNT(*) AS Total_Students FROM Student;
