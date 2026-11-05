HBASE - STUDENTS TABLE

Start HBase and open the HBase shell:
  hbase shell
Then paste commands from students.hbase.

Table design:
- personal: name and course
- academic: semester and marks

Row key is Student_ID. Column-family names are kept short because HBase stores data
by column family.
