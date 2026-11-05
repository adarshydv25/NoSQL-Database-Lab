// Task 2: CollegeDB database and Students collection
use("CollegeDB");

db.Students.drop();

db.Students.insertMany([
  {Student_ID:101, Name:"Aarav Sharma", Course:"BCA", Semester:5, Marks:82},
  {Student_ID:102, Name:"Priya Verma", Course:"BCA", Semester:5, Marks:91},
  {Student_ID:103, Name:"Rahul Singh", Course:"BSc IT", Semester:3, Marks:76},
  {Student_ID:104, Name:"Neha Gupta", Course:"BCA", Semester:3, Marks:88},
  {Student_ID:105, Name:"Karan Joshi", Course:"BSc IT", Semester:5, Marks:69}
]);

// 1. Display all documents
db.Students.find().pretty();

// 2. Find students from a particular course
db.Students.find({Course:"BCA"});

// 3. Update marks of a student
db.Students.updateOne(
  {Student_ID:101},
  {$set:{Marks:85}}
);

// 4. Delete one student (use this after verifying the inserted records)
db.Students.deleteOne({Student_ID:105});

// 5. Count total students after deletion
db.Students.countDocuments();
