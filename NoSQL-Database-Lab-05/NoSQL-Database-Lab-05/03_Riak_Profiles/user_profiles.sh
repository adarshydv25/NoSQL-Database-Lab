#!/usr/bin/env bash
# Practical 3: User profiles and preferences in Riak KV
BASE="http://127.0.0.1:8098/riak"

curl -i -X PUT "$BASE/user_profiles/user101" \
  -H "Content-Type: application/json" \
  -d '{
    "name":"Aarav Sharma",
    "email":"aarav@example.test",
    "city":"Roorkee",
    "language":"English",
    "theme":"light",
    "notifications":{"email":true,"sms":false,"push":true}
  }'

# GET profile by key
curl -i "$BASE/user_profiles/user101"

# Update preference: send the complete new JSON object with PUT
curl -i -X PUT "$BASE/user_profiles/user101" \
  -H "Content-Type: application/json" \
  -d '{
    "name":"Aarav Sharma",
    "email":"aarav@example.test",
    "city":"Roorkee",
    "language":"Hindi",
    "theme":"dark",
    "notifications":{"email":true,"sms":false,"push":true}
  }'

curl -i "$BASE/user_profiles/user101"
