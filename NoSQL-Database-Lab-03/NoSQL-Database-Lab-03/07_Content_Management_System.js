// Q7. Content Management System
use("NoSQL_Lab3");
db.Articles.drop();

db.Articles.insertMany([
 {title:"MongoDB Introduction",author:{id:1,name:"Aarav"},category:"Technology",tags:["MongoDB","Database"],status:"published",publishedAt:ISODate("2026-10-01")},
 {title:"Python for Beginners",author:{id:2,name:"Priya"},category:"Education",tags:["Python","Programming"],status:"published",publishedAt:ISODate("2026-10-05")},
 {title:"Cloud Notes",author:{id:1,name:"Aarav"},category:"Technology",tags:["Cloud"],status:"draft",publishedAt:null},
 {title:"Exam Preparation",author:{id:3,name:"Neha"},category:"Education",tags:["Exam","Study"],status:"review",publishedAt:null}
]);

db.Articles.find({status:"published"});
db.Articles.find({status:{$ne:"published"}});
db.Articles.find({category:"Technology",status:"published"});
db.Articles.find({tags:"Python"});
db.Articles.find({"author.name":"Aarav"});
