# HBASE LAB SHEET 4 — Q1 TO Q10
# Run inside `hbase shell`, section by section.

# Q1 Student table: personal and academic families
create 'Student', 'personal', 'academic'
put 'Student', '1', 'personal:name', 'Aarav Sharma'
put 'Student', '1', 'personal:city', 'Haridwar'
put 'Student', '1', 'academic:course', 'BCA'
put 'Student', '1', 'academic:semester', '5'
put 'Student', '1', 'academic:marks', '82'
put 'Student', '2', 'personal:name', 'Priya Verma'
put 'Student', '2', 'personal:city', 'Roorkee'
put 'Student', '2', 'academic:course', 'BCA'
put 'Student', '2', 'academic:semester', '5'
put 'Student', '2', 'academic:marks', '88'
put 'Student', '3', 'personal:name', 'Rahul Singh'
put 'Student', '3', 'personal:city', 'Meerut'
put 'Student', '3', 'academic:course', 'BSc IT'
put 'Student', '3', 'academic:semester', '4'
put 'Student', '3', 'academic:marks', '76'
put 'Student', '4', 'personal:name', 'Neha Gupta'
put 'Student', '4', 'personal:city', 'Haridwar'
put 'Student', '4', 'academic:course', 'BCA'
put 'Student', '4', 'academic:semester', '5'
put 'Student', '4', 'academic:marks', '91'
put 'Student', '5', 'personal:name', 'Kabir Joshi'
put 'Student', '5', 'personal:city', 'Dehradun'
put 'Student', '5', 'academic:course', 'BCom'
put 'Student', '5', 'academic:semester', '3'
put 'Student', '5', 'academic:marks', '79'
scan 'Student'

# Q2 Employee CRUD
create 'Employee', 'info', 'job'
put 'Employee', 'E101', 'info:name', 'Amit Kumar'
put 'Employee', 'E101', 'info:city', 'Haridwar'
put 'Employee', 'E101', 'job:role', 'Developer'
put 'Employee', 'E102', 'info:name', 'Sara Khan'
put 'Employee', 'E102', 'job:role', 'Tester'
get 'Employee', 'E101'
scan 'Employee'
delete 'Employee', 'E102', 'info:name'
get 'Employee', 'E102'

# Q3 Event logging: event and user families
create 'EventLog', 'event', 'user'
put 'EventLog', 'EVT#20261101T100000#001', 'event:type', 'LOGIN'
put 'EventLog', 'EVT#20261101T100000#001', 'event:timestamp', '2026-11-01T10:00:00'
put 'EventLog', 'EVT#20261101T100000#001', 'event:status', 'SUCCESS'
put 'EventLog', 'EVT#20261101T100000#001', 'user:user_id', 'U01'
put 'EventLog', 'EVT#20261101T100500#002', 'event:type', 'PAYMENT'
put 'EventLog', 'EVT#20261101T100500#002', 'event:timestamp', '2026-11-01T10:05:00'
put 'EventLog', 'EVT#20261101T100500#002', 'event:status', 'PENDING'
put 'EventLog', 'EVT#20261101T100500#002', 'user:user_id', 'U02'
get 'EventLog', 'EVT#20261101T100000#001'
get 'EventLog', 'EVT#20261101T100500#002'

# Q4 CMS CRUD
create 'CMS', 'content', 'author', 'metadata'
put 'CMS', 'C001', 'content:title', 'Introduction to NoSQL'
put 'CMS', 'C001', 'content:body', 'NoSQL databases store flexible data.'
put 'CMS', 'C001', 'author:name', 'Adarsh'
put 'CMS', 'C001', 'metadata:status', 'draft'
get 'CMS', 'C001'
put 'CMS', 'C001', 'content:title', 'Introduction to NoSQL Databases'
put 'CMS', 'C001', 'metadata:status', 'published'
get 'CMS', 'C001'
delete 'CMS', 'C001', 'content:body'
get 'CMS', 'C001'

# Q5 Blogging platform
create 'Blog', 'blog', 'author', 'comments'
put 'Blog', 'B001', 'blog:title', 'Learning HBase'
put 'Blog', 'B001', 'blog:body', 'HBase is a column-family database.'
put 'Blog', 'B001', 'author:name', 'Aarav'
put 'Blog', 'B001', 'comments:c1', 'Very useful article'
put 'Blog', 'B002', 'blog:title', 'Learning Cassandra'
put 'Blog', 'B002', 'author:name', 'Priya'
put 'Blog', 'B003', 'blog:title', 'NoSQL Basics'
put 'Blog', 'B003', 'author:name', 'Rahul'
get 'Blog', 'B001'
scan 'Blog'

# Q6 Different qualifiers in column families
create 'ProductCatalog', 'details', 'pricing', 'inventory'
put 'ProductCatalog', 'P01', 'details:name', 'Laptop'
put 'ProductCatalog', 'P01', 'details:brand', 'ExampleTech'
put 'ProductCatalog', 'P01', 'pricing:price', '55000'
put 'ProductCatalog', 'P01', 'pricing:currency', 'INR'
put 'ProductCatalog', 'P01', 'inventory:warehouse', 'North'
put 'ProductCatalog', 'P01', 'inventory:stock', '25'
scan 'ProductCatalog'

# Q7 Atomic page-view counters
create 'WebsiteCounter', 'views'
incr 'WebsiteCounter', 'home', 'views:count', 1
incr 'WebsiteCounter', 'home', 'views:count', 1
incr 'WebsiteCounter', 'about', 'views:count', 1
incr 'WebsiteCounter', 'products', 'views:count', 1
get_counter 'WebsiteCounter', 'home', 'views:count'
get_counter 'WebsiteCounter', 'about', 'views:count'
get_counter 'WebsiteCounter', 'products', 'views:count'

# Q8 TTL session family; TTL value is seconds
create 'UserSessions', {NAME => 'session', TTL => '60'}
put 'UserSessions', 'S001', 'session:user_id', 'U101'
put 'UserSessions', 'S001', 'session:status', 'ACTIVE'
put 'UserSessions', 'S002', 'session:user_id', 'U102'
put 'UserSessions', 'S002', 'session:status', 'ACTIVE'
get 'UserSessions', 'S001'
# Wait more than 60 seconds, then run get again. Physical cleanup may occur later.

# Q9 Row-key strategy: bucket/hash prefix avoids sequential write hotspot
create 'UserActivity', 'activity'
put 'UserActivity', '03#U1001#20261102T100000#A01', 'activity:type', 'LOGIN'
put 'UserActivity', '47#U1002#20261102T100500#A02', 'activity:type', 'VIEW'
put 'UserActivity', '82#U1003#20261102T101000#A03', 'activity:type', 'PURCHASE'
scan 'UserActivity'

# Q10 Pre-split table into multiple regions
create 'RegionalData', 'data', {SPLITS => ['m', 't']}
put 'RegionalData', 'apple', 'data:value', 'Region-A'
put 'RegionalData', 'orange', 'data:value', 'Region-B'
put 'RegionalData', 'zebra', 'data:value', 'Region-C'
scan 'RegionalData'
status 'detailed'
# Region listing command availability varies by HBase version.
