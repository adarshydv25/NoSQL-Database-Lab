# Running the lab on Windows

## Check tools
In VS Code PowerShell run:
```powershell
java -version
wsl --status
docker --version
```

## HBase
HBase is not a straightforward native Windows installation. Recommended student route: WSL2 + Ubuntu or a Linux VM.
1. Open PowerShell as Administrator and run `wsl --install`; restart if requested.
2. Finish Ubuntu first-time setup.
3. Install a Java version supported by the HBase release you choose.
4. Download an Apache HBase binary release and follow that exact release's standalone-mode documentation.
5. Start HBase using the release documentation, then open `hbase shell`.
6. Run commands from `hbase/01_to_10_hbase_lab.rb` section by section. Run Q15 separately.

Official HBase documentation: https://hbase.apache.org/book.html

## Cassandra
Install a Java version supported by your chosen Cassandra release. Install Cassandra from the official Apache download or use its official Docker image if Docker is configured. Start Cassandra, open `cqlsh`, then run:
```bash
cqlsh -f cassandra/11_to_14_cassandra_lab.cql
```
Official Cassandra documentation: https://cassandra.apache.org/doc/latest/

## Important
`.rb` here means HBase Shell command script; it is not a Ruby program. Execute it inside `hbase shell`, not PowerShell. Execute `.cql` inside Cassandra `cqlsh`. Some HBase commands such as `list_regions` can vary by release; if unavailable, use the HBase UI or the region-status command supported by your version.
