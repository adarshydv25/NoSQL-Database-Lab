// Q11. Bank Wallet Transfer using MongoDB transaction
// REQUIREMENT: MongoDB must run as a replica set or sharded cluster.
// This script will fail on a standalone mongod.
use("NoSQL_Lab3");
db.Wallets.drop();

db.Wallets.insertMany([
 {_id:"U101",name:"Aarav",balance:5000},
 {_id:"U102",name:"Priya",balance:3000}
]);

const session = db.getMongo().startSession();
const txDb = session.getDatabase("NoSQL_Lab3");
try {
 session.startTransaction();
 const sender = txDb.Wallets.findOne({_id:"U101"});
 const amount = 1000;

 if (!sender || sender.balance < amount) {
   throw new Error("Sender not found or insufficient balance");
 }

 txDb.Wallets.updateOne(
   {_id:"U101",balance:{$gte:amount}},
   {$inc:{balance:-amount}}
 );
 txDb.Wallets.updateOne(
   {_id:"U102"},
   {$inc:{balance:amount}}
 );

 session.commitTransaction();
 print("Transfer completed successfully.");
} catch (error) {
 session.abortTransaction();
 print("Transfer failed; transaction rolled back: " + error);
} finally {
 session.endSession();
}

db.Wallets.find().pretty();

// Atomicity means both balance changes commit together or neither does.
