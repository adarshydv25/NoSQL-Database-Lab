// Q13. Course Learning Platform
use("NoSQL_Lab3");
db.LearningCourses.drop();

db.LearningCourses.insertMany([
 {courseId:"C01",title:"MongoDB Basics",instructor:"Dr Sharma",
  modules:[{name:"Introduction",lessons:4},{name:"CRUD",lessons:5}],
  students:[{studentId:101,name:"Aarav",progress:100,completed:true},{studentId:102,name:"Priya",progress:60,completed:false}]},
 {courseId:"C02",title:"Python Programming",instructor:"Ms Verma",
  modules:[{name:"Basics",lessons:5},{name:"Functions",lessons:4}],
  students:[{studentId:103,name:"Rahul",progress:40,completed:false},{studentId:104,name:"Neha",progress:100,completed:true}]},
 {courseId:"C03",title:"Database Design",instructor:"Mr Singh",
  modules:[{name:"Relational DB",lessons:4},{name:"NoSQL",lessons:6}],
  students:[{studentId:101,name:"Aarav",progress:75,completed:false}]}
]);

// Students with progress at least 75%
db.LearningCourses.aggregate([
 {$unwind:"$students"},
 {$match:{"students.progress":{$gte:75}}},
 {$project:{course:"$title",student:"$students.name",progress:"$students.progress",completed:"$students.completed"}}
]);
// Completed students
db.LearningCourses.aggregate([
 {$unwind:"$students"},
 {$match:{"students.completed":true}},
 {$project:{course:"$title",student:"$students.name",progress:"$students.progress"}}
]);
// Students with incomplete progress
db.LearningCourses.aggregate([
 {$unwind:"$students"},
 {$match:{"students.completed":false}},
 {$project:{course:"$title",student:"$students.name",progress:"$students.progress"}}
]);
