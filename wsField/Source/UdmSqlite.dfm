object dmSqlite: TdmSqlite
  OldCreateOrder = False
  Height = 533
  Width = 1042
  object FComSQLite: TFDConnection
    Params.Strings = (
      'Database=E:\Projetos2021\Field\FieldTrato\wsField\db\WS.db'
      'LockingMode=Normal'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = FComSQLiteBeforeConnect
    Left = 72
    Top = 72
  end
  object Fabricacao: TFDQuery
    CachedUpdates = True
    Connection = FComSQLite
    SQL.Strings = (
      'select a.* from Fabricacao a '
      '')
    Left = 73
    Top = 128
    object FabricacaoId: TIntegerField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
    end
    object FabricacaoIdReceita: TIntegerField
      FieldName = 'IdReceita'
      Origin = 'IdReceita'
      Required = True
    end
    object FabricacaoIdUsuario: TIntegerField
      FieldName = 'IdUsuario'
      Origin = 'IdUsuario'
    end
    object FabricacaoIdOperador: TIntegerField
      FieldName = 'IdOperador'
      Origin = 'IdOperador'
    end
    object FabricacaoData: TDateField
      FieldName = 'Data'
      Origin = 'Data'
      Required = True
    end
    object FabricacaoHoraIni: TDateTimeField
      FieldName = 'HoraIni'
      Origin = 'HoraIni'
    end
    object FabricacaoHoraFim: TDateTimeField
      FieldName = 'HoraFim'
      Origin = 'HoraFim'
    end
    object FabricacaoPrevKG: TFMTBCDField
      FieldName = 'PrevKG'
      Origin = 'PrevKG'
      Required = True
      Precision = 18
      Size = 2
    end
    object FabricacaoRealizadoKG: TFMTBCDField
      FieldName = 'RealizadoKG'
      Origin = 'RealizadoKG'
      Precision = 18
      Size = 2
    end
    object FabricacaoPesoBalancaInicio: TFMTBCDField
      FieldName = 'PesoBalancaInicio'
      Origin = 'PesoBalancaInicio'
      Precision = 18
      Size = 2
    end
    object FabricacaoPesoBalancaFim: TFMTBCDField
      FieldName = 'PesoBalancaFim'
      Origin = 'PesoBalancaFim'
      Precision = 18
      Size = 2
    end
    object FabricacaoFinalizada: TIntegerField
      FieldName = 'Finalizada'
      Origin = 'Finalizada'
    end
    object FabricacaoCarregada: TIntegerField
      FieldName = 'Carregada'
      Origin = 'Carregada'
      Required = True
    end
    object FabricacaoSync: TIntegerField
      FieldName = 'Sync'
      Origin = 'Sync'
      Required = True
    end
    object FabricacaoDataSync: TDateTimeField
      FieldName = 'DataSync'
      Origin = 'DataSync'
    end
    object FabricacaoIdVAGAO: TIntegerField
      FieldName = 'IdVAGAO'
      Origin = 'IdVAGAO'
    end
    object Fabricacaotrato: TIntegerField
      FieldName = 'trato'
      Origin = 'trato'
    end
    object FabricacaoLote: TStringField
      FieldName = 'Lote'
      Origin = 'Lote'
    end
    object FabricacaoStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
      Required = True
    end
    object FabricacaoValorKG: TBCDField
      FieldName = 'ValorKG'
      Origin = 'ValorKG'
      Precision = 15
      Size = 3
    end
    object FabricacaoRACAO: TStringField
      FieldName = 'RACAO'
      Origin = 'RACAO'
      Size = 100
    end
    object FabricacaoOPERADOR: TStringField
      FieldName = 'OPERADOR'
      Origin = 'OPERADOR'
      Size = 100
    end
  end
  object FabricacaoAlimentos: TFDQuery
    CachedUpdates = True
    Connection = FComSQLite
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.nome Alimento  '
      'from FabricacaoAlimentos a '
      'join Alimentos b on a.IdAlimento=b.Id')
    Left = 74
    Top = 184
    object FabricacaoAlimentosId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FabricacaoAlimentosIdFabricacao: TIntegerField
      FieldName = 'IdFabricacao'
      Origin = 'IdFabricacao'
      Required = True
    end
    object FabricacaoAlimentosIdAlimento: TIntegerField
      FieldName = 'IdAlimento'
      Origin = 'IdAlimento'
      Required = True
    end
    object FabricacaoAlimentosHoraIni: TDateTimeField
      FieldName = 'HoraIni'
      Origin = 'HoraIni'
    end
    object FabricacaoAlimentosHoraFim: TDateTimeField
      FieldName = 'HoraFim'
      Origin = 'HoraFim'
    end
    object FabricacaoAlimentosPrevKG: TFMTBCDField
      FieldName = 'PrevKG'
      Origin = 'PrevKG'
      Required = True
      Precision = 18
      Size = 2
    end
    object FabricacaoAlimentosRealizadoKG: TFMTBCDField
      FieldName = 'RealizadoKG'
      Origin = 'RealizadoKG'
      Precision = 18
      Size = 2
    end
    object FabricacaoAlimentosPesoBalancaInicio: TFMTBCDField
      FieldName = 'PesoBalancaInicio'
      Origin = 'PesoBalancaInicio'
      Precision = 18
      Size = 2
    end
    object FabricacaoAlimentosPesoBalancaFim: TFMTBCDField
      FieldName = 'PesoBalancaFim'
      Origin = 'PesoBalancaFim'
      Precision = 18
      Size = 2
    end
    object FabricacaoAlimentosSync: TIntegerField
      FieldName = 'Sync'
      Origin = 'Sync'
      Required = True
    end
    object FabricacaoAlimentosDataSync: TDateTimeField
      FieldName = 'DataSync'
      Origin = 'DataSync'
    end
    object FabricacaoAlimentosOrdem: TIntegerField
      FieldName = 'Ordem'
      Origin = 'Ordem'
      Required = True
    end
    object FabricacaoAlimentosPercentToleracia: TIntegerField
      FieldName = 'PercentToleracia'
      Origin = 'PercentToleracia'
      Required = True
    end
    object FabricacaoAlimentosVALORKG: TBCDField
      FieldName = 'VALORKG'
      Origin = 'VALORKG'
      Precision = 15
      Size = 3
    end
    object FabricacaoAlimentosVALORFABRICADO: TBCDField
      FieldName = 'VALORFABRICADO'
      Origin = 'VALORFABRICADO'
      Precision = 15
      Size = 3
    end
    object FabricacaoAlimentosMS_PREV: TBCDField
      FieldName = 'MS_PREV'
      Origin = 'MS_PREV'
      Precision = 15
      Size = 3
    end
    object FabricacaoAlimentosKGMS_REAL: TBCDField
      FieldName = 'KGMS_REAL'
      Origin = 'KGMS_REAL'
      Precision = 15
      Size = 3
    end
    object FabricacaoAlimentosINSUMO: TStringField
      FieldName = 'INSUMO'
      Origin = 'INSUMO'
      Size = 100
    end
    object FabricacaoAlimentosAlimento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Alimento'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object Fornecimento: TFDQuery
    CachedUpdates = True
    Connection = FComSQLite
    SQL.Strings = (
      'select '
      ' a.* from Fornecimento a ')
    Left = 72
    Top = 240
    object FornecimentoID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FornecimentoIDCARREGAMENTO: TIntegerField
      FieldName = 'IDCARREGAMENTO'
      Origin = 'IDCARREGAMENTO'
      Required = True
    end
    object FornecimentoDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object FornecimentoIDCURRAL: TIntegerField
      FieldName = 'IDCURRAL'
      Origin = 'IDCURRAL'
      Required = True
    end
    object FornecimentoTRATO: TIntegerField
      FieldName = 'TRATO'
      Origin = 'TRATO'
      Required = True
    end
    object FornecimentoIDRACAOPREV: TIntegerField
      FieldName = 'IDRACAOPREV'
      Origin = 'IDRACAOPREV'
      Required = True
    end
    object FornecimentoIDRACAOREAL: TIntegerField
      FieldName = 'IDRACAOREAL'
      Origin = 'IDRACAOREAL'
      Required = True
    end
    object FornecimentoKGPREVISTO: TIntegerField
      FieldName = 'KGPREVISTO'
      Origin = 'KGPREVISTO'
      Required = True
    end
    object FornecimentoKGREALIZADO: TIntegerField
      FieldName = 'KGREALIZADO'
      Origin = 'KGREALIZADO'
    end
    object FornecimentoHORAINICIO: TTimeField
      FieldName = 'HORAINICIO'
      Origin = 'HORAINICIO'
    end
    object FornecimentoHORAFIM: TTimeField
      FieldName = 'HORAFIM'
      Origin = 'HORAFIM'
    end
    object FornecimentoPESOINICIO: TBCDField
      FieldName = 'PESOINICIO'
      Origin = 'PESOINICIO'
      Precision = 15
      Size = 3
    end
    object FornecimentoPESOFIM: TBCDField
      FieldName = 'PESOFIM'
      Origin = 'PESOFIM'
      Precision = 15
      Size = 3
    end
    object FornecimentoLOTEFAB: TStringField
      FieldName = 'LOTEFAB'
      Origin = 'LOTEFAB'
      Size = 50
    end
    object FornecimentoIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      Origin = 'IDUSUARIO'
      Required = True
    end
    object FornecimentoSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
      Required = True
    end
    object FornecimentoDATASYNC: TDateTimeField
      FieldName = 'DATASYNC'
      Origin = 'DATASYNC'
    end
    object FornecimentoTIPOPREVISTO: TIntegerField
      FieldName = 'TIPOPREVISTO'
      Origin = 'TIPOPREVISTO'
      Required = True
    end
    object FornecimentoCURRAL: TStringField
      FieldName = 'CURRAL'
      Origin = 'CURRAL'
    end
    object FornecimentoRACAO: TStringField
      FieldName = 'RACAO'
      Origin = 'RACAO'
      Size = 50
    end
    object FornecimentoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 100
    end
  end
  object FConTGC: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=127.0.0.1'
      'Database=E:\Projetos2021\Field\Deploy\db\DB_TGC_SAOJOAO_2021.fdb'
      'Port=3050'
      'DriverID=FB')
    LoginPrompt = False
    Left = 248
    Top = 72
  end
  object FBDriverLink: TFDPhysFBDriverLink
    Left = 248
    Top = 144
  end
  object FabricacaoTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'select '
      ' *'
      'from CAD_BATIDA'
      'where 1=2')
    Left = 360
    Top = 32
    object FabricacaoTGCCBT_CODIGO: TIntegerField
      FieldName = 'CBT_CODIGO'
    end
    object FabricacaoTGCCBT_CODRACAOPROD: TIntegerField
      FieldName = 'CBT_CODRACAOPROD'
    end
    object FabricacaoTGCCBT_QTDEBATIDA: TBCDField
      FieldName = 'CBT_QTDEBATIDA'
      Precision = 18
    end
    object FabricacaoTGCCBT_QTDECABECA: TIntegerField
      FieldName = 'CBT_QTDECABECA'
    end
    object FabricacaoTGCCBT_CUSTO: TBCDField
      FieldName = 'CBT_CUSTO'
      Precision = 18
    end
    object FabricacaoTGCCBT_DATA: TDateField
      FieldName = 'CBT_DATA'
    end
    object FabricacaoTGCCBT_INICIO: TTimeField
      FieldName = 'CBT_INICIO'
    end
    object FabricacaoTGCCBT_FIM: TTimeField
      FieldName = 'CBT_FIM'
    end
    object FabricacaoTGCCBT_FLAG_FIM: TStringField
      FieldName = 'CBT_FLAG_FIM'
      FixedChar = True
      Size = 1
    end
    object FabricacaoTGCCBT_DATAREG: TDateField
      FieldName = 'CBT_DATAREG'
    end
    object FabricacaoTGCCBT_USUARIO: TStringField
      FieldName = 'CBT_USUARIO'
      Size = 50
    end
    object FabricacaoTGCCBT_TIPOENTRADA: TIntegerField
      FieldName = 'CBT_TIPOENTRADA'
    end
    object FabricacaoTGCCBT_CODCONCENTRADO: TIntegerField
      FieldName = 'CBT_CODCONCENTRADO'
    end
    object FabricacaoTGCCBT_TIPO: TStringField
      FieldName = 'CBT_TIPO'
      Size = 15
    end
    object FabricacaoTGCCBT_TMP_CODBATIDA_DS: TIntegerField
      FieldName = 'CBT_TMP_CODBATIDA_DS'
    end
    object FabricacaoTGCCBT_COD_BATIDA_ENVIADA: TIntegerField
      FieldName = 'CBT_COD_BATIDA_ENVIADA'
    end
    object FabricacaoTGCCBT_TOT_BATIDA_ENVIADA: TBCDField
      FieldName = 'CBT_TOT_BATIDA_ENVIADA'
      Precision = 18
    end
    object FabricacaoTGCCBT_TMP_NUMBALANCA: TStringField
      FieldName = 'CBT_TMP_NUMBALANCA'
      Size = 10
    end
    object FabricacaoTGCCBT_CENTROCUSTO: TStringField
      FieldName = 'CBT_CENTROCUSTO'
      Size = 50
    end
    object FabricacaoTGCCBT_QTDEPREVISTA: TBCDField
      FieldName = 'CBT_QTDEPREVISTA'
      Precision = 18
    end
    object FabricacaoTGCCBT_LOTE_FABRICACAO: TStringField
      FieldName = 'CBT_LOTE_FABRICACAO'
      Size = 100
    end
    object FabricacaoTGCCBT_NOMEOPERADOR: TStringField
      FieldName = 'CBT_NOMEOPERADOR'
      Size = 100
    end
    object FabricacaoTGCCBT_NOME_MOTORISTA: TStringField
      FieldName = 'CBT_NOME_MOTORISTA'
      Size = 100
    end
    object FabricacaoTGCCBT_ORIGEM_DADOS: TStringField
      FieldName = 'CBT_ORIGEM_DADOS'
      Size = 3
    end
    object FabricacaoTGCCBT_COD_OPERADOR_PA: TIntegerField
      FieldName = 'CBT_COD_OPERADOR_PA'
    end
    object FabricacaoTGCCBT_NUM_BALANCA: TIntegerField
      FieldName = 'CBT_NUM_BALANCA'
    end
    object FabricacaoTGCSYNC_ECO: TStringField
      FieldName = 'SYNC_ECO'
      FixedChar = True
      Size = 1
    end
    object FabricacaoTGCSYNC_ECO_DATA: TSQLTimeStampField
      FieldName = 'SYNC_ECO_DATA'
    end
    object FabricacaoTGCID_ARRENDAMENTO: TLargeintField
      FieldName = 'ID_ARRENDAMENTO'
    end
  end
  object FabricacaoAlimentosTGCSync: TFDQuery
    CachedUpdates = True
    Connection = FComSQLite
    SQL.Strings = (
      'select'
      ' a.ID, '
      ' 1 DBT_CODBATIDA,'
      ' IdAlimento DBT_CODALIMENTO,'
      ' a.RealizadoKG DBT_QTDE,'
      ' (select nome from usuario where id=b.IdUsuario) DBT_USUARIO,'
      ' VALORFABRICADO DBT_CUSTO,'
      ' b.Data DBT_DATA,'
      ' a.HoraIni DBT_HORA,'
      ' a.PrevKG DBT_QTDEPREVISTA,'
      ' a.MS_PREV DBT_PREV_MS,'
      
        ' (cast(a.PrevKG as double precision) *100)/b.PrevKG DBT_PREV_KGM' +
        'NP,'
      
        ' (cast(a.MS_PREV as double precision) *100)/b.PrevKG DBT_PREV_KG' +
        'MSP,'
      ' a.VALORKG DBT_PREV_VALOR_KG,'
      ' a.VALORFABRICADO DBT_PREV_VALOR_TOTAL,'
      
        ' (cast(a.KGMS_REAL as double precision) *100)/b.RealizadoKG DBT_' +
        'REAL_KGMSP,'
      ' cast(a.HoraIni as varchar(10)) DBT_HORA_INI,'
      ' cast(a.HoraFim as varchar(10)) DBT_HORA_FIM,'
      
        ' (cast(a.RealizadoKG as double precision) *100)/b.RealizadoKG DB' +
        'T_REAL_KGMNP,'
      ' b.IdOperador DBT_CODOPERADOR,'
      ' b.lote LOTE'
      'from FabricacaoAlimentos a '
      'join Fabricacao b on a.IdFabricacao=b.Id')
    Left = 72
    Top = 307
  end
  object FornecimentoTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'SELECT '
      '*'
      'from CAD_fornecimento '
      'where 1=2')
    Left = 360
    Top = 88
    object FornecimentoTGCCFORN_CODIGO: TIntegerField
      FieldName = 'CFORN_CODIGO'
      Origin = 'CFORN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FornecimentoTGCCFORN_CODBAIA: TIntegerField
      FieldName = 'CFORN_CODBAIA'
      Origin = 'CFORN_CODBAIA'
    end
    object FornecimentoTGCCFORN_PREVISTO: TBCDField
      FieldName = 'CFORN_PREVISTO'
      Origin = 'CFORN_PREVISTO'
      Precision = 18
    end
    object FornecimentoTGCCFORN_REALIZADO: TBCDField
      FieldName = 'CFORN_REALIZADO'
      Origin = 'CFORN_REALIZADO'
      Precision = 18
    end
    object FornecimentoTGCCFORN_FLAG: TStringField
      FieldName = 'CFORN_FLAG'
      Origin = 'CFORN_FLAG'
      FixedChar = True
      Size = 1
    end
    object FornecimentoTGCCFORN_STATUS: TStringField
      FieldName = 'CFORN_STATUS'
      Origin = 'CFORN_STATUS'
      FixedChar = True
      Size = 1
    end
    object FornecimentoTGCCFORN_DATAREG: TDateField
      FieldName = 'CFORN_DATAREG'
      Origin = 'CFORN_DATAREG'
    end
    object FornecimentoTGCCFORN_TRATO: TIntegerField
      FieldName = 'CFORN_TRATO'
      Origin = 'CFORN_TRATO'
    end
    object FornecimentoTGCCFORN_QTDEPARCIAL: TIntegerField
      FieldName = 'CFORN_QTDEPARCIAL'
      Origin = 'CFORN_QTDEPARCIAL'
    end
    object FornecimentoTGCCFORN_DIFERENCA: TBCDField
      FieldName = 'CFORN_DIFERENCA'
      Origin = 'CFORN_DIFERENCA'
      Precision = 18
    end
    object FornecimentoTGCCFORN_CODRACAOPROD: TIntegerField
      FieldName = 'CFORN_CODRACAOPROD'
      Origin = 'CFORN_CODRACAOPROD'
    end
    object FornecimentoTGCCFORN_MSRACAO: TBCDField
      FieldName = 'CFORN_MSRACAO'
      Origin = 'CFORN_MSRACAO'
      Precision = 18
    end
    object FornecimentoTGCCFORN_QTDECAB: TIntegerField
      FieldName = 'CFORN_QTDECAB'
      Origin = 'CFORN_QTDECAB'
    end
    object FornecimentoTGCCFORN_FLAG_LEITURA: TStringField
      FieldName = 'CFORN_FLAG_LEITURA'
      Origin = 'CFORN_FLAG_LEITURA'
      FixedChar = True
      Size = 1
    end
    object FornecimentoTGCCFORN_CUSTO: TBCDField
      FieldName = 'CFORN_CUSTO'
      Origin = 'CFORN_CUSTO'
      Precision = 18
    end
    object FornecimentoTGCCFORN_MOTORISTA: TStringField
      FieldName = 'CFORN_MOTORISTA'
      Origin = 'CFORN_MOTORISTA'
      Size = 80
    end
    object FornecimentoTGCCFORN_HORA: TTimeField
      FieldName = 'CFORN_HORA'
      Origin = 'CFORN_HORA'
    end
    object FornecimentoTGCCFORN_CODLOTE: TIntegerField
      FieldName = 'CFORN_CODLOTE'
      Origin = 'CFORN_CODLOTE'
    end
    object FornecimentoTGCCFORN_FLAG_CONTAB: TStringField
      FieldName = 'CFORN_FLAG_CONTAB'
      Origin = 'CFORN_FLAG_CONTAB'
      FixedChar = True
      Size = 1
    end
    object FornecimentoTGCCFORN_NUMVAGAO: TStringField
      FieldName = 'CFORN_NUMVAGAO'
      Origin = 'CFORN_NUMVAGAO'
    end
    object FornecimentoTGCCFORN_CUSTO_RACAOPROD: TFloatField
      FieldName = 'CFORN_CUSTO_RACAOPROD'
      Origin = 'CFORN_CUSTO_RACAOPROD'
    end
    object FornecimentoTGCCFORN_FLAG_ENVIADO: TStringField
      FieldName = 'CFORN_FLAG_ENVIADO'
      Origin = 'CFORN_FLAG_ENVIADO'
      FixedChar = True
      Size = 1
    end
    object FornecimentoTGCCFORN_DATAFORNECIDO: TDateField
      FieldName = 'CFORN_DATAFORNECIDO'
      Origin = 'CFORN_DATAFORNECIDO'
    end
    object FornecimentoTGCCFORN_CODRACAOPROD_FORN: TIntegerField
      FieldName = 'CFORN_CODRACAOPROD_FORN'
      Origin = 'CFORN_CODRACAOPROD_FORN'
    end
    object FornecimentoTGCCFORN_SOBRACOCHO: TBCDField
      FieldName = 'CFORN_SOBRACOCHO'
      Origin = 'CFORN_SOBRACOCHO'
      Precision = 18
    end
    object FornecimentoTGCCFORN_FORNECIDO_REAL: TBCDField
      FieldName = 'CFORN_FORNECIDO_REAL'
      Origin = 'CFORN_FORNECIDO_REAL'
      Precision = 18
    end
    object FornecimentoTGCCFORN_FLAG_SOBRA: TStringField
      FieldName = 'CFORN_FLAG_SOBRA'
      Origin = 'CFORN_FLAG_SOBRA'
      FixedChar = True
      Size = 1
    end
    object FornecimentoTGCCFORN_MSRACAO_PREV: TBCDField
      FieldName = 'CFORN_MSRACAO_PREV'
      Origin = 'CFORN_MSRACAO_PREV'
      Precision = 18
    end
    object FornecimentoTGCCFORN_CODRACAOPROD_PREV: TIntegerField
      FieldName = 'CFORN_CODRACAOPROD_PREV'
      Origin = 'CFORN_CODRACAOPROD_PREV'
    end
    object FornecimentoTGCCFORN_AJUSTE_FORN: TFloatField
      FieldName = 'CFORN_AJUSTE_FORN'
      Origin = 'CFORN_AJUSTE_FORN'
    end
    object FornecimentoTGCCFORN_PREVISTO_LEITURA: TFloatField
      FieldName = 'CFORN_PREVISTO_LEITURA'
      Origin = 'CFORN_PREVISTO_LEITURA'
    end
    object FornecimentoTGCCFORN_REALIZADO_ACUMULADO_DIA: TFloatField
      FieldName = 'CFORN_REALIZADO_ACUMULADO_DIA'
      Origin = 'CFORN_REALIZADO_ACUMULADO_DIA'
    end
    object FornecimentoTGCCFORN_TOTAL_TRATO_DIA: TFloatField
      FieldName = 'CFORN_TOTAL_TRATO_DIA'
      Origin = 'CFORN_TOTAL_TRATO_DIA'
    end
    object FornecimentoTGCCFORN_DIF_TOTAL_ACUMULADO: TFloatField
      FieldName = 'CFORN_DIF_TOTAL_ACUMULADO'
      Origin = 'CFORN_DIF_TOTAL_ACUMULADO'
    end
    object FornecimentoTGCCFORN_ORIGEM_DADOS: TStringField
      FieldName = 'CFORN_ORIGEM_DADOS'
      Origin = 'CFORN_ORIGEM_DADOS'
      Size = 3
    end
    object FornecimentoTGCCFORN_LOTE_FABRICACAO: TStringField
      FieldName = 'CFORN_LOTE_FABRICACAO'
      Origin = 'CFORN_LOTE_FABRICACAO'
    end
    object FornecimentoTGCCFORN_HORA_INI: TTimeField
      FieldName = 'CFORN_HORA_INI'
      Origin = 'CFORN_HORA_INI'
    end
    object FornecimentoTGCCFORN_HORA_FIM: TTimeField
      FieldName = 'CFORN_HORA_FIM'
      Origin = 'CFORN_HORA_FIM'
    end
    object FornecimentoTGCCFORN_FLAG_TMP: TStringField
      FieldName = 'CFORN_FLAG_TMP'
      Origin = 'CFORN_FLAG_TMP'
      FixedChar = True
      Size = 1
    end
    object FornecimentoTGCCFON_COD_CARREGAMENTO: TIntegerField
      FieldName = 'CFON_COD_CARREGAMENTO'
      Origin = 'CFON_COD_CARREGAMENTO'
    end
    object FornecimentoTGCCFORN_ORIGEM_CUSTO: TStringField
      FieldName = 'CFORN_ORIGEM_CUSTO'
      Origin = 'CFORN_ORIGEM_CUSTO'
    end
    object FornecimentoTGCCFORN_FLAG_RATEIO: TStringField
      FieldName = 'CFORN_FLAG_RATEIO'
      Origin = 'CFORN_FLAG_RATEIO'
      FixedChar = True
      Size = 1
    end
    object FornecimentoTGCSYNC_ECO_DATA: TSQLTimeStampField
      FieldName = 'SYNC_ECO_DATA'
      Origin = 'SYNC_ECO_DATA'
    end
    object FornecimentoTGCSYNC_ECO: TStringField
      FieldName = 'SYNC_ECO'
      Origin = 'SYNC_ECO'
      FixedChar = True
      Size = 1
    end
    object FornecimentoTGCCFORN_CODOCORRENCIA: TIntegerField
      FieldName = 'CFORN_CODOCORRENCIA'
      Origin = 'CFORN_CODOCORRENCIA'
    end
  end
  object qryAuxTGC: TFDQuery
    Connection = FConTGC
    Left = 520
    Top = 208
  end
  object qryAux: TFDQuery
    Connection = FComSQLite
    Left = 344
    Top = 360
  end
  object SYNC_FABRICACAO: TFDQuery
    CachedUpdates = True
    Connection = FComSQLite
    SQL.Strings = (
      'select '
      ' A.*'
      'from Fabricacao A')
    Left = 512
    Top = 40
    object SYNC_FABRICACAOId: TIntegerField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
    end
    object SYNC_FABRICACAOIdReceita: TIntegerField
      FieldName = 'IdReceita'
      Origin = 'IdReceita'
      Required = True
    end
    object SYNC_FABRICACAOIdUsuario: TIntegerField
      FieldName = 'IdUsuario'
      Origin = 'IdUsuario'
    end
    object SYNC_FABRICACAOIdOperador: TIntegerField
      FieldName = 'IdOperador'
      Origin = 'IdOperador'
    end
    object SYNC_FABRICACAOData: TDateField
      FieldName = 'Data'
      Origin = 'Data'
      Required = True
    end
    object SYNC_FABRICACAOHoraIni: TDateTimeField
      FieldName = 'HoraIni'
      Origin = 'HoraIni'
    end
    object SYNC_FABRICACAOHoraFim: TDateTimeField
      FieldName = 'HoraFim'
      Origin = 'HoraFim'
    end
    object SYNC_FABRICACAOPrevKG: TFMTBCDField
      FieldName = 'PrevKG'
      Origin = 'PrevKG'
      Required = True
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAORealizadoKG: TFMTBCDField
      FieldName = 'RealizadoKG'
      Origin = 'RealizadoKG'
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAOPesoBalancaInicio: TFMTBCDField
      FieldName = 'PesoBalancaInicio'
      Origin = 'PesoBalancaInicio'
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAOPesoBalancaFim: TFMTBCDField
      FieldName = 'PesoBalancaFim'
      Origin = 'PesoBalancaFim'
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAOFinalizada: TIntegerField
      FieldName = 'Finalizada'
      Origin = 'Finalizada'
    end
    object SYNC_FABRICACAOCarregada: TIntegerField
      FieldName = 'Carregada'
      Origin = 'Carregada'
      Required = True
    end
    object SYNC_FABRICACAOSync: TIntegerField
      FieldName = 'Sync'
      Origin = 'Sync'
      Required = True
    end
    object SYNC_FABRICACAODataSync: TDateTimeField
      FieldName = 'DataSync'
      Origin = 'DataSync'
    end
    object SYNC_FABRICACAOIdVAGAO: TIntegerField
      FieldName = 'IdVAGAO'
      Origin = 'IdVAGAO'
    end
    object SYNC_FABRICACAOtrato: TIntegerField
      FieldName = 'trato'
      Origin = 'trato'
    end
    object SYNC_FABRICACAOStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
      Required = True
    end
    object SYNC_FABRICACAORACAO: TStringField
      FieldName = 'RACAO'
      Origin = 'RACAO'
      Size = 100
    end
    object SYNC_FABRICACAOValorKG: TBCDField
      FieldName = 'ValorKG'
      Origin = 'ValorKG'
      Precision = 15
      Size = 3
    end
    object SYNC_FABRICACAOOPERADOR: TStringField
      FieldName = 'OPERADOR'
      Origin = 'OPERADOR'
      Size = 100
    end
    object SYNC_FABRICACAOLote: TStringField
      FieldName = 'Lote'
      Origin = 'Lote'
      Size = 100
    end
  end
  object SYNC_FORNECIMENTO: TFDQuery
    CachedUpdates = True
    Connection = FComSQLite
    SQL.Strings = (
      'SELECT '
      ' v.*'
      'from fornecimento V'
      'where v.Sync=0 AND V.KGREALIZADO>0')
    Left = 520
    Top = 152
    object SYNC_FORNECIMENTOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object SYNC_FORNECIMENTOIDCARREGAMENTO: TIntegerField
      FieldName = 'IDCARREGAMENTO'
      Origin = 'IDCARREGAMENTO'
      Required = True
    end
    object SYNC_FORNECIMENTODATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object SYNC_FORNECIMENTOIDCURRAL: TIntegerField
      FieldName = 'IDCURRAL'
      Origin = 'IDCURRAL'
      Required = True
    end
    object SYNC_FORNECIMENTOTRATO: TIntegerField
      FieldName = 'TRATO'
      Origin = 'TRATO'
      Required = True
    end
    object SYNC_FORNECIMENTOIDRACAOPREV: TIntegerField
      FieldName = 'IDRACAOPREV'
      Origin = 'IDRACAOPREV'
      Required = True
    end
    object SYNC_FORNECIMENTOIDRACAOREAL: TIntegerField
      FieldName = 'IDRACAOREAL'
      Origin = 'IDRACAOREAL'
      Required = True
    end
    object SYNC_FORNECIMENTOKGPREVISTO: TIntegerField
      FieldName = 'KGPREVISTO'
      Origin = 'KGPREVISTO'
      Required = True
    end
    object SYNC_FORNECIMENTOKGREALIZADO: TIntegerField
      FieldName = 'KGREALIZADO'
      Origin = 'KGREALIZADO'
    end
    object SYNC_FORNECIMENTOHORAINICIO: TTimeField
      FieldName = 'HORAINICIO'
      Origin = 'HORAINICIO'
    end
    object SYNC_FORNECIMENTOHORAFIM: TTimeField
      FieldName = 'HORAFIM'
      Origin = 'HORAFIM'
    end
    object SYNC_FORNECIMENTOPESOINICIO: TBCDField
      FieldName = 'PESOINICIO'
      Origin = 'PESOINICIO'
      Precision = 15
      Size = 3
    end
    object SYNC_FORNECIMENTOPESOFIM: TBCDField
      FieldName = 'PESOFIM'
      Origin = 'PESOFIM'
      Precision = 15
      Size = 3
    end
    object SYNC_FORNECIMENTOLOTEFAB: TStringField
      FieldName = 'LOTEFAB'
      Origin = 'LOTEFAB'
      Size = 50
    end
    object SYNC_FORNECIMENTOIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      Origin = 'IDUSUARIO'
      Required = True
    end
    object SYNC_FORNECIMENTOSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
      Required = True
    end
    object SYNC_FORNECIMENTODATASYNC: TDateTimeField
      FieldName = 'DATASYNC'
      Origin = 'DATASYNC'
    end
    object SYNC_FORNECIMENTOTIPOPREVISTO: TIntegerField
      FieldName = 'TIPOPREVISTO'
      Origin = 'TIPOPREVISTO'
      Required = True
    end
    object SYNC_FORNECIMENTOCURRAL: TStringField
      FieldName = 'CURRAL'
      Origin = 'CURRAL'
    end
    object SYNC_FORNECIMENTORACAO: TStringField
      FieldName = 'RACAO'
      Origin = 'RACAO'
      Size = 50
    end
    object SYNC_FORNECIMENTOUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 100
    end
  end
  object FabricacaoInsumosTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'SELECT '
      '*'
      'from DET_BATIDA'
      'where 1=2')
    Left = 352
    Top = 144
    object FabricacaoInsumosTGCDBT_CODIGO: TIntegerField
      FieldName = 'DBT_CODIGO'
      Origin = 'DBT_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FabricacaoInsumosTGCDBT_CODBATIDA: TIntegerField
      FieldName = 'DBT_CODBATIDA'
      Origin = 'DBT_CODBATIDA'
    end
    object FabricacaoInsumosTGCDBT_CODALIMENTO: TIntegerField
      FieldName = 'DBT_CODALIMENTO'
      Origin = 'DBT_CODALIMENTO'
    end
    object FabricacaoInsumosTGCDBT_QTDE: TBCDField
      FieldName = 'DBT_QTDE'
      Origin = 'DBT_QTDE'
      Precision = 18
    end
    object FabricacaoInsumosTGCDBT_DATAREG: TDateField
      FieldName = 'DBT_DATAREG'
      Origin = 'DBT_DATAREG'
    end
    object FabricacaoInsumosTGCDBT_USUARIO: TStringField
      FieldName = 'DBT_USUARIO'
      Origin = 'DBT_USUARIO'
      Size = 50
    end
    object FabricacaoInsumosTGCDBT_CUSTO: TBCDField
      FieldName = 'DBT_CUSTO'
      Origin = 'DBT_CUSTO'
      Precision = 18
    end
    object FabricacaoInsumosTGCDBT_DATA: TDateField
      FieldName = 'DBT_DATA'
      Origin = 'DBT_DATA'
    end
    object FabricacaoInsumosTGCDBT_HORA: TTimeField
      FieldName = 'DBT_HORA'
      Origin = 'DBT_HORA'
    end
    object FabricacaoInsumosTGCDBT_QTDEPREVISTA: TBCDField
      FieldName = 'DBT_QTDEPREVISTA'
      Origin = 'DBT_QTDEPREVISTA'
      Precision = 18
    end
    object FabricacaoInsumosTGCDBT_PREV_MS: TBCDField
      FieldName = 'DBT_PREV_MS'
      Origin = 'DBT_PREV_MS'
      Precision = 18
    end
    object FabricacaoInsumosTGCDBT_PREV_KGMNP: TBCDField
      FieldName = 'DBT_PREV_KGMNP'
      Origin = 'DBT_PREV_KGMNP'
      Precision = 18
    end
    object FabricacaoInsumosTGCDBT_PREV_KGMSP: TBCDField
      FieldName = 'DBT_PREV_KGMSP'
      Origin = 'DBT_PREV_KGMSP'
      Precision = 18
    end
    object FabricacaoInsumosTGCDBT_PREV_VALOR_KG: TBCDField
      FieldName = 'DBT_PREV_VALOR_KG'
      Origin = 'DBT_PREV_VALOR_KG'
      Precision = 18
    end
    object FabricacaoInsumosTGCDBT_PREV_VALOR_TOTAL: TBCDField
      FieldName = 'DBT_PREV_VALOR_TOTAL'
      Origin = 'DBT_PREV_VALOR_TOTAL'
      Precision = 18
    end
    object FabricacaoInsumosTGCDBT_KGMS: TFloatField
      FieldName = 'DBT_KGMS'
      Origin = 'DBT_KGMS'
    end
    object FabricacaoInsumosTGCDBT_REAL_KGMSP: TBCDField
      FieldName = 'DBT_REAL_KGMSP'
      Origin = 'DBT_REAL_KGMSP'
      Precision = 18
    end
    object FabricacaoInsumosTGCDBT_HORA_INI: TTimeField
      FieldName = 'DBT_HORA_INI'
      Origin = 'DBT_HORA_INI'
    end
    object FabricacaoInsumosTGCDBT_HORA_FIM: TTimeField
      FieldName = 'DBT_HORA_FIM'
      Origin = 'DBT_HORA_FIM'
    end
    object FabricacaoInsumosTGCDBT_REAL_KGMNP: TBCDField
      FieldName = 'DBT_REAL_KGMNP'
      Origin = 'DBT_REAL_KGMNP'
      Precision = 18
    end
    object FabricacaoInsumosTGCDBT_CODOPERADOR: TIntegerField
      FieldName = 'DBT_CODOPERADOR'
      Origin = 'DBT_CODOPERADOR'
    end
    object FabricacaoInsumosTGCDBT_MS: TBCDField
      FieldName = 'DBT_MS'
      Origin = 'DBT_MS'
      Precision = 18
    end
    object FabricacaoInsumosTGCSYNC_ECO_DATA: TSQLTimeStampField
      FieldName = 'SYNC_ECO_DATA'
      Origin = 'SYNC_ECO_DATA'
    end
    object FabricacaoInsumosTGCSYNC_ECO: TStringField
      FieldName = 'SYNC_ECO'
      Origin = 'SYNC_ECO'
      FixedChar = True
      Size = 1
    end
  end
  object SYNC_FABRICACAO_INSUMO: TFDQuery
    CachedUpdates = True
    Connection = FComSQLite
    SQL.Strings = (
      'select '
      ' A.*'
      'from FabricacaoAlimentos A')
    Left = 512
    Top = 96
    object SYNC_FABRICACAO_INSUMOId: TIntegerField
      FieldName = 'Id'
    end
    object SYNC_FABRICACAO_INSUMOIdFabricacao: TIntegerField
      FieldName = 'IdFabricacao'
    end
    object SYNC_FABRICACAO_INSUMOIdAlimento: TIntegerField
      FieldName = 'IdAlimento'
    end
    object SYNC_FABRICACAO_INSUMOHoraIni: TDateTimeField
      FieldName = 'HoraIni'
    end
    object SYNC_FABRICACAO_INSUMOHoraFim: TDateTimeField
      FieldName = 'HoraFim'
    end
    object SYNC_FABRICACAO_INSUMOPrevKG: TFMTBCDField
      FieldName = 'PrevKG'
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAO_INSUMORealizadoKG: TFMTBCDField
      FieldName = 'RealizadoKG'
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAO_INSUMOPesoBalancaInicio: TFMTBCDField
      FieldName = 'PesoBalancaInicio'
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAO_INSUMOPesoBalancaFim: TFMTBCDField
      FieldName = 'PesoBalancaFim'
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAO_INSUMOSync: TIntegerField
      FieldName = 'Sync'
    end
    object SYNC_FABRICACAO_INSUMODataSync: TDateTimeField
      FieldName = 'DataSync'
    end
    object SYNC_FABRICACAO_INSUMOOrdem: TIntegerField
      FieldName = 'Ordem'
    end
    object SYNC_FABRICACAO_INSUMOPercentToleracia: TIntegerField
      FieldName = 'PercentToleracia'
    end
    object SYNC_FABRICACAO_INSUMOVALORKG: TBCDField
      FieldName = 'VALORKG'
      Precision = 15
      Size = 3
    end
    object SYNC_FABRICACAO_INSUMOVALORFABRICADO: TBCDField
      FieldName = 'VALORFABRICADO'
      Precision = 15
      Size = 3
    end
    object SYNC_FABRICACAO_INSUMOMS_PREV: TBCDField
      FieldName = 'MS_PREV'
      Precision = 15
      Size = 3
    end
    object SYNC_FABRICACAO_INSUMOKGMS_REAL: TBCDField
      FieldName = 'KGMS_REAL'
      Precision = 15
      Size = 3
    end
    object SYNC_FABRICACAO_INSUMOINSUMO: TStringField
      FieldName = 'INSUMO'
      Size = 100
    end
  end
  object FornecimentosSync: TFDQuery
    CachedUpdates = True
    Connection = FComSQLite
    SQL.Strings = (
      'SELECT '
      ' max(V.ID)ID,'
      ' sum(KGREALIZADO) CFORN_REALIZADO,'
      ' COALESCE(avg(C.ValorKG),0) CFORN_CUSTO,'
      ' max(U.NOME) CFORN_MOTORISTA,'
      ' max(V.HORAFIM) CFORN_HORA,'
      ' max(V.LOTEFAB) CFORN_LOTE_FABRICACAO,'
      ' max(V.HORAINICIO) CFORN_HORA_INI,'
      ' max(V.HORAFIM) CFORN_HORA_FIM,'
      ' max(V.DATA) CFORN_DATAFORNECIDO,'
      ' V.IDCURRAL CFORN_CODBAIA,'
      ' V.TRATO CFORN_TRATO,'
      ' v."DATA",'
      ' IDRACAOREAL CFORN_CODRACAOPROD_PREV'
      'from fornecimento V'
      'JOIN Fabricacao C ON C.Lote=V.LOTEFAB'
      'JOIN usuario U ON V.IDUSUARIO=U.ID'
      'where v.Sync=0'
      'group by V.IDCURRAL,V.TRATO,V."DATA"'
      ' ')
    Left = 72
    Top = 360
  end
  object Usuarios: TFDQuery
    CachedUpdates = True
    Connection = FComSQLite
    SQL.Strings = (
      'select * from usuario')
    Left = 208
    Top = 352
    object UsuariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object UsuariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object UsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
      Size = 100
    end
    object UsuariosSENHA: TWideStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 100
    end
    object UsuariosOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = 'OPERADOR'
      Required = True
    end
    object UsuariosDATAREG: TDateTimeField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object UsuariosSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object UsuariosTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
  end
  object Tablekey: TFDQuery
    CachedUpdates = True
    Connection = FComSQLite
    SQL.Strings = (
      'SELECT * FROM KEYFIELD')
    Left = 243
    Top = 280
    object TablekeyKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      Size = 30
    end
    object TablekeyDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object TablekeyID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TablekeySTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
  end
end
