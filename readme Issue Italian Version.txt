Abbiamo un serio problema di multiutenza con blocco presumibilmente del driver di intebase 2020 update 6 su linux64
Scenario:

1) Applicazione Multitiered
2) Software Client DataSnap/DBExpress
4) Software Application Server : Console Firedac/http
5) Ambiente di distribuzione:
	Windows 10
		-Database Server : 
			-Interbase 2020 update 6 su windows 10
			-MySql 8.037 Use legacy Authentication Method (Retain MySql 5.x Compatibility) su windows 10
	Linux64 su docker container :
		Il motore del db rimane sempre quello di windows 10
		Driver Database Client:
			-Interbase 2020 update 6 libgds.so 
			-Mysql libmysqlclient.so.21.2.37
		
Operazioni eseguite
	- n 2 client che eseguono la stessa query contemporaneamente 
	(il test è basato sulla contemporaineta del click sul bottone ESEGUI dell'applicazione Client da due pc diversi)
	
Ambiente di distrubione Windows
	- MySQl funziona perfettamente
	- Interbase funziona perfettamente
Ambiente di distribuzione Container Linux64
	- MySQl funziona perfettamente
	- Interbase :
		- i client di bloccano 
			- l'application server sembra attivo, accetta nuove connessioni (fdconnection.connected = True) ma non è in grado di eseguire una nuova query
		- dopo 120000 millisecondi Errore di timeout sui client
		- l'application server risulta attivo (status) ma non è in grado di fare altro
		- il riavvio automatico non riesce
		- lo stop del server non riesce 
		- Interbase server 2020 su windows non da segnali di problemi e continua a runnare tranquillamente
		- la kill del processo dell'application server e il suo riavvio da shell riportano il sistema ad una condizione ottimale ma ovviamente se si prova a rieterare i passaggi, si blocca di nuovo
		- La query interessa due tabelle la prima con 1094 record la seconda con 7 record collegati alla prima attraverso una FK
		- La query non esegue update/insert o delete, legge e basta
		- Il risultato della query viene inviato ad una stringgrid posta su una Form/FMX
PS 
Test eseguiti:
1) se i due client eseguono le due query con un minimo di differenza il server risponde correttametne
2) al diminuire dei record della prima tabella aumentano il numero di volte che è possibile eseguire le query contemporaneamente 
3) con 100 record non siamo riusciti a riprodurre l'errore
4) a partire da 200 record l'errore si presenta
5) all'aumentare dei record di 100 in 100 si arriva sempre più facilmente all'errore
6) con 1094 record l'errore si riproduce già al primo o secondo tentativo
	
Rispetto ai parametri di base di FDManager e FDConnection abbiamo apportato i seguenti tentativi di correzione senza nessun successo
Datasnap compatibility 
Direct Execute
Autoreconnect
FetchOptions.Mode
FetchOptions.RowsetSize
FetchOptions.AutoClose
TxOptions.AutoCommit
ResourceOptions.AutoReconnect
Isolation xiReadCommitted

