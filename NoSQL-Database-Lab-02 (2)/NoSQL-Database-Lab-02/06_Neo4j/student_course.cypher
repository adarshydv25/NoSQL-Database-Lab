// 1. Create at least five students and three courses
CREATE CONSTRAINT student_id_unique IF NOT EXISTS
FOR (s:Student) REQUIRE s.Student_ID IS UNIQUE;

CREATE CONSTRAINT course_name_unique IF NOT EXISTS
FOR (c:Course) REQUIRE c.Name IS UNIQUE;

UNWIND [
  {id:101, name:'Aarav Sharma'},
  {id:102, name:'Priya Verma'},
  {id:103, name:'Rahul Singh'},
  {id:104, name:'Neha Gupta'},
  {id:105, name:'Karan Joshi'}
] AS row
MERGE (:Student {Student_ID:row.id, Name:row.name});

UNWIND ['BCA', 'BSc IT', 'BBA'] AS courseName
MERGE (:Course {Name:courseName});

// Create enrolments
MATCH (s:Student {Student_ID:101}), (c:Course {Name:'BCA'})
MERGE (s)-[:ENROLLED_IN]->(c);
MATCH (s:Student {Student_ID:102}), (c:Course {Name:'BCA'})
MERGE (s)-[:ENROLLED_IN]->(c);
MATCH (s:Student {Student_ID:103}), (c:Course {Name:'BSc IT'})
MERGE (s)-[:ENROLLED_IN]->(c);
MATCH (s:Student {Student_ID:104}), (c:Course {Name:'BCA'})
MERGE (s)-[:ENROLLED_IN]->(c);
MATCH (s:Student {Student_ID:105}), (c:Course {Name:'BBA'})
MERGE (s)-[:ENROLLED_IN]->(c);

// 2. Display all students
MATCH (s:Student) RETURN s ORDER BY s.Student_ID;

// 3. Find students enrolled in a particular course
MATCH (s:Student)-[:ENROLLED_IN]->(c:Course {Name:'BCA'})
RETURN s.Name, s.Student_ID;

// 4. Display all courses taken by a particular student
MATCH (s:Student {Student_ID:101})-[:ENROLLED_IN]->(c:Course)
RETURN s.Name, collect(c.Name) AS Courses;

// 5a. Add a relationship
MATCH (s:Student {Student_ID:103}), (c:Course {Name:'BCA'})
MERGE (s)-[:ENROLLED_IN]->(c);

// 5b. Remove a relationship
MATCH (s:Student {Student_ID:103})-[r:ENROLLED_IN]->(c:Course {Name:'BCA'})
DELETE r;
