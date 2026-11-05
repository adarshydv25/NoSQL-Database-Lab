CASSANDRA - COLLEGEDB

Start Cassandra and run:
  cqlsh -f 04_Cassandra/students.cql

Cassandra is query-oriented and distributed. The primary key is Student_ID.
The course query uses a secondary index for this small classroom demonstration.
For large production workloads, model tables around query patterns rather than relying
on secondary indexes for every access pattern.

The multi-node replication notes are in peer_to_peer_replication.txt.
