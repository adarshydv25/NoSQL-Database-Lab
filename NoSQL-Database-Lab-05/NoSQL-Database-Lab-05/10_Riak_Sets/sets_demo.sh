#!/usr/bin/env bash
# Practical 10: Riak data types - Set CRDT example.
# Riak Set data type endpoints vary by release. This example uses the Riak KV data type
# HTTP API style. Confirm support and exact API against your installed Riak version.

BASE="http://127.0.0.1:8098/types"

# Create a set and add elements (Riak Set CRDT)
curl -i -X POST "$BASE/default/buckets/user_interests/datatypes/aarav" \
  -H "Content-Type: application/json" \
  -d '{"add":["coding","music","cricket"]}'

# Add another element
curl -i -X POST "$BASE/default/buckets/user_interests/datatypes/aarav" \
  -H "Content-Type: application/json" \
  -d '{"add":["reading"]}'

# Read the set
curl -i "$BASE/default/buckets/user_interests/datatypes/aarav"

# Remove an element
curl -i -X POST "$BASE/default/buckets/user_interests/datatypes/aarav" \
  -H "Content-Type: application/json" \
  -d '{"remove":["music"]}'

# Read after removal
curl -i "$BASE/default/buckets/user_interests/datatypes/aarav"
