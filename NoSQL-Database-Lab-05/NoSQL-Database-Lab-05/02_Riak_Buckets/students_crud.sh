#!/usr/bin/env bash
# Practical 1: Riak bucket named students and key-value CRUD
# Run while Riak HTTP API is reachable at localhost:8098.

BASE="http://127.0.0.1:8098/riak"
TYPE="default"

# Create/store a student record (PUT)
curl -i -X PUT "$BASE/students/101" \
  -H "Content-Type: application/json" \
  -d '{"student_id":101,"name":"Aarav Sharma","course":"BCA","semester":5,"marks":82}'

# Retrieve by key (GET)
curl -i "$BASE/students/101"

# Update the value by PUT to the same bucket/key
curl -i -X PUT "$BASE/students/101" \
  -H "Content-Type: application/json" \
  -d '{"student_id":101,"name":"Aarav Sharma","course":"BCA","semester":5,"marks":88}'

# Retrieve updated value
curl -i "$BASE/students/101"

# Delete by key (DELETE)
curl -i -X DELETE "$BASE/students/101"

# Confirm the object is no longer returned
curl -i "$BASE/students/101"
