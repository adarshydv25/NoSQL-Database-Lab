// Q5. E-Commerce Order Management System
use("NoSQL_Lab3");
db.Customers.drop(); db.Products.drop(); db.CustomerOrders.drop();

db.Customers.insertMany([
 {_id:"C101",name:"Aarav Sharma",city:"Roorkee"},
 {_id:"C102",name:"Priya Verma",city:"Haridwar"},
 {_id:"C103",name:"Rahul Singh",city:"Dehradun"}
]);
db.Products.insertMany([
 {_id:"P01",name:"Notebook",price:50},
 {_id:"P02",name:"Pen Pack",price:30},
 {_id:"P03",name:"Backpack",price:700},
 {_id:"P04",name:"Bottle",price:150}
]);
db.CustomerOrders.insertMany([
 {orderId:501,customerId:"C101",date:ISODate("2026-10-01"),items:[{productId:"P01",name:"Notebook",price:50,qty:2},{productId:"P02",name:"Pen Pack",price:30,qty:1}]},
 {orderId:502,customerId:"C102",date:ISODate("2026-10-03"),items:[{productId:"P03",name:"Backpack",price:700,qty:1}]},
 {orderId:503,customerId:"C101",date:ISODate("2026-10-10"),items:[{productId:"P04",name:"Bottle",price:150,qty:2}]},
 {orderId:504,customerId:"C103",date:ISODate("2026-10-12"),items:[{productId:"P01",name:"Notebook",price:50,qty:5}]}
]);

// Customer's complete purchase history
db.CustomerOrders.find({customerId:"C101"}).sort({date:-1}).pretty();
// Calculate order totals
db.CustomerOrders.aggregate([
 {$unwind:"$items"},
 {$group:{_id:"$orderId",customerId:{$first:"$customerId"},orderTotal:{$sum:{$multiply:["$items.price","$items.qty"]}}}},
 {$sort:{_id:1}}
]);
// Customer details with purchase history using lookup
db.Customers.aggregate([
 {$match:{_id:"C101"}},
 {$lookup:{from:"CustomerOrders",localField:"_id",foreignField:"customerId",as:"purchaseHistory"}}
]);
