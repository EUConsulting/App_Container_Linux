We have a serious key violation problem when using linked grids in master detail
Scenario:

1) Multitiered Application
2) DataSnap/DBExpress FMX Client Software
4) Application Server Software: Firedac/http Console
5) Deployment Environment:
  Windows 10
  -Database Server: any
6) No. 3 clientdatasets connected to each other through 2 datasources using primary key or and foreign key, the grids are connected through the Bind
7) The lack of records in one or more detail clientdatasets causes the KEY VIOLATION exception even at design time, the exception is raised by the link...
even capturing the error on the LinkGridToDataSourceBindSourceDB2EvalError does not resolve the problem of presenting the original error
We discovered that the only solution is not to use the datasource connection but to move the clientdatasets through specific code (filter or parambyname)
however, this means that all the facilities given by the clientdataset/datasource mechanism in the development of the client part of the application are unusable
unacceptable for software that has a high license cost
In the example:
1) - the "Open the grids table" button executes the active = true of the 3 client datasets
with the arrows or the bindnavigator just move to receive the exception
2)- the "Close and disconnect DS2" button makes active = false and changes the LinkGridToDataSourceBindSourceDB4.DataSource with another BindSource linked to a clientdataset not connected to the Datasource but driven by code
using "Open the grids table" the error no longer occurs
3)- the "Reconnect Datasource 2" button restores the original situation


The additional clientdataset from operation 2 is necessary because the following instructions have no effect
 ClientDataSet3.MasterSource := nil;
 ClientDataSet3.MasterFields.Empty;
 ClientDataSet3.IndexFieldNames.Empty;
 ClientDataSet3.Params.AddParameter;
 ClientDataSet3.Params[0].Name := 'fk_value';
 ClientDataSet3.Params[0].DataType := ftInteger;
 ClientDataSet3.Params[0].ParamType := ptInput;