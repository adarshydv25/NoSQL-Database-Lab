// Practical 14: Neo4j transactions and consistency
// Run the statements in Neo4j Browser. Each query normally runs in its own transaction.
// To demonstrate a single explicit transaction, use cypher-shell transaction commands
// or a driver-managed transaction as shown in Practical 15.

CREATE CONSTRAINT account_id_unique IF NOT EXISTS
FOR (a:Account) REQUIRE a.accountId IS UNIQUE;

MERGE (:Account {accountId:"A101",owner:"Aarav",balance:5000});
MERGE (:Account {accountId:"A102",owner:"Priya",balance:3000});

// Create and match records
MATCH (a:Account) RETURN a;

// Update one record
MATCH (a:Account {accountId:"A101"})
SET a.balance = a.balance - 500
RETURN a;

// Update second record
MATCH (a:Account {accountId:"A102"})
SET a.balance = a.balance + 500
RETURN a;

// Create a transfer record
CREATE (:Transfer {transferId:"T1001",amount:500,status:"Completed",createdAt:datetime()});

// Delete a demonstration transfer record
MATCH (t:Transfer {transferId:"T1001"})
DELETE t;

// Check account data
MATCH (a:Account) RETURN a;

// ACID note:
// Neo4j transactions group graph changes atomically. If a transaction fails before commit,
// its changes are rolled back. Use the driver transaction example in Python for a true
// multi-query transaction rather than treating these separate Browser submissions as one.
