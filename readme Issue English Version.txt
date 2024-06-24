We have a serious multi-user problem with presumably blocking of the intebase 2020 update 6 driver on linux64
Scenario:

1) Multitiered Application
2) DataSnap/DBExpress Client Software
4) Application Server Software: Firedac/http Console
5) Deployment Environment:
  Windows 10
  -Database Server:
  -Interbase 2020 update 6 on windows 10
  -MySql 8.037 Use legacy Authentication Method (Retain MySql 5.x Compatibility) on windows 10
  Linux64 on docker containers:
  The db engine always remains that of Windows 10
  Database Client Drivers:
  - Shortstop 2020 update 6 libgds.so
  -Mysql libmysqlclient.so.21.2.37

Operations performed
  - n 2 clients running the same query at the same time
  (the test is based on the simultaneous click on the RUN button of the Client application from two different PCs)

Windows distribution environment
  - MySQL works perfectly
  - Shortstop works perfectly
Container Linux64 distribution environment
  - MySQL works perfectly
  - Shortstop:
  - clients are blocked
  - the application server appears active, accepting new connections (fdconnection.connected = True) but is unable to execute a new query
  - after 120000 milliseconds Timeout error on clients
  - the application server is active (status) but is unable to do anything else
  - automatic restart fails
  - server stop fails
  - Interbase server 2020 on Windows shows no signs of problems and continues to run smoothly
  - killing the application server process and restarting it from the shell brings the system back to an optimal condition but obviously if you try to repeat the steps, it crashes again
  - The query involves three tables, the first with 1094 records, the second with 7 records, the third with 72 records connected to the first through FKs
  - The query doesn't update/insert or delete, it just reads
  - The result of the query is sent to a stringgrid placed on a Form/FMX
PS
Tests performed:
1) if the two clients execute the two queries with a minimum difference, the server responds correctly
2) as the number of records in the first table decreases, the number of times it is possible to execute queries simultaneously increases
3) with 100 records we were unable to reproduce the error
4) starting from 200 records the error occurs
5) as the records increase from 100 to 100, the error becomes more and more likely
6) with 1094 records the error occurs already on the first or second attempt

Compared to the basic parameters of FDManager and FDConnection we have made the following correction attempts without any success
Datasnap compatibility
Direct Execute
Autoreconnect
FetchOptions.Mode
FetchOptions.RowsetSize
FetchOptions.AutoClose
TxOptions.AutoCommit
ResourceOptions.AutoReconnect
Isolation xiReadCommitted