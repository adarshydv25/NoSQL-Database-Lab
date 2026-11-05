#!/usr/bin/env bash
# Practical 5: Different value types. Riak stores bytes; Content-Type describes the value.
BASE="http://127.0.0.1:8098/riak"

# String value
curl -i -X PUT "$BASE/demo_values/greeting" \
  -H "Content-Type: text/plain" \
  --data-binary "Hello from Riak KV"

# JSON document
curl -i -X PUT "$BASE/demo_values/student101" \
  -H "Content-Type: application/json" \
  -d '{"id":101,"name":"Aarav","course":"BCA"}'

# JSON list value
curl -i -X PUT "$BASE/demo_values/course_list" \
  -H "Content-Type: application/json" \
  -d '["BCA","BSc IT","BBA"]'

# Retrieve values
curl -i "$BASE/demo_values/greeting"
curl -i "$BASE/demo_values/student101"
curl -i "$BASE/demo_values/course_list"
