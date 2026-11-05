// Q14. Real-Time Order Tracking with status history
use("NoSQL_Lab3");
db.OrderTracking.drop();

db.OrderTracking.insertMany([
 {orderId:"ORD501",customer:"Aarav",currentStatus:"Shipped",
  statusHistory:[
   {status:"Placed",time:ISODate("2026-10-20T08:00:00Z")},
   {status:"Confirmed",time:ISODate("2026-10-20T08:15:00Z")},
   {status:"Shipped",time:ISODate("2026-10-20T12:00:00Z")}
  ]},
 {orderId:"ORD502",customer:"Priya",currentStatus:"Delivered",
  statusHistory:[
   {status:"Placed",time:ISODate("2026-10-18T08:00:00Z")},
   {status:"Confirmed",time:ISODate("2026-10-18T08:20:00Z")},
   {status:"Shipped",time:ISODate("2026-10-19T08:00:00Z")},
   {status:"Delivered",time:ISODate("2026-10-20T10:00:00Z")}
  ]}
]);

// Current status of an order
db.OrderTracking.findOne({orderId:"ORD501"},{orderId:1,currentStatus:1});
// Complete status history
db.OrderTracking.findOne({orderId:"ORD501"},{orderId:1,statusHistory:1});
// Move order to Delivered and append history
db.OrderTracking.updateOne(
 {orderId:"ORD501"},
 {$set:{currentStatus:"Delivered"},
  $push:{statusHistory:{status:"Delivered",time:new Date()}}}
);
db.OrderTracking.find({orderId:"ORD501"}).pretty();
