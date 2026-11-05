// Q1. Student Activity Tracking System
use("NoSQL_Lab3");
db.StudentActivity.drop();

db.StudentActivity.insertMany([
 {studentId:101,name:"Aarav Sharma",courses:["BCA","DBMS"],attendance:88,skills:["HTML","Java","MongoDB"],
  activities:[{type:"quiz",title:"MongoDB Quiz",date:ISODate("2026-10-10"),score:85},{type:"assignment",title:"DBMS Task",date:ISODate("2026-10-15")}]},
 {studentId:102,name:"Priya Verma",courses:["BCA","Java"],attendance:96,skills:["Python","Java","SQL"],
  activities:[{type:"login",title:"Portal Login",date:ISODate("2026-10-18")},{type:"project",title:"Student App",date:ISODate("2026-10-20")}]},
 {studentId:103,name:"Rahul Singh",courses:["BSc IT","DBMS"],attendance:72,skills:["C","HTML"],
  activities:[{type:"quiz",title:"DBMS Quiz",date:ISODate("2026-10-12"),score:60}]},
 {studentId:104,name:"Neha Gupta",courses:["BCA","Python"],attendance:91,skills:["Python","MongoDB"],
  activities:[{type:"assignment",title:"Python Work",date:ISODate("2026-10-22")}]},
 {studentId:105,name:"Karan Joshi",courses:["BSc IT"],attendance:65,skills:["C++"],
  activities:[{type:"login",title:"Portal Login",date:ISODate("2026-10-05")}]}
]);

// All students
db.StudentActivity.find().pretty();
// Students enrolled in BCA
db.StudentActivity.find({courses:"BCA"});
// Students with attendance of at least 85%
db.StudentActivity.find({attendance:{$gte:85}});
// Students with MongoDB skill
db.StudentActivity.find({skills:"MongoDB"});
// Students who completed a quiz activity
db.StudentActivity.find({"activities.type":"quiz"});
// Students with a recent activity after 15 October 2026
db.StudentActivity.find({"activities.date":{$gte:ISODate("2026-10-15")}});
