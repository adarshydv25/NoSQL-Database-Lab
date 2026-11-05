#!/usr/bin/env bash
# Practical 7: Create multiple buckets and insert many key-value records.
BASE="http://127.0.0.1:8098/riak"

for bucket in students courses activities; do
  for i in $(seq 1 100); do
    curl -s -X PUT "$BASE/$bucket/$i" \
      -H "Content-Type: application/json" \
      -d "{\"id\":$i,\"bucket\":\"$bucket\",\"name\":\"Record_$i\"}" \
      -o /dev/null
  done
done

echo "Inserted 100 records in each of three buckets."
curl -i http://127.0.0.1:8098/riak/students/1
