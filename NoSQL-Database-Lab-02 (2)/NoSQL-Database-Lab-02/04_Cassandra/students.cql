CREATE KEYSPACE IF NOT EXISTS CollegeDB
WITH replication = {'class':'SimpleStrategy', 'replication_factor':1};

USE CollegeDB;

DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
    Student_ID int PRIMARY KEY,
    Name text,
    Course text,
    Semester int,
    Marks int
);

INSERT INTO Students (Student_ID, Name, Course, Semester, Marks)
VALUES (101, 'Aarav Sharma', 'BCA', 5, 82);
INSERT INTO Students (Student_ID, Name, Course, Semester, Marks)
VALUES (102, 'Priya Verma', 'BCA', 5, 91);
INSERT INTO Students (Student_ID, Name, Course, Semester, Marks)
VALUES (103, 'Rahul Singh', 'BSc IT', 3, 76);
INSERT INTO Students (Student_ID, Name, Course, Semester, Marks)
VALUES (104, 'Neha Gupta', 'BCA', 3, 88);
INSERT INTO Students (Student_ID, Name, Course, Semester, Marks)
VALUES (105, 'Karan Joshi', 'BSc IT', 5, 69);

-- 1 and 2. Display all records
SELECT * FROM Students;

-- 3. Course search: index is suitable only for this small demo
CREATE INDEX IF NOT EXISTS students_course_idx ON Students (Course);
SELECT * FROM Students WHERE Course = 'BCA';

-- 4. Update marks
UPDATE Students SET Marks = 85 WHERE Student_ID = 101;

-- 5. Delete a record
DELETE FROM Students WHERE Student_ID = 105;

SELECT * FROM Students;
