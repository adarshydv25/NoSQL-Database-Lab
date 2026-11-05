#!/usr/bin/env bash
# Practical 6: Demonstrate read/write quorum parameters.
# The bucket must have suitable n_val and cluster configuration for the requested quorum.
BASE="http://127.0.0.1:8098/riak"

# Write quorum example: w=2, dw=2
curl -i -X PUT "$BASE/quorum_students/201?w=2&dw=2" \
  -H "Content-Type: application/json" \
  -d '{"student_id":201,"name":"Meera","course":"BCA"}'

# Read quorum example: r=2
curl -i "$BASE/quorum_students/201?r=2"

# Stronger quorum-style settings can increase confidence that multiple replicas
# participated, but may reduce availability when nodes are unavailable.
