DISTRIBUTED DATABASE MODELS - TASKS 8, 11, 12, 13 AND 15

See distribution_models.md for the five architecture descriptions, Mermaid diagrams,
advantages, limitations, failure handling and suitable applications.

Task 8 comparison:
- MongoDB: document model; BSON documents in collections; MongoDB Query API;
  horizontal scale with sharding; useful for content/catalogue/user-profile applications.
- Cassandra: wide-column model; partitioned rows in tables; CQL; peer-to-peer horizontal
  scale; useful for high-write, always-on event/time-series workloads.
- Neo4j: graph model; nodes, relationships and properties; Cypher; scale options depend
  on edition/deployment and graph workload; useful for connected data and recommendations.
