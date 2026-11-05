// Q8. Shopping Cart using embedded documents
use("NoSQL_Lab3");
db.ShoppingCarts.drop();

db.ShoppingCarts.insertOne({
 userId:"U101",
 customerName:"Aarav Sharma",
 items:[
  {productId:"P01",name:"Notebook",price:50,quantity:2},
  {productId:"P02",name:"Pen Pack",price:30,quantity:1}
 ]
});

// Add product to cart
db.ShoppingCarts.updateOne(
 {userId:"U101"},
 {$push:{items:{productId:"P03",name:"Bottle",price:150,quantity:1}}}
);

// Change quantity of an existing product
db.ShoppingCarts.updateOne(
 {userId:"U101","items.productId":"P01"},
 {$set:{"items.$.quantity":4}}
);

// Remove a product
db.ShoppingCarts.updateOne(
 {userId:"U101"},
 {$pull:{items:{productId:"P02"}}}
);

// Calculate cart value
db.ShoppingCarts.aggregate([
 {$match:{userId:"U101"}},
 {$unwind:"$items"},
 {$group:{_id:"$userId",cartValue:{$sum:{$multiply:["$items.price","$items.quantity"]}}}}
]);

db.ShoppingCarts.find({userId:"U101"}).pretty();
