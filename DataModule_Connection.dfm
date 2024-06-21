object DM_Connection: TDM_Connection
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDConn_Sql: TFDConnection
    Params.Strings = (
      'ConnectionDef=MySql_PTest')
    FetchOptions.AssignedValues = [evMode, evDetailCascade]
    FetchOptions.Mode = fmAll
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
    TxOptions.Isolation = xiReadCommitted
    LoginPrompt = False
    OnError = FDConn_SqlError
    Left = 136
    Top = 112
  end
  object FDManager1: TFDManager
    DriverDefFileName = 'FDDrivers.ini'
    ConnectionDefFileName = 'FDConnectionDefs.ini'
    WaitCursor = gcrHourGlass
    FormatOptions.AssignedValues = [fvMapRules, fvDataSnapCompatibility]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    Active = True
    Left = 304
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 472
    Top = 192
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 384
    Top = 304
  end
  object FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink
    Left = 336
    Top = 120
  end
end
