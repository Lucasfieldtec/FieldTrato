object dmSync: TdmSync
  OldCreateOrder = False
  Height = 534
  Width = 601
  object Racao: TFDQuery
    CachedUpdates = True
    Connection = udb.FCon
    SQL.Strings = (
      'select * from racao'
      'where status=1')
    Left = 43
    Top = 72
    object RacaoId: TIntegerField
      FieldName = 'Id'
      Origin = 'Id'
    end
    object RacaoNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 100
    end
    object RacaoTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Size = 100
    end
    object RacaoTempoMistura: TIntegerField
      FieldName = 'TempoMistura'
      Origin = 'TempoMistura'
    end
    object RacaoStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
    end
    object RacaoDatareg: TDateTimeField
      FieldName = 'Datareg'
      Origin = 'Datareg'
    end
  end
  object Alimentos: TFDQuery
    CachedUpdates = True
    Connection = udb.FCon
    SQL.Strings = (
      'select * from Alimentos'
      'where status=1')
    Left = 40
    Top = 17
    object AlimentosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object AlimentosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object AlimentosDATAREG: TDateTimeField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object AlimentosSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
  end
  object RacaoAlimentos: TFDQuery
    CachedUpdates = True
    OnReconcileError = RacaoAlimentosReconcileError
    Connection = udb.FCon
    SQL.Strings = (
      'select * from RacaoAlimentos ')
    Left = 108
    Top = 80
    object RacaoAlimentosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object RacaoAlimentosIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'IDRACAO'
      Required = True
    end
    object RacaoAlimentosIDALIMENTO: TIntegerField
      FieldName = 'IDALIMENTO'
      Origin = 'IDALIMENTO'
      Required = True
    end
    object RacaoAlimentosINCLUSAOMN: TBCDField
      FieldName = 'INCLUSAOMN'
      Origin = 'INCLUSAOMN'
      Required = True
      Precision = 15
      Size = 2
    end
    object RacaoAlimentosORDEMFABRICACAO: TIntegerField
      FieldName = 'ORDEMFABRICACAO'
      Origin = 'ORDEMFABRICACAO'
      Required = True
    end
    object RacaoAlimentosPERCENTTOLERANCIA: TBCDField
      FieldName = 'PERCENTTOLERANCIA'
      Origin = 'PERCENTTOLERANCIA'
      Precision = 15
      Size = 2
    end
    object RacaoAlimentosVALORKG: TBCDField
      FieldName = 'VALORKG'
      Origin = 'VALORKG'
      Precision = 15
      Size = 3
    end
    object RacaoAlimentosMS: TBCDField
      FieldName = 'MS'
      Origin = 'MS'
      Precision = 15
      Size = 3
    end
  end
  object Usuarios: TFDQuery
    CachedUpdates = True
    OnReconcileError = UsuariosReconcileError
    Connection = udb.FCon
    SQL.Strings = (
      'select * from usuario')
    Left = 40
    Top = 136
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
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 376
    Top = 32
  end
  object Fabricacao: TFDQuery
    Connection = udb.FCon
    SQL.Strings = (
      'select '
      ' id,'
      ' IdReceita CBT_CODRACAOPROD,'
      ' A.RealizadoKG CBT_QTDEBATIDA,'
      ' (SELECT SUM(VALORFABRICADO)'
      '  FROM FabricacaoAlimentos WHERE IDFABRICACAO=A.ID)CBT_CUSTO,'
      ' A.Data CBT_DATA,'
      ' A.HoraIni CBT_INICIO,'
      ' A.HoraIni CBT_FIM,'
      ' A.IdUsuario CBT_USUARIO,'
      ' A.PrevKG CBT_QTDEPREVISTA,'
      ' A.Lote CBT_LOTE_FABRICACAO,'
      
        ' (SELECT NOME FROM usuario WHERE ID=A.IDOPERADOR) CBT_NOMEOPERAD' +
        'OR,'
      ' IDOPERADOR CBT_COD_OPERADOR_PA '
      'from Fabricacao A'
      'where a.finalizada=1 and sync=0'
      'and A.RealizadoKG>0')
    Left = 280
    Top = 160
  end
  object FabricacaoAlimentosTGC: TFDQuery
    Connection = udb.FCon
    SQL.Strings = (
      'select '
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
    Left = 400
    Top = 160
  end
  object qryAux: TFDQuery
    Connection = udb.FCon
    Left = 120
    Top = 8
  end
  object Previsao: TFDQuery
    CachedUpdates = True
    Connection = udb.FCon
    SQL.Strings = (
      'select * from FornecimentoPrevisto'
      'where data=current_date')
    Left = 112
    Top = 144
    object PrevisaoDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object PrevisaoIDCURRAL: TIntegerField
      FieldName = 'IDCURRAL'
      Origin = 'IDCURRAL'
      Required = True
    end
    object PrevisaoIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'IDRACAO'
      Required = True
    end
    object PrevisaoSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object PrevisaoTRATO: TIntegerField
      FieldName = 'TRATO'
      Origin = 'TRATO'
      Required = True
    end
    object PrevisaoTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object PrevisaoKGPREVISTO: TIntegerField
      FieldName = 'KGPREVISTO'
      Origin = 'KGPREVISTO'
      Required = True
    end
  end
  object Currais: TFDQuery
    CachedUpdates = True
    OnReconcileError = CurraisReconcileError
    Connection = udb.FCon
    SQL.Strings = (
      'select * from currais')
    Left = 40
    Top = 184
    object CurraisID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object CurraisLINHA: TStringField
      FieldName = 'LINHA'
      Origin = 'LINHA'
      Size = 10
    end
    object CurraisNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object CurraisNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 30
    end
    object CurraisTAG_INICIO: TStringField
      FieldName = 'TAG_INICIO'
      Origin = 'TAG_INICIO'
      Size = 50
    end
    object CurraisTAG_FIM: TStringField
      FieldName = 'TAG_FIM'
      Origin = 'TAG_FIM'
      Size = 30
    end
    object CurraisSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object CurraisORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
    end
  end
  object Fornecimento: TFDQuery
    Connection = udb.FCon
    SQL.Strings = (
      'SELECT '
      ' max(V.ID)ID,'
      ' sum(KGREALIZADO) CFORN_REALIZADO,'
      ' avg(C.ValorKG) CFORN_CUSTO,'
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
      'JOIN Carregamento C ON C.ID=V.IDCARREGAMENTO'
      'JOIN usuario U ON V.IDUSUARIO=U.ID'
      'where v.Sync=0'
      'group by IDCURRAL,TRATO,"DATA"')
    Left = 280
    Top = 216
  end
  object Carregamentos: TFDQuery
    Connection = udb.FCon
    SQL.Strings = (
      'select * from carregamento'
      'where flagSync=0')
    Left = 280
    Top = 104
    object CarregamentosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CarregamentosIDRacao: TIntegerField
      FieldName = 'IDRacao'
      Origin = 'IDRacao'
      Required = True
    end
    object CarregamentosKGFabricado: TBCDField
      FieldName = 'KGFabricado'
      Origin = 'KGFabricado'
      Required = True
      Precision = 15
      Size = 3
    end
    object CarregamentosDataFabricacao: TDateField
      FieldName = 'DataFabricacao'
      Origin = 'DataFabricacao'
      Required = True
    end
    object CarregamentosDataCarregamento: TDateField
      FieldName = 'DataCarregamento'
      Origin = 'DataCarregamento'
    end
    object CarregamentosPesoInicio: TBCDField
      FieldName = 'PesoInicio'
      Origin = 'PesoInicio'
      Precision = 15
      Size = 3
    end
    object CarregamentosPesoFim: TBCDField
      FieldName = 'PesoFim'
      Origin = 'PesoFim'
      Precision = 15
      Size = 3
    end
    object CarregamentosTotalCarregado: TBCDField
      FieldName = 'TotalCarregado'
      Origin = 'TotalCarregado'
      Precision = 15
      Size = 3
    end
    object CarregamentosLoteFabricacao: TStringField
      FieldName = 'LoteFabricacao'
      Origin = 'LoteFabricacao'
      Size = 100
    end
    object CarregamentosidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'idUsuario'
      Required = True
    end
    object CarregamentosStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
      Required = True
    end
    object CarregamentosDatareg: TDateTimeField
      FieldName = 'Datareg'
      Origin = 'Datareg'
      Required = True
    end
    object CarregamentosValorKG: TBCDField
      FieldName = 'ValorKG'
      Origin = 'ValorKG'
      Precision = 15
      Size = 3
    end
    object CarregamentosFlagSync: TIntegerField
      FieldName = 'FlagSync'
      Origin = 'FlagSync'
    end
    object CarregamentosDataSync: TDateTimeField
      FieldName = 'DataSync'
      Origin = 'DataSync'
    end
    object CarregamentosIDVAGAO: TIntegerField
      FieldName = 'IDVAGAO'
      Origin = 'IDVAGAO'
    end
  end
  object SYNC_FABRICACAO: TFDQuery
    Connection = udb.FCon
    SQL.Strings = (
      'select '
      ' A.*,'
      ' b.NOME RACAO,'
      ' (SELECT NOME FROM usuario WHERE ID=A.IDOPERADOR) OPERADOR '
      'from Fabricacao A'
      'join Racao b on b.ID=A.IdReceita'
      'where a.finalizada=1 and sync=0'
      'and A.RealizadoKG>0')
    Left = 304
    Top = 320
    object SYNC_FABRICACAOId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
    object SYNC_FABRICACAOLote: TStringField
      FieldName = 'Lote'
      Origin = 'Lote'
    end
    object SYNC_FABRICACAOStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
      Required = True
    end
    object SYNC_FABRICACAOValorKG: TBCDField
      FieldName = 'ValorKG'
      Origin = 'ValorKG'
      Precision = 15
      Size = 3
    end
    object SYNC_FABRICACAORACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RACAO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object SYNC_FABRICACAOOPERADOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OPERADOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object QryAuxLoop: TFDQuery
    Connection = udb.FCon
    Left = 64
    Top = 264
  end
  object SYNC_FABRICACAO_INSUMO: TFDQuery
    Connection = udb.FCon
    SQL.Strings = (
      'select '
      ' A.*,'
      ' b.NOME INSUMO'
      'from FabricacaoAlimentos A'
      'join Alimentos b on b.ID=A.IdAlimento'
      'WHERE A.RealizadoKG>0 AND A.Sync=0')
    Left = 304
    Top = 376
    object SYNC_FABRICACAO_INSUMOId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object SYNC_FABRICACAO_INSUMOIdFabricacao: TIntegerField
      FieldName = 'IdFabricacao'
      Origin = 'IdFabricacao'
      Required = True
    end
    object SYNC_FABRICACAO_INSUMOIdAlimento: TIntegerField
      FieldName = 'IdAlimento'
      Origin = 'IdAlimento'
      Required = True
    end
    object SYNC_FABRICACAO_INSUMOHoraIni: TDateTimeField
      FieldName = 'HoraIni'
      Origin = 'HoraIni'
    end
    object SYNC_FABRICACAO_INSUMOHoraFim: TDateTimeField
      FieldName = 'HoraFim'
      Origin = 'HoraFim'
    end
    object SYNC_FABRICACAO_INSUMOPrevKG: TFMTBCDField
      FieldName = 'PrevKG'
      Origin = 'PrevKG'
      Required = True
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAO_INSUMORealizadoKG: TFMTBCDField
      FieldName = 'RealizadoKG'
      Origin = 'RealizadoKG'
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAO_INSUMOPesoBalancaInicio: TFMTBCDField
      FieldName = 'PesoBalancaInicio'
      Origin = 'PesoBalancaInicio'
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAO_INSUMOPesoBalancaFim: TFMTBCDField
      FieldName = 'PesoBalancaFim'
      Origin = 'PesoBalancaFim'
      Precision = 18
      Size = 2
    end
    object SYNC_FABRICACAO_INSUMOSync: TIntegerField
      FieldName = 'Sync'
      Origin = 'Sync'
      Required = True
    end
    object SYNC_FABRICACAO_INSUMODataSync: TDateTimeField
      FieldName = 'DataSync'
      Origin = 'DataSync'
    end
    object SYNC_FABRICACAO_INSUMOOrdem: TIntegerField
      FieldName = 'Ordem'
      Origin = 'Ordem'
      Required = True
    end
    object SYNC_FABRICACAO_INSUMOPercentToleracia: TIntegerField
      FieldName = 'PercentToleracia'
      Origin = 'PercentToleracia'
      Required = True
    end
    object SYNC_FABRICACAO_INSUMOVALORKG: TBCDField
      FieldName = 'VALORKG'
      Origin = 'VALORKG'
      Precision = 15
      Size = 3
    end
    object SYNC_FABRICACAO_INSUMOVALORFABRICADO: TBCDField
      FieldName = 'VALORFABRICADO'
      Origin = 'VALORFABRICADO'
      Precision = 15
      Size = 3
    end
    object SYNC_FABRICACAO_INSUMOMS_PREV: TBCDField
      FieldName = 'MS_PREV'
      Origin = 'MS_PREV'
      Precision = 15
      Size = 3
    end
    object SYNC_FABRICACAO_INSUMOKGMS_REAL: TBCDField
      FieldName = 'KGMS_REAL'
      Origin = 'KGMS_REAL'
      Precision = 15
      Size = 3
    end
    object SYNC_FABRICACAO_INSUMOINSUMO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSUMO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object SYNC_FORNECIMENTO: TFDQuery
    CachedUpdates = True
    Connection = udb.FCon
    SQL.Strings = (
      'SELECT '
      ' v.*,'
      ' c.NOME CURRAL,'
      ' r.NOME RACAO,'
      ' U.NOME USUARIO '
      'from fornecimento V'
      'JOIN usuario U ON V.IDUSUARIO=U.ID'
      'join currais c on c.ID=V.IDCURRAL'
      'join Racao r on r.ID=V.IDRACAOREAL '
      'where v.Sync=0 AND V.KGREALIZADO>0')
    Left = 296
    Top = 432
    object SYNC_FORNECIMENTOID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
end
