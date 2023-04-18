object udb: Tudb
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 479
  Width = 785
  object FCon: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      
        'Database=F:\Projetos\FieldTecnology\Projetos\FieldTrato\exe\Depl' +
        'oyWin\db\dbFieldTrato.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FConBeforeConnect
    Left = 32
    Top = 8
  end
  object LinkDriverLink1: TFDPhysSQLiteDriverLink
    Left = 32
    Top = 64
  end
  object Config: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from Config')
    Left = 168
    Top = 72
    object Configid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConfigIpServ: TStringField
      FieldName = 'IpServ'
      Origin = 'IpServ'
    end
    object ConfigPortaServ: TStringField
      FieldName = 'PortaServ'
      Origin = 'PortaServ'
    end
    object ConfigIPClp: TStringField
      FieldName = 'IPClp'
      Origin = 'IPClp'
    end
    object ConfigPortaCLP: TStringField
      FieldName = 'PortaCLP'
      Origin = 'PortaCLP'
    end
    object ConfigTipoOperacao: TIntegerField
      FieldName = 'TipoOperacao'
      Origin = 'TipoOperacao'
    end
    object ConfigidVagao: TIntegerField
      FieldName = 'idVagao'
      Origin = 'idVagao'
    end
    object ConfigTempoPularIngrediente: TIntegerField
      FieldName = 'TempoPularIngrediente'
      Origin = 'TempoPularIngrediente'
    end
    object ConfigPesoEstavelBalanca: TIntegerField
      FieldName = 'PesoEstavelBalanca'
      Origin = 'PesoEstavelBalanca'
    end
    object ConfigSistema: TIntegerField
      FieldName = 'Sistema'
      Origin = 'Sistema'
      Required = True
    end
  end
  object Alimentos: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from Alimentos'
      'where status=1')
    Left = 168
    Top = 17
    object AlimentosId: TIntegerField
      FieldName = 'Id'
      Origin = 'Id'
    end
    object AlimentosNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 100
    end
    object AlimentosDataReg: TDateTimeField
      FieldName = 'DataReg'
      Origin = 'DataReg'
    end
    object AlimentosStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
    end
  end
  object Racao: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from racao'
      'where status=1')
    Left = 259
    Top = 16
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
  object FabricacaoAlimentos: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.nome Alimento,'
      ' (a.MS_PREV-a.RealizadoKG) difKG,'
      ' (a.RealizadoKG*100)/(a.MS_PREV) difPercent  '
      'from FabricacaoAlimentos a '
      'join Alimentos b on a.IdAlimento=b.Id')
    Left = 362
    Top = 64
  end
  object Fabricacao: TFDQuery
    CachedUpdates = True
    OnReconcileError = FabricacaoReconcileError
    Connection = FCon
    SQL.Strings = (
      'select a.*,b.Nome Racao,c.Nome Operador from Fabricacao a '
      'join Racao b on a.IdReceita=b.Id'
      'join usuario c on c.id=a.IdOperador')
    Left = 361
    Top = 16
    object FabricacaoId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
    object FabricacaoRacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Racao'
      Origin = 'Nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FabricacaoOperador: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Operador'
      Origin = 'Nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object RacaoAlimentos: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select a.*,b.Nome Alimento from RacaoAlimentos a '
      'join Alimentos b on a.idAlimento=b.Id')
    Left = 260
    Top = 64
    object RacaoAlimentosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
    object RacaoAlimentosAlimento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Alimento'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object RacaoAlimentosMS: TBCDField
      FieldName = 'MS'
      Origin = 'MS'
      Precision = 15
      Size = 3
    end
  end
  object Operador: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from usuario'
      'where status=1 and operador=1')
    Left = 256
    Top = 120
    object OperadorId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object OperadorNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 100
    end
    object OperadorLogin: TStringField
      FieldName = 'Login'
      Origin = 'Login'
      Required = True
      Size = 100
    end
    object OperadorSenha: TWideStringField
      FieldName = 'Senha'
      Origin = 'Senha'
      Required = True
      Size = 100
    end
    object OperadorOperador: TIntegerField
      FieldName = 'Operador'
      Origin = 'Operador'
      Required = True
    end
    object OperadorDatareg: TDateTimeField
      FieldName = 'Datareg'
      Origin = 'Datareg'
      Required = True
    end
    object OperadorStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
      Required = True
    end
    object OperadorTipo: TIntegerField
      FieldName = 'Tipo'
      Origin = 'Tipo'
    end
  end
  object TRacaoFabricando: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select a.*,b.nome RacaoFab from Fabricacao a  '
      'join Racao b on b.Id=a.IdReceita'
      'where a.id=('
      'select max(id) from Fabricacao'
      'where Status=1 and Finalizada=0'
      ')')
    Left = 504
    Top = 16
    object TRacaoFabricandoId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TRacaoFabricandoIdReceita: TIntegerField
      FieldName = 'IdReceita'
      Origin = 'IdReceita'
      Required = True
    end
    object TRacaoFabricandoIdUsuario: TIntegerField
      FieldName = 'IdUsuario'
      Origin = 'IdUsuario'
    end
    object TRacaoFabricandoIdOperador: TIntegerField
      FieldName = 'IdOperador'
      Origin = 'IdOperador'
    end
    object TRacaoFabricandoData: TDateField
      FieldName = 'Data'
      Origin = 'Data'
      Required = True
    end
    object TRacaoFabricandoHoraIni: TDateTimeField
      FieldName = 'HoraIni'
      Origin = 'HoraIni'
    end
    object TRacaoFabricandoHoraFim: TDateTimeField
      FieldName = 'HoraFim'
      Origin = 'HoraFim'
    end
    object TRacaoFabricandoPrevKG: TFMTBCDField
      FieldName = 'PrevKG'
      Origin = 'PrevKG'
      Required = True
      Precision = 18
      Size = 2
    end
    object TRacaoFabricandoRealizadoKG: TFMTBCDField
      FieldName = 'RealizadoKG'
      Origin = 'RealizadoKG'
      Precision = 18
      Size = 2
    end
    object TRacaoFabricandoPesoBalancaInicio: TFMTBCDField
      FieldName = 'PesoBalancaInicio'
      Origin = 'PesoBalancaInicio'
      Precision = 18
      Size = 2
    end
    object TRacaoFabricandoPesoBalancaFim: TFMTBCDField
      FieldName = 'PesoBalancaFim'
      Origin = 'PesoBalancaFim'
      Precision = 18
      Size = 2
    end
    object TRacaoFabricandoFinalizada: TIntegerField
      FieldName = 'Finalizada'
      Origin = 'Finalizada'
    end
    object TRacaoFabricandoCarregada: TIntegerField
      FieldName = 'Carregada'
      Origin = 'Carregada'
      Required = True
    end
    object TRacaoFabricandoSync: TIntegerField
      FieldName = 'Sync'
      Origin = 'Sync'
      Required = True
    end
    object TRacaoFabricandoDataSync: TDateTimeField
      FieldName = 'DataSync'
      Origin = 'DataSync'
    end
    object TRacaoFabricandoIdVAGAO: TIntegerField
      FieldName = 'IdVAGAO'
      Origin = 'IdVAGAO'
    end
    object TRacaoFabricandotrato: TIntegerField
      FieldName = 'trato'
      Origin = 'trato'
    end
    object TRacaoFabricandoLote: TStringField
      FieldName = 'Lote'
      Origin = 'Lote'
    end
    object TRacaoFabricandoStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
      Required = True
    end
    object TRacaoFabricandoRacaoFab: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RacaoFab'
      Origin = 'Nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object TRacaoFabricandoAlimentos: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select a.*,b.nome Alimento from FabricacaoAlimentos a '
      'join Alimentos b on a.IdAlimento=b.Id')
    Left = 504
    Top = 64
    object TRacaoFabricandoAlimentosId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TRacaoFabricandoAlimentosIdFabricacao: TIntegerField
      FieldName = 'IdFabricacao'
      Origin = 'IdFabricacao'
      Required = True
    end
    object TRacaoFabricandoAlimentosIdAlimento: TIntegerField
      FieldName = 'IdAlimento'
      Origin = 'IdAlimento'
      Required = True
    end
    object TRacaoFabricandoAlimentosHoraIni: TDateTimeField
      FieldName = 'HoraIni'
      Origin = 'HoraIni'
    end
    object TRacaoFabricandoAlimentosHoraFim: TDateTimeField
      FieldName = 'HoraFim'
      Origin = 'HoraFim'
    end
    object TRacaoFabricandoAlimentosPrevKG: TFMTBCDField
      FieldName = 'PrevKG'
      Origin = 'PrevKG'
      Required = True
      Precision = 18
      Size = 2
    end
    object TRacaoFabricandoAlimentosRealizadoKG: TFMTBCDField
      FieldName = 'RealizadoKG'
      Origin = 'RealizadoKG'
      Precision = 18
      Size = 2
    end
    object TRacaoFabricandoAlimentosPesoBalancaInicio: TFMTBCDField
      FieldName = 'PesoBalancaInicio'
      Origin = 'PesoBalancaInicio'
      Precision = 18
      Size = 2
    end
    object TRacaoFabricandoAlimentosPesoBalancaFim: TFMTBCDField
      FieldName = 'PesoBalancaFim'
      Origin = 'PesoBalancaFim'
      Precision = 18
      Size = 2
    end
    object TRacaoFabricandoAlimentosSync: TIntegerField
      FieldName = 'Sync'
      Origin = 'Sync'
      Required = True
    end
    object TRacaoFabricandoAlimentosDataSync: TDateTimeField
      FieldName = 'DataSync'
      Origin = 'DataSync'
    end
    object TRacaoFabricandoAlimentosOrdem: TIntegerField
      FieldName = 'Ordem'
      Origin = 'Ordem'
      Required = True
    end
    object TRacaoFabricandoAlimentosPercentToleracia: TIntegerField
      FieldName = 'PercentToleracia'
      Origin = 'PercentToleracia'
      Required = True
    end
    object TRacaoFabricandoAlimentosAlimento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Alimento'
      Origin = 'Nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object TIngredienteFabricando: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select a.*,b.nome Alimento from FabricacaoAlimentos a '
      'join Alimentos b on a.IdAlimento=b.Id')
    Left = 504
    Top = 120
    object TIngredienteFabricandoId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TIngredienteFabricandoIdFabricacao: TIntegerField
      FieldName = 'IdFabricacao'
      Origin = 'IdFabricacao'
      Required = True
    end
    object TIngredienteFabricandoIdAlimento: TIntegerField
      FieldName = 'IdAlimento'
      Origin = 'IdAlimento'
      Required = True
    end
    object TIngredienteFabricandoHoraIni: TDateTimeField
      FieldName = 'HoraIni'
      Origin = 'HoraIni'
    end
    object TIngredienteFabricandoHoraFim: TDateTimeField
      FieldName = 'HoraFim'
      Origin = 'HoraFim'
    end
    object TIngredienteFabricandoPrevKG: TFMTBCDField
      FieldName = 'PrevKG'
      Origin = 'PrevKG'
      Required = True
      Precision = 18
      Size = 2
    end
    object TIngredienteFabricandoRealizadoKG: TFMTBCDField
      FieldName = 'RealizadoKG'
      Origin = 'RealizadoKG'
      Precision = 18
      Size = 2
    end
    object TIngredienteFabricandoPesoBalancaInicio: TFMTBCDField
      FieldName = 'PesoBalancaInicio'
      Origin = 'PesoBalancaInicio'
      Precision = 18
      Size = 2
    end
    object TIngredienteFabricandoPesoBalancaFim: TFMTBCDField
      FieldName = 'PesoBalancaFim'
      Origin = 'PesoBalancaFim'
      Precision = 18
      Size = 2
    end
    object TIngredienteFabricandoSync: TIntegerField
      FieldName = 'Sync'
      Origin = 'Sync'
      Required = True
    end
    object TIngredienteFabricandoDataSync: TDateTimeField
      FieldName = 'DataSync'
      Origin = 'DataSync'
    end
    object TIngredienteFabricandoOrdem: TIntegerField
      FieldName = 'Ordem'
      Origin = 'Ordem'
      Required = True
    end
    object TIngredienteFabricandoPercentToleracia: TIntegerField
      FieldName = 'PercentToleracia'
      Origin = 'PercentToleracia'
      Required = True
    end
    object TIngredienteFabricandoAlimento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Alimento'
      Origin = 'Nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object Usuario: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select * from usuario'
      'where status=1')
    Left = 168
    Top = 123
    object UsuarioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object UsuarioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object UsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
      Size = 100
    end
    object UsuarioSENHA: TWideStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 100
    end
    object UsuarioOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = 'OPERADOR'
      Required = True
    end
    object UsuarioDATAREG: TDateTimeField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object UsuarioSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object UsuarioTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
  end
  object Currais: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from currais')
    Left = 264
    Top = 248
    object CurraisID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
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
  object PrevistoFor: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from FornecimentoPrevisto')
    Left = 376
    Top = 248
    object PrevistoForID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object PrevistoForDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object PrevistoForIDCURRAL: TIntegerField
      FieldName = 'IDCURRAL'
      Origin = 'IDCURRAL'
      Required = True
    end
    object PrevistoForIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'IDRACAO'
      Required = True
    end
    object PrevistoForSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object PrevistoForTRATO: TIntegerField
      FieldName = 'TRATO'
      Origin = 'TRATO'
      Required = True
    end
    object PrevistoForTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object PrevistoForKGPREVISTO: TIntegerField
      FieldName = 'KGPREVISTO'
      Origin = 'KGPREVISTO'
      Required = True
    end
  end
  object Carregamento: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from Carregamento')
    Left = 376
    Top = 304
    object CarregamentoIDRacao: TIntegerField
      FieldName = 'IDRacao'
      Origin = 'IDRacao'
      Required = True
    end
    object CarregamentoKGFabricado: TBCDField
      FieldName = 'KGFabricado'
      Origin = 'KGFabricado'
      Required = True
      Precision = 15
      Size = 3
    end
    object CarregamentoDataFabricacao: TDateField
      FieldName = 'DataFabricacao'
      Origin = 'DataFabricacao'
      Required = True
    end
    object CarregamentoDataCarregamento: TDateField
      FieldName = 'DataCarregamento'
      Origin = 'DataCarregamento'
      Required = True
    end
    object CarregamentoPesoInicio: TBCDField
      FieldName = 'PesoInicio'
      Origin = 'PesoInicio'
      Precision = 15
      Size = 3
    end
    object CarregamentoPesoFim: TBCDField
      FieldName = 'PesoFim'
      Origin = 'PesoFim'
      Precision = 15
      Size = 3
    end
    object CarregamentoTotalCarregado: TBCDField
      FieldName = 'TotalCarregado'
      Origin = 'TotalCarregado'
      Precision = 15
      Size = 3
    end
    object CarregamentoLoteFabricacao: TStringField
      FieldName = 'LoteFabricacao'
      Origin = 'LoteFabricacao'
      Size = 100
    end
    object CarregamentoidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'idUsuario'
      Required = True
    end
    object CarregamentoStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
      Required = True
    end
    object CarregamentoDatareg: TDateTimeField
      FieldName = 'Datareg'
      Origin = 'Datareg'
      Required = True
    end
    object CarregamentoValorKG: TBCDField
      FieldName = 'ValorKG'
      Origin = 'ValorKG'
      Precision = 15
      Size = 3
    end
    object CarregamentoFlagSync: TIntegerField
      FieldName = 'FlagSync'
      Origin = 'FlagSync'
    end
    object CarregamentoDataSync: TDateTimeField
      FieldName = 'DataSync'
      Origin = 'DataSync'
    end
    object CarregamentoIDVAGAO: TIntegerField
      FieldName = 'IDVAGAO'
      Origin = 'IDVAGAO'
    end
    object CarregamentoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object Fornecimento: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select '
      ' a.* ,'
      ' b.Nome Curral,'
      ' c.NOME RacaoPrev,'
      ' d.NOME RacaoReal,'
      ' e.NOME Usuario'
      'from Fornecimento a '
      'join Currais b on a.IDCURRAL=b.ID'
      'join Racao c on c.id=a.IDRACAOPREV'
      'join Racao d on d.ID=a.IDRACAOREAL'
      'join usuario e on e.ID=a.IDUSUARIO')
    Left = 376
    Top = 360
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
    object FornecimentoCurral: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Curral'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FornecimentoRacaoPrev: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RacaoPrev'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FornecimentoRacaoReal: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RacaoReal'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FornecimentoUsuario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Usuario'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FornecimentoTIPOPREVISTO: TIntegerField
      FieldName = 'TIPOPREVISTO'
      Origin = 'TIPOPREVISTO'
      Required = True
    end
  end
  object QPrevistoFor: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select '
      ' A.*,'
      ' B.NOME CURRAL,'
      ' C.NOME RACAO,'
      ' B.TAG_INICIO,'
      ' B.TAG_FIM,   '
      ' CAST(coalesce((select sum(KGREALIZADO) from Fornecimento s '
      
        ' where s.data=a.data and S.IDRACAOPREV=A.IDRACAO AND S.IDCURRAL=' +
        'A.IDCURRAL),0)AS VARCHAR(20))Realizado,'
      ' (select min(s.horainicio) from Fornecimento s '
      
        ' where s.data=a.data and S.IDRACAOPREV=A.IDRACAO AND S.IDCURRAL=' +
        'A.IDCURRAL)HoraIni,'
      ' (select min(s.horafim) from Fornecimento s '
      
        ' where s.data=a.data and S.IDRACAOPREV=A.IDRACAO AND S.IDCURRAL=' +
        'A.IDCURRAL)HoraFim'
      'from FornecimentoPrevisto A'
      'JOIN Currais B ON  A.IDCURRAL=B.ID'
      'JOIN RACAO C ON C.ID=A.IDRACAO')
    Left = 496
    Top = 240
    object QPrevistoForID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QPrevistoForDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object QPrevistoForIDCURRAL: TIntegerField
      FieldName = 'IDCURRAL'
      Origin = 'IDCURRAL'
      Required = True
    end
    object QPrevistoForIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'IDRACAO'
      Required = True
    end
    object QPrevistoForKGPREVISTO: TIntegerField
      FieldName = 'KGPREVISTO'
      Origin = 'KGPREVISTO'
      Required = True
    end
    object QPrevistoForSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object QPrevistoForTRATO: TIntegerField
      FieldName = 'TRATO'
      Origin = 'TRATO'
      Required = True
    end
    object QPrevistoForTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object QPrevistoForCURRAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CURRAL'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object QPrevistoForRACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RACAO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QPrevistoForRealizado: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Realizado'
      Origin = 'Realizado'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object QPrevistoForHoraIni: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'HoraIni'
      Origin = 'HoraIni'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object QPrevistoForHoraFim: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'HoraFim'
      Origin = 'HoraFim'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object QPrevistoForTAG_INICIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TAG_INICIO'
      Origin = 'TAG_INICIO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QPrevistoForTAG_FIM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TAG_FIM'
      Origin = 'TAG_FIM'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object CarregamentoDistribuidor: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select '
      ' c.*,'
      ' r.NOME||'#39'-'#39'||c.KGFabricado||'#39' kg'#39' carregamento'
      'from carregamento c'
      'join Racao r on c.IDRacao=r.ID'
      'where c.Status=1')
    Left = 144
    Top = 312
    object CarregamentoDistribuidorIDRacao: TIntegerField
      FieldName = 'IDRacao'
      Origin = 'IDRacao'
      Required = True
    end
    object CarregamentoDistribuidorKGFabricado: TBCDField
      FieldName = 'KGFabricado'
      Origin = 'KGFabricado'
      Required = True
      Precision = 15
      Size = 3
    end
    object CarregamentoDistribuidorDataFabricacao: TDateField
      FieldName = 'DataFabricacao'
      Origin = 'DataFabricacao'
      Required = True
    end
    object CarregamentoDistribuidorDataCarregamento: TDateField
      FieldName = 'DataCarregamento'
      Origin = 'DataCarregamento'
    end
    object CarregamentoDistribuidorPesoInicio: TBCDField
      FieldName = 'PesoInicio'
      Origin = 'PesoInicio'
      Precision = 15
      Size = 3
    end
    object CarregamentoDistribuidorPesoFim: TBCDField
      FieldName = 'PesoFim'
      Origin = 'PesoFim'
      Precision = 15
      Size = 3
    end
    object CarregamentoDistribuidorTotalCarregado: TBCDField
      FieldName = 'TotalCarregado'
      Origin = 'TotalCarregado'
      Precision = 15
      Size = 3
    end
    object CarregamentoDistribuidorLoteFabricacao: TStringField
      FieldName = 'LoteFabricacao'
      Origin = 'LoteFabricacao'
      Size = 100
    end
    object CarregamentoDistribuidoridUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'idUsuario'
      Required = True
    end
    object CarregamentoDistribuidorStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
      Required = True
    end
    object CarregamentoDistribuidorDatareg: TDateTimeField
      FieldName = 'Datareg'
      Origin = 'Datareg'
      Required = True
    end
    object CarregamentoDistribuidorValorKG: TBCDField
      FieldName = 'ValorKG'
      Origin = 'ValorKG'
      Precision = 15
      Size = 3
    end
    object CarregamentoDistribuidorFlagSync: TIntegerField
      FieldName = 'FlagSync'
      Origin = 'FlagSync'
    end
    object CarregamentoDistribuidorDataSync: TDateTimeField
      FieldName = 'DataSync'
      Origin = 'DataSync'
    end
    object CarregamentoDistribuidorIDVAGAO: TIntegerField
      FieldName = 'IDVAGAO'
      Origin = 'IDVAGAO'
    end
    object CarregamentoDistribuidorID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CarregamentoDistribuidorcarregamento: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'carregamento'
      Origin = 'carregamento'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object QReplyPrev: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select * from FornecimentoPrevisto'
      'where data=(select max(data) from FornecimentoPrevisto)')
    Left = 496
    Top = 288
    object QReplyPrevID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QReplyPrevDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object QReplyPrevIDCURRAL: TIntegerField
      FieldName = 'IDCURRAL'
      Origin = 'IDCURRAL'
    end
    object QReplyPrevIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'IDRACAO'
    end
    object QReplyPrevKGPREVISTO: TIntegerField
      FieldName = 'KGPREVISTO'
      Origin = 'KGPREVISTO'
    end
    object QReplyPrevSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object QReplyPrevTRATO: TIntegerField
      FieldName = 'TRATO'
      Origin = 'TRATO'
    end
    object QReplyPrevTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
  end
  object QReplyPrevI: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from FornecimentoPrevisto'
      'where ID=-1')
    Left = 496
    Top = 344
    object QReplyPrevIID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QReplyPrevIDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object QReplyPrevIIDCURRAL: TIntegerField
      FieldName = 'IDCURRAL'
      Origin = 'IDCURRAL'
    end
    object QReplyPrevIIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'IDRACAO'
    end
    object QReplyPrevIKGPREVISTO: TIntegerField
      FieldName = 'KGPREVISTO'
      Origin = 'KGPREVISTO'
    end
    object QReplyPrevISTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object QReplyPrevITRATO: TIntegerField
      FieldName = 'TRATO'
      Origin = 'TRATO'
    end
    object QReplyPrevITIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
  end
  object qryAux: TFDQuery
    Connection = FCon
    Left = 32
    Top = 136
  end
end
