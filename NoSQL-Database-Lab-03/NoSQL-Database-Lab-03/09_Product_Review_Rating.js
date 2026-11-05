// Q9. Product Review and Rating System
use("NoSQL_Lab3");
db.ProductReviews.drop();

db.ProductReviews.insertMany([
 {productId:"P01",productName:"Notebook",customer:"Aarav",rating:5,review:"Very good"},
 {productId:"P01",productName:"Notebook",customer:"Priya",rating:4,review:"Good quality"},
 {productId:"P01",productName:"Notebook",customer:"Neha",rating:5,review:"Useful"},
 {productId:"P02",productName:"Backpack",customer:"Rahul",rating:3,review:"Average"},
 {productId:"P02",productName:"Backpack",customer:"Karan",rating:4,review:"Good"}
]);

db.ProductReviews.find().pretty();
// Average rating and review count per product
db.ProductReviews.aggregate([
 {$group:{
  _id:"$productId",
  productName:{$first:"$productName"},
  averageRating:{$avg:"$rating"},
  reviewCount:{$sum:1}
 }},
 {$project:{_id:0,productId:"$_id",productName:1,averageRating:{$round:["$averageRating",2]},reviewCount:1}},
 {$sort:{averageRating:-1}}
]);
