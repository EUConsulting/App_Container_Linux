#English version
Small multilevel application in Delphi 12.1 that uses DataSnap/DBExpress as client and as Application Server FireDac and HTTP/HTTPS (port 8090) to connect to the Database Server
The Database server can be set from the Application Server prompt by choosing between Interbase 2020 update 6 and Mysql 8.037
The DB_IB and DB_MySql folders contain the 2 databases for testing
The Server application can be compiled in Windows 32/64 bit and Linux 64 bit environments
To compile in a Linux64 environment it is necessary to use PAServer by creating a Docker Container deriving from the image made available by Embarcadero at


#Versione Italiana
Piccola applicazione multilivello in Delphi 12.1 che utilizza DataSnap/DBExpress come client e come Application Server FireDac e HTTP/HTTPS per la connessione al Server Database
Il server Database può essere impostato dal prompt dell'Application Server scegliento tra Interbase 2020 update 6  e Mysql 8.037
Le cartelle DB_IB e DB_MySql contengono i 2 database per i test
L'application Server è compilabile in ambiente Windows 32/64 bit e Linux64 bit 
Per compilare in ambiente Linux64 è necessario utilizzare PAServer attraverso la creazione di un Docker Container derivante dall'image messa a disposizione da Embarcadero all'indirizzo 