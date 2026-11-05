# Short explanations and viva notes

## HBase Q1–Q10
- **Column families:** Families are defined when the table is created. Qualifiers are columns inside a family, e.g. `personal:name`, `academic:marks`. Rows can have different qualifiers; missing cells need not be stored.
- **CRUD:** `create` creates a table; `put` inserts or updates a cell; `get` reads a row; `scan` reads multiple rows; `delete` removes a cell.
- **Events/CMS/Blog:** Use row keys to identify events, content items, or blog posts. Families group related fields, such as `event`, `user`, `content`, `author`, and `metadata`.
- **Counters:** `incr` atomically increments a numeric cell; `get_counter` reads it.
- **TTL:** Time-To-Live is set in seconds on a column family. Expired cells become invisible after expiry; physical cleanup can happen later during compaction.
- **Row-key scaling:** A hash/bucket prefix distributes writes across key ranges and helps avoid a hotspot caused by sequential keys.
- **Regions:** HBase splits a table's row-key range into regions. RegionServers host and serve regions, distributing load and supporting availability.

## Cassandra Q11–Q14
- **Keyspace:** Container for tables and replication configuration.
- **CRUD:** CQL uses INSERT, SELECT, UPDATE, DELETE.
- **Event table:** Partition by user ID and cluster by timestamp so a user's events can be queried by time range.
- **Consistency:** ONE needs one replica response; QUORUM needs a majority; ALL needs every replica. With replication factor 1, all three effectively use the same single replica. To observe differences, use a multi-node cluster and RF=3.

## Q15 application and comparison
The ZIP includes HBase CMS and Cassandra event-logging options.
- HBase provides strong row-level consistency, atomic row operations, row-key/range retrieval, and horizontal scaling through regions/RegionServers. It does not provide general multi-row SQL transactions.
- Cassandra provides tunable consistency, high availability with replication, partition-key-based queries, and horizontal scaling by adding nodes. Lightweight transactions support conditional operations, not general relational transactions.
- HBase is based on a master/RegionServer architecture; Cassandra uses a peer-to-peer architecture.
