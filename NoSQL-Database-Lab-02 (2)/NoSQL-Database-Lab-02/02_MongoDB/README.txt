MONGODB - COLLEGEDB, ORDERS, SHARDING AND MAPREDUCE

Start MongoDB Server, then open PowerShell/CMD:
  mongosh
In mongosh run:
  load("02_MongoDB/college_students.js")
  load("02_MongoDB/orders_embedded.js")
  load("02_MongoDB/mapreduce_course.js")

The scripts use database CollegeDB and collections Students, Orders and MapReduceStudents.

Basic CRUD task:
- Display: db.Students.find()
- Course search: db.Students.find({Course:"BCA"})
- Update: db.Students.updateOne({Student_ID:101}, {$set:{Marks:85}})
- Delete: db.Students.deleteOne({Student_ID:105})
- Count: db.Students.countDocuments()

Sharding:
Read 02_MongoDB/sharding_setup.txt. Sharding requires a config server replica set,
two shard replica sets and mongos. The commands are a guided local demo, not a single
mongosh script. Use Docker files in 08_Docker_Demos for a contained practice environment.

MapReduce:
MongoDB's mapReduce command is deprecated in modern versions. The provided aggregation
pipeline is the recommended current approach and returns course-wise student count and
average marks. A classic map/reduce example is also included for learning where supported.
