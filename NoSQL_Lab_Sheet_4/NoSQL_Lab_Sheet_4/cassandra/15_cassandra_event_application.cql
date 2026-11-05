-- Q15 Optional complete Cassandra event logging application
CREATE KEYSPACE IF NOT EXISTS EventPlatform
WITH replication = {'class':'SimpleStrategy','replication_factor':1};
USE EventPlatform;
CREATE TABLE IF NOT EXISTS EventsByUser (
 user_id text, event_day date, event_time timestamp, event_id uuid,
 event_type text, status text, details text,
 PRIMARY KEY ((user_id,event_day),event_time,event_id)
) WITH CLUSTERING ORDER BY (event_time DESC);
INSERT INTO EventsByUser (user_id,event_day,event_time,event_id,event_type,status,details)
VALUES ('U100','2026-11-02','2026-11-02T09:00:00Z',uuid(),'LOGIN','SUCCESS','Web login');
INSERT INTO EventsByUser (user_id,event_day,event_time,event_id,event_type,status,details)
VALUES ('U100','2026-11-02','2026-11-02T09:15:00Z',uuid(),'PAGE_VIEW','SUCCESS','Viewed dashboard');
INSERT INTO EventsByUser (user_id,event_day,event_time,event_id,event_type,status,details)
VALUES ('U200','2026-11-02','2026-11-02T10:00:00Z',uuid(),'PAYMENT','PENDING','Order payment');
SELECT * FROM EventsByUser WHERE user_id='U100' AND event_day='2026-11-02'
AND event_time >= '2026-11-02T00:00:00Z' AND event_time < '2026-11-03T00:00:00Z';
-- For update/delete, first SELECT the event_id, then use all primary-key fields:
-- UPDATE EventsByUser SET status='REVIEWED' WHERE user_id='U100'
-- AND event_day='2026-11-02' AND event_time='2026-11-02T09:00:00Z'
-- AND event_id=<UUID>;
-- DELETE FROM EventsByUser WHERE user_id='U200' AND event_day='2026-11-02'
-- AND event_time='2026-11-02T10:00:00Z' AND event_id=<UUID>;
