// Q12. User Notification System
use("NoSQL_Lab3");
db.Notifications.drop();

db.Notifications.insertMany([
 {userId:"U101",type:"message",message:"You have a new message",read:false,createdAt:ISODate("2026-10-20T09:00:00Z")},
 {userId:"U101",type:"order-update",message:"Your order has shipped",read:false,createdAt:ISODate("2026-10-20T10:00:00Z")},
 {userId:"U102",type:"system-alert",message:"Password updated",read:true,createdAt:ISODate("2026-10-20T11:00:00Z")},
 {userId:"U101",type:"system-alert",message:"Profile reminder",read:false,createdAt:ISODate("2026-10-20T12:00:00Z")}
]);

// Retrieve unread notifications for a user
db.Notifications.find({userId:"U101",read:false}).sort({createdAt:-1});
// Mark one notification as read
db.Notifications.updateOne(
 {userId:"U101",type:"message",read:false},
 {$set:{read:true,readAt:new Date()}}
);
// Mark all notifications as read for a user
db.Notifications.updateMany(
 {userId:"U101",read:false},
 {$set:{read:true,readAt:new Date()}}
);
db.Notifications.find({userId:"U101"}).pretty();
