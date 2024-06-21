object ServerMethods1: TServerMethods1
  OnCreate = DSServerModuleCreate
  Height = 480
  Width = 640
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 144
  end
  object FDQuery1: TFDQuery
    Connection = DM_Connection.FDConn_Sql
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afDisable
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    ResourceOptions.CmdExecMode = amCancelDialog
    OnError = FDQuery1Error
    OnExecuteError = FDQuery1ExecuteError
    SQL.Strings = (
      
        'SELECT A.*, B.TIPO_PRATICA, B.DESCRIZIONE , (SELECT CAST(COUNT(*' +
        ') AS CHAR(10)) FROM NC_PROROGHE D WHERE D.FK_NC = A.PK_PROGRESSI' +
        'VO) AS TOTALE_PROROGHE '
      'FROM NC_MASTER A, SYS_TIPO_PRATICA B'
      'WHERE A.K_TIPO_PRATICA = B.PK_PROGRESSIVO '
      '')
    Left = 32
    Top = 64
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Console'
    OnShow = FDGUIxErrorDialog1Show
    OnHide = FDGUIxErrorDialog1Hide
    Left = 376
    Top = 208
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    ScreenCursor = gcrHourGlass
    Left = 512
    Top = 176
  end
  object FDGUIxAsyncExecuteDialog1: TFDGUIxAsyncExecuteDialog
    Provider = 'Console'
    Left = 480
    Top = 248
  end
  object FDGUIxScriptDialog1: TFDGUIxScriptDialog
    Provider = 'Console'
    Left = 304
    Top = 112
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Console'
    Left = 456
    Top = 88
  end
end
