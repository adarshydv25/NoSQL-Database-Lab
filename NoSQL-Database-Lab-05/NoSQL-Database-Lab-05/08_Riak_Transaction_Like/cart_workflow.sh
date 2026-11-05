#!/usr/bin/env bash
# Practical 8: Transaction-like shopping workflow using one cart object.
# Read-modify-write workflow is application logic, not an ACID multi-key transaction.
BASE="http://127.0.0.1:8098/riak"

# Step 1: Create cart
curl -s -X PUT "$BASE/cart_workflow/user202" \
 -H "Content-Type: application/json" \
 -d '{"user_id":"user202","items":[],"total":0}'

# Step 2: Add item
curl -s -X PUT "$BASE/cart_workflow/user202" \
 -H "Content-Type: application/json" \
 -d '{"user_id":"user202","items":[{"product_id":"P10","qty":1,"price":200}],"total":200}'

# Step 3: Update quantity and total
curl -s -X PUT "$BASE/cart_workflow/user202" \
 -H "Content-Type: application/json" \
 -d '{"user_id":"user202","items":[{"product_id":"P10","qty":2,"price":200}],"total":400}'

# Step 4: Read final cart
curl -i "$BASE/cart_workflow/user202"
