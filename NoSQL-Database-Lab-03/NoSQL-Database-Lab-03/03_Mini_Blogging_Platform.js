// Q3. Mini Blogging Platform
use("NoSQL_Lab3");
db.Blogs.drop();

db.Blogs.insertMany([
 {title:"Learning MongoDB",author:{name:"Aarav",email:"aarav@example.test"},category:"Technology",
  tags:["MongoDB","Database","BCA"],comments:[{user:"Priya",text:"Useful post"}],
  publication:{status:"published",date:ISODate("2026-10-01"),views:120}},
 {title:"Python Basics",author:{name:"Priya",email:"priya@example.test"},category:"Education",
  tags:["Python","Programming"],comments:[{user:"Neha",text:"Easy explanation"},{user:"Rahul",text:"Thanks"}],
  publication:{status:"published",date:ISODate("2026-10-05"),views:90}},
 {title:"Cloud Computing",author:{name:"Rahul",email:"rahul@example.test"},category:"Technology",
  tags:["Cloud","Computing"],comments:[],
  publication:{status:"draft",date:null,views:0}},
 {title:"Study Tips",author:{name:"Neha",email:"neha@example.test"},category:"Education",
  tags:["Study","BCA"],comments:[{user:"Aarav",text:"Helpful"}],
  publication:{status:"published",date:ISODate("2026-10-12"),views:150}}
]);

db.Blogs.find().pretty();
// Blogs in Technology category
db.Blogs.find({category:"Technology"});
// Blogs containing MongoDB tag
db.Blogs.find({tags:"MongoDB"});
// Blogs with both BCA tag and Education category
db.Blogs.find({category:"Education",tags:"BCA"});
// Blogs with either Python or MongoDB tag
db.Blogs.find({tags:{$in:["Python","MongoDB"]}});
// Published blogs with at least one comment
db.Blogs.find({ "publication.status":"published", "comments.0":{$exists:true} });
