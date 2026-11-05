#!/usr/bin/env bash
# Practical 4: One cart object per user.
# Riak KV stores the cart JSON as one value. The application reads, edits and PUTs
# the complete updated value. This is not a multi-object transaction.
BASE="http://127.0.0.1:8098/riak"

# Create cart with two products
curl -i -X PUT "$BASE/shopping_carts/user101" \
  -H "Content-Type: application/json" \
  -d '{
    "user_id":"user101",
    "items":[
      {"product_id":"P01","name":"Notebook","quantity":2,"price":50},
      {"product_id":"P02","name":"Pen Pack","quantity":1,"price":30}
    ],
    "total":130
  }'

# Retrieve cart
curl -i "$BASE/shopping_carts/user101"

# Update product quantity and total by replacing the cart value
curl -i -X PUT "$BASE/shopping_carts/user101" \
  -H "Content-Type: application/json" \
  -d '{
    "user_id":"user101",
    "items":[
      {"product_id":"P01","name":"Notebook","quantity":3,"price":50},
      {"product_id":"P02","name":"Pen Pack","quantity":1,"price":30}
    ],
    "total":180
  }'

# Remove P02 and update total
curl -i -X PUT "$BASE/shopping_carts/user101" \
  -H "Content-Type: application/json" \
  -d '{
    "user_id":"user101",
    "items":[
      {"product_id":"P01","name":"Notebook","quantity":3,"price":50}
    ],
    "total":150
  }'

# Verify final cart
curl -i "$BASE/shopping_carts/user101"
