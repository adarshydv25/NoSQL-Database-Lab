// Q2. Event Logging System
use("NoSQL_Lab3");
db.EventLogs.drop();

db.EventLogs.insertMany([
 {user:"aarav",event:"login",time:ISODate("2026-10-20T09:00:00Z"),ip:"192.168.1.10"},
 {user:"aarav",event:"failed-login",time:ISODate("2026-10-20T09:05:00Z"),ip:"192.168.1.10"},
 {user:"aarav",event:"failed-login",time:ISODate("2026-10-20T09:06:00Z"),ip:"192.168.1.10"},
 {user:"aarav",event:"failed-login",time:ISODate("2026-10-20T09:07:00Z"),ip:"192.168.1.10"},
 {user:"priya",event:"file-upload",time:ISODate("2026-10-20T10:00:00Z"),file:"assignment.pdf"},
 {user:"priya",event:"password-change",time:ISODate("2026-10-20T10:15:00Z")},
 {user:"rahul",event:"login",time:ISODate("2026-10-20T11:00:00Z")},
 {user:"rahul",event:"logout",time:ISODate("2026-10-20T12:00:00Z")},
 {user:"neha",event:"failed-login",time:ISODate("2026-10-20T12:05:00Z"),ip:"192.168.1.20"}
]);

// All events
db.EventLogs.find().pretty();
// Repeated failed-login attempts by user (2 or more)
db.EventLogs.aggregate([
 {$match:{event:"failed-login"}},
 {$group:{_id:"$user",failedAttempts:{$sum:1},lastAttempt:{$max:"$time"}}},
 {$match:{failedAttempts:{$gte:2}}},
 {$sort:{failedAttempts:-1}}
]);
// Frequently occurring event types
db.EventLogs.aggregate([
 {$group:{_id:"$event",total:{$sum:1}}},
 {$sort:{total:-1}}
]);
// Events for one user, newest first
db.EventLogs.find({user:"aarav"}).sort({time:-1});
