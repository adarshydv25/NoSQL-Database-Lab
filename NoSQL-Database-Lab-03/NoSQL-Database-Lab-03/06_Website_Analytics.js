// Q6. Website Analytics System
use("NoSQL_Lab3");
db.PageVisits.drop();

db.PageVisits.insertMany([
 {page:"/home",userId:"U1",device:"mobile",browser:"Chrome",location:"Roorkee",time:ISODate("2026-10-20T08:00:00Z")},
 {page:"/home",userId:"U2",device:"desktop",browser:"Edge",location:"Haridwar",time:ISODate("2026-10-20T08:10:00Z")},
 {page:"/courses",userId:"U1",device:"mobile",browser:"Chrome",location:"Roorkee",time:ISODate("2026-10-20T08:20:00Z")},
 {page:"/home",userId:"U3",device:"tablet",browser:"Safari",location:"Dehradun",time:ISODate("2026-10-20T08:30:00Z")},
 {page:"/courses",userId:"U4",device:"mobile",browser:"Chrome",location:"Haridwar",time:ISODate("2026-10-20T08:40:00Z")},
 {page:"/login",userId:"U2",device:"desktop",browser:"Edge",location:"Haridwar",time:ISODate("2026-10-20T08:50:00Z")}
]);

// Most visited pages
db.PageVisits.aggregate([
 {$group:{_id:"$page",visits:{$sum:1}}},
 {$sort:{visits:-1}}
]);
// Commonly used devices
db.PageVisits.aggregate([
 {$group:{_id:"$device",uses:{$sum:1}}},
 {$sort:{uses:-1}}
]);
// Visits by browser and device
db.PageVisits.aggregate([
 {$group:{_id:{browser:"$browser",device:"$device"},visits:{$sum:1}}},
 {$sort:{visits:-1}}
]);
