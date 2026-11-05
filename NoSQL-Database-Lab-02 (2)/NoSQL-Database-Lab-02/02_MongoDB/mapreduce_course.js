// Task 14: Course-wise count and average marks.
// Aggregation is recommended for current MongoDB versions.
use("CollegeDB");
db.MapReduceStudents.drop();

db.MapReduceStudents.insertMany([
  {Student_ID:101, Name:"Aarav Sharma", Course:"BCA", Marks:82},
  {Student_ID:102, Name:"Priya Verma", Course:"BCA", Marks:91},
  {Student_ID:103, Name:"Rahul Singh", Course:"BSc IT", Marks:76},
  {Student_ID:104, Name:"Neha Gupta", Course:"BCA", Marks:88},
  {Student_ID:105, Name:"Karan Joshi", Course:"BSc IT", Marks:69}
]);

// Map stage: groups each document by Course.
// Reduce stage: calculates count and total marks; final stage calculates average.
db.MapReduceStudents.aggregate([
  {$group:{
    _id:"$Course",
    studentCount:{$sum:1},
    totalMarks:{$sum:"$Marks"},
    averageMarks:{$avg:"$Marks"}
  }},
  {$project:{
    _id:0,
    Course:"$_id",
    studentCount:1,
    totalMarks:1,
    averageMarks:{$round:["$averageMarks",2]}
  }},
  {$sort:{Course:1}}
]);
