// Practical 13: E-commerce graph
CREATE CONSTRAINT customer_id_unique IF NOT EXISTS
FOR (c:Customer) REQUIRE c.customerId IS UNIQUE;
CREATE CONSTRAINT product_id_unique IF NOT EXISTS
FOR (p:Product) REQUIRE p.productId IS UNIQUE;
CREATE CONSTRAINT order_id_unique IF NOT EXISTS
FOR (o:Order) REQUIRE o.orderId IS UNIQUE;

MERGE (c1:Customer {customerId:"C101",name:"Aarav Sharma"});
MERGE (c2:Customer {customerId:"C102",name:"Priya Verma"});
MERGE (p1:Product {productId:"P01",name:"Notebook",price:50});
MERGE (p2:Product {productId:"P02",name:"Backpack",price:700});
MERGE (p3:Product {productId:"P03",name:"Bottle",price:150});
MERGE (cat1:Category {name:"Stationery"});
MERGE (cat2:Category {name:"Accessories"});

MERGE (p1)-[:IN_CATEGORY]->(cat1);
MERGE (p2)-[:IN_CATEGORY]->(cat2);
MERGE (p3)-[:IN_CATEGORY]->(cat2);

MERGE (o1:Order {orderId:"ORD501",date:date("2026-10-20")});
MERGE (o2:Order {orderId:"ORD502",date:date("2026-10-21")});
MERGE (c1)-[:PLACED]->(o1);
MERGE (c2)-[:PLACED]->(o2);
MERGE (o1)-[:CONTAINS {quantity:2}]->(p1);
MERGE (o1)-[:CONTAINS {quantity:1}]->(p3);
MERGE (o2)-[:CONTAINS {quantity:1}]->(p2);

// Products purchased by a particular customer
MATCH (c:Customer {customerId:"C101"})-[:PLACED]->(:Order)-[line:CONTAINS]->(p:Product)
RETURN c.name, p.name, line.quantity, p.price;

// All orders and products
MATCH (c:Customer)-[:PLACED]->(o:Order)-[line:CONTAINS]->(p:Product)
RETURN c,o,line,p;
