Abbiamo un serio problema di key violation nell'utilizzo di griglie collegate in master detail 
Scenario:

1) Applicazione Multitiered
2) Software Client DataSnap/DBExpress FMX
4) Software Application Server : Console Firedac/http
5) Ambiente di distribuzione:
	Windows 10
		-Database Server : qualsiasi
6) N. 3 clientdataset collegati fra di loro attraverso 2 datasource utilizzando primary key or and foreign key, le griglie sono collegate attraverso il Bind
7) La mancanza di record in una o più clientdataset di detail provoca l'eccezione KEY VIOLATION anche a design time, l'eccezione è sollevata dal link...
anche catturando sulla LinkGridToDataSourceBindSourceDB2EvalError l'errore non si risolve il problema della presentazione dell'errore originale
Abbiamo scoperto che l'unica soluzione è non utilizzare il collegamento datasource ma far muovere i clientdataset attraverso codice specifico (filter o parambyname)
questo però significa che tutte le facilitazioni date dal meccanismo clientdataset/datasource nello sviluppo della parte client dell'applicazione sono inutilizzabili
inaccettabile per un software che ha un'alto costo di licenza
Nell'esempio :
1)-il bottone "Open the grids table" esegue la active = true dei 3 clientdataset
con le frecce o il bindnavigator basta spostarsi per ricevere l'eccezione
2)- il bottone "Close and disconect DS2" effettua la active = false e cambia il LinkGridToDataSourceBindSourceDB4.DataSource con un'altro BindSource linkato ad un clientdataset non collegato con Datasource ma pilotato a codice 
utilizzando "Open the grids table" l'errore non si presenta più
3)- il bottone "Reconnect Datasource 2" ripristina la situazione originale 


Il clientdataset aggiuntivo dell'operazione 2 è necessario in quanto le seguenti istruzioni non hanno nessun effetto
    ClientDataSet3.MasterSource := nil;
    ClientDataSet3.MasterFields.Empty;
    ClientDataSet3.IndexFieldNames.Empty;
    ClientDataSet3.Params.AddParameter;
    ClientDataSet3.Params[0].Name := 'fk_value';
    ClientDataSet3.Params[0].DataType := ftInteger;
    ClientDataSet3.Params[0].ParamType := ptInput;
	
