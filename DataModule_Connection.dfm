object DM_Connection: TDM_Connection
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 472
    Top = 192
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 384
    Top = 304
  end
  object FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink
    FileName = 'trace1.txt'
    Left = 336
    Top = 120
  end
  object FDManager1: TFDManager
    WaitCursor = gcrHourGlass
    FormatOptions.AssignedValues = [fvMapRules, fvDataSnapCompatibility]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    ResourceOptions.AssignedValues = [rvDirectExecute, rvAutoReconnect]
    ResourceOptions.DirectExecute = True
    ResourceOptions.AutoReconnect = True
    Active = True
    Left = 152
    Top = 48
  end
  object FDConn_Sql: TFDConnection
    Params.Strings = (
      'ConnectionDef=IB_PTest')
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtDateTime
        TargetDataType = dtDateTimeStamp
      end
      item
        SourceDataType = dtWideString
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtWideMemo
        TargetDataType = dtBlob
      end>
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    TxOptions.Isolation = xiReadCommitted
    LoginPrompt = False
    OnError = FDConn_SqlError
    Left = 104
    Top = 160
  end
end
