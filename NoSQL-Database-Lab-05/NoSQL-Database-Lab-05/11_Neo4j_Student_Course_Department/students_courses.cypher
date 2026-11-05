// Practical 11: Student, Course and Department graph

CREATE CONSTRAINT student_id_unique IF NOT EXISTS
FOR (s:Student) REQUIRE s.studentId IS UNIQUE;
CREATE CONSTRAINT course_code_unique IF NOT EXISTS
FOR (c:Course) REQUIRE c.code IS UNIQUE;
CREATE CONSTRAINT dept_name_unique IF NOT EXISTS
FOR (d:Department) REQUIRE d.name IS UNIQUE;

MERGE (d1:Department {name:"Computer Applications"});
MERGE (d2:Department {name:"Information Technology"});

MERGE (c1:Course {code:"BCA", name:"Bachelor of Computer Applications"});
MERGE (c2:Course {code:"BSCIT", name:"BSc Information Technology"});
MERGE (c3:Course {code:"BBA", name:"Bachelor of Business Administration"});

MERGE (c1)-[:BELONGS_TO]->(d1);
MERGE (c2)-[:BELONGS_TO]->(d2);
MERGE (c3)-[:BELONGS_TO]->(d1);

UNWIND [
 {id:101,name:"Aarav Sharma"},
 {id:102,name:"Priya Verma"},
 {id:103,name:"Rahul Singh"},
 {id:104,name:"Neha Gupta"},
 {id:105,name:"Karan Joshi"}
] AS row
MERGE (s:Student {studentId:row.id})
SET s.name = row.name;

MATCH (s:Student {studentId:101}), (c:Course {code:"BCA"})
MERGE (s)-[:ENROLLED_IN]->(c);
MATCH (s:Student {studentId:102}), (c:Course {code:"BCA"})
MERGE (s)-[:ENROLLED_IN]->(c);
MATCH (s:Student {studentId:103}), (c:Course {code:"BSCIT"})
MERGE (s)-[:ENROLLED_IN]->(c);
MATCH (s:Student {studentId:104}), (c:Course {code:"BCA"})
MERGE (s)-[:ENROLLED_IN]->(c);
MATCH (s:Student {studentId:105}), (c:Course {code:"BBA"})
MERGE (s)-[:ENROLLED_IN]->(c);

// Visualize full graph
MATCH (s:Student)-[r:ENROLLED_IN]->(c:Course)-[r2:BELONGS_TO]->(d:Department)
RETURN s,r,c,r2,d;
