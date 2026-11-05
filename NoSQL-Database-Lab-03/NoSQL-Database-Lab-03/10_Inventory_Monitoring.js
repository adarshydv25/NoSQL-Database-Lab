// Q10. Inventory Monitoring System
use("NoSQL_Lab3");
db.Inventory.drop();

db.Inventory.insertMany([
 {productId:"P01",name:"Notebook",stock:8,minStock:10,supplier:"ABC Traders",restockDate:ISODate("2026-11-10")},
 {productId:"P02",name:"Pen Pack",stock:50,minStock:15,supplier:"WriteWell",restockDate:ISODate("2026-11-15")},
 {productId:"P03",name:"Backpack",stock:3,minStock:5,supplier:"Bag House",restockDate:ISODate("2026-11-07")},
 {productId:"P04",name:"Bottle",stock:20,minStock:10,supplier:"Daily Needs",restockDate:ISODate("2026-11-20")},
 {productId:"P05",name:"Calculator",stock:0,minStock:5,supplier:"ABC Traders",restockDate:ISODate("2026-11-06")}
]);

// Products needing immediate restocking
db.Inventory.find({$expr:{$lte:["$stock","$minStock"]}}).sort({stock:1});
// Critical stock is zero
db.Inventory.find({stock:0});
// Update stock after new supply arrives
db.Inventory.updateOne({productId:"P05"},{$inc:{stock:20}});
