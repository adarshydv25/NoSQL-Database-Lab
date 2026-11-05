// Q4. Flexible Product Catalog
use("NoSQL_Lab3");
db.ProductCatalog.drop();

db.ProductCatalog.insertMany([
 {productId:"L01",name:"StudyBook Pro",category:"laptop",price:62000,attributes:{ramGB:16,storageGB:512,processor:"Core i5",screenInches:15.6}},
 {productId:"L02",name:"LiteBook",category:"laptop",price:45000,attributes:{ramGB:8,storageGB:512,processor:"Ryzen 5",screenInches:14}},
 {productId:"M01",name:"Smart X",category:"mobile",price:22000,attributes:{ramGB:8,storageGB:128,cameraMP:50,batteryMah:5000}},
 {productId:"M02",name:"Smart Mini",category:"mobile",price:14000,attributes:{ramGB:6,storageGB:128,cameraMP:48,batteryMah:4500}},
 {productId:"C01",name:"ClickPro",category:"camera",price:58000,attributes:{megapixels:24,lensMount:"X",video:"4K"}},
 {productId:"C02",name:"TravelCam",category:"camera",price:32000,attributes:{megapixels:20,lensMount:"M",video:"Full HD"}}
]);

db.ProductCatalog.find().pretty();
// Laptops with at least 16 GB RAM
db.ProductCatalog.find({category:"laptop","attributes.ramGB":{$gte:16}});
// Mobiles with 5000 mAh battery
db.ProductCatalog.find({category:"mobile","attributes.batteryMah":{$gte:5000}});
// Cameras with 24 megapixels or more
db.ProductCatalog.find({category:"camera","attributes.megapixels":{$gte:24}});
// Products below 30000
db.ProductCatalog.find({price:{$lt:30000}});
