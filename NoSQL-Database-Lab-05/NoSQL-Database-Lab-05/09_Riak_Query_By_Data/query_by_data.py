"""
Practical 9: Query-by-data using application-level logic.
This demonstration stores JSON records in Riak and scans a known key list maintained by
the application. Basic Riak KV is key-oriented; it does not automatically provide SQL-like
queries over arbitrary JSON fields.
"""
import json
import requests

BASE = "http://127.0.0.1:8098/riak/user_records"
records = [
    {"id": "u1", "name": "Aarav", "city": "Roorkee", "age": 20, "preferences": ["dark", "email"]},
    {"id": "u2", "name": "Priya", "city": "Haridwar", "age": 21, "preferences": ["light", "push"]},
    {"id": "u3", "name": "Rahul", "city": "Roorkee", "age": 22, "preferences": ["dark", "sms"]},
]

# PUT each record
for record in records:
    response = requests.put(
        f"{BASE}/{record['id']}",
        data=json.dumps(record),
        headers={"Content-Type": "application/json"},
        timeout=10
    )
    response.raise_for_status()

# Application keeps the known key list (a simple lab index)
known_keys = ["u1", "u2", "u3"]
all_users = []

for key in known_keys:
    response = requests.get(f"{BASE}/{key}", timeout=10)
    response.raise_for_status()
    all_users.append(response.json())

# Application-side filters
print("Users in Roorkee:")
print([u for u in all_users if u.get("city") == "Roorkee"])

print("Users aged 21 or above:")
print([u for u in all_users if u.get("age", 0) >= 21])

print("Users preferring dark theme:")
print([u for u in all_users if "dark" in u.get("preferences", [])])
