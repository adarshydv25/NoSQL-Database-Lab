// Task 3: Orders with embedded customer and product documents
use("CollegeDB");
db.Orders.drop();

db.Orders.insertMany([
  {
    Order_ID:1001,
    customer:{customer_id:1, name:"Aarav Sharma", city:"Roorkee"},
    products:[
      {product_id:"P01", name:"Notebook", price:50, quantity:2},
      {product_id:"P02", name:"Pen Pack", price:30, quantity:1}
    ]
  },
  {
    Order_ID:1002,
    customer:{customer_id:2, name:"Priya Verma", city:"Haridwar"},
    products:[
      {product_id:"P03", name:"Backpack", price:700, quantity:1},
      {product_id:"P04", name:"Bottle", price:150, quantity:2}
    ]
  },
  {
    Order_ID:1003,
    customer:{customer_id:1, name:"Aarav Sharma", city:"Roorkee"},
    products:[
      {product_id:"P05", name:"Calculator", price:450, quantity:1}
    ]
  },
  {
    Order_ID:1004,
    customer:{customer_id:3, name:"Rahul Singh", city:"Dehradun"},
    products:[
      {product_id:"P01", name:"Notebook", price:50, quantity:5},
      {product_id:"P06", name:"File Folder", price:80, quantity:3}
    ]
  },
  {
    Order_ID:1005,
    customer:{customer_id:4, name:"Neha Gupta", city:"Roorkee"},
    products:[
      {product_id:"P07", name:"Headphones", price:900, quantity:1},
      {product_id:"P04", name:"Bottle", price:150, quantity:1}
    ]
  }
]);

// 1. Display all orders
db.Orders.find().pretty();

// 2. Orders of a particular customer
db.Orders.find({"customer.name":"Aarav Sharma"});

// 3. Update quantity of a product in an order
db.Orders.updateOne(
  {Order_ID:1001, "products.product_id":"P01"},
  {$set:{"products.$.quantity":3}}
);

// 4. Calculate total amount for each order
db.Orders.aggregate([
  {$unwind:"$products"},
  {$group:{
    _id:"$Order_ID",
    customer:{$first:"$customer.name"},
    totalAmount:{$sum:{$multiply:["$products.price","$products.quantity"]}}
  }},
  {$sort:{_id:1}}
]);

// 5. Display orders above a specified amount (example: 500)
db.Orders.aggregate([
  {$unwind:"$products"},
  {$group:{
    _id:"$Order_ID",
    customer:{$first:"$customer.name"},
    totalAmount:{$sum:{$multiply:["$products.price","$products.quantity"]}}
  }},
  {$match:{totalAmount:{$gt:500}}},
  {$sort:{totalAmount:-1}}
]);
