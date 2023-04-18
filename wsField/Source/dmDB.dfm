object udb: Tudb
  OldCreateOrder = False
  Height = 521
  Width = 627
  object FConFiled: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=F:\FieldPec\Db\SantaLagoa\nova\FIELDPEC_STA_LAGOA.FDB'
      'DriverID=FB')
    Left = 40
    Top = 24
  end
  object FBDriverLink: TFDPhysFBDriverLink
    Left = 40
    Top = 88
  end
  object Racao: TFDQuery
    CachedUpdates = True
    Connection = FConFiled
    SQL.Strings = (
      'SELECT '
      ' id,'
      ' NOME,'
      ' CASE '
      '  WHEN TIPO=1 THEN '#39'Adapta'#231#227'o'#39' '
      '  WHEN TIPO=2 THEN '#39'Crescimento'#39' '
      '  WHEN TIPO=3 THEN '#39'Termina'#231#227'o'#39' '
      '  WHEN TIPO=4 THEN '#39'Transi'#231#227'o'#39' '
      ' end TIPO,'
      ' TEMPO_MISTURA TempoMistura,'
      ' STATUS,'
      ' DATAREGISTRO Datareg'
      'FROM RACAO r ')
    Left = 123
    Top = 184
    object RacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object RacaoTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object RacaoTEMPOMISTURA: TIntegerField
      FieldName = 'TEMPOMISTURA'
      Origin = 'TEMPO_MISTURA'
    end
    object RacaoSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object RacaoDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREGISTRO'
      Required = True
    end
  end
  object Alimentos: TFDQuery
    CachedUpdates = True
    Connection = FConFiled
    SQL.Strings = (
      'select ID,NOME,DATAREG,STATUS from ALIMENTO'
      'UNION all'
      'SELECT ID,NOME,DATAREG,STATUS FROM SUPLEMENTO_MINERAL')
    Left = 128
    Top = 81
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
    object AlimentosDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object AlimentosSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
  end
  object RacaoAlimentos: TFDQuery
    CachedUpdates = True
    Connection = FConFiled
    SQL.Strings = (
      'SELECT '
      ' ID,'
      ' IDRACAO,'
      ' COALESCE(IDINSUMOALIMENTO,ID_PREMISTURA)IDALIMENTO,'
      ' A.INCLUSAOMATERIANATURAL INCLUSAOMN,'
      ' A.ORDEM_FABRICACAO ORDEMFABRICACAO,'
      ' A.TOLERANCIA_FAB PERCENTTOLERANCIA,'
      ' A.VALORKG,'
      ' A.PERCENTMATERIASECA MS'
      'FROM RACAOINSUMOS  A ')
    Left = 124
    Top = 248
    object RacaoAlimentosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RacaoAlimentosIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'IDRACAO'
      Required = True
    end
    object RacaoAlimentosIDALIMENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'IDALIMENTO'
      Origin = 'IDALIMENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object RacaoAlimentosINCLUSAOMN: TFMTBCDField
      FieldName = 'INCLUSAOMN'
      Origin = 'INCLUSAOMATERIANATURAL'
      Precision = 18
      Size = 3
    end
    object RacaoAlimentosORDEMFABRICACAO: TIntegerField
      FieldName = 'ORDEMFABRICACAO'
      Origin = 'ORDEM_FABRICACAO'
    end
    object RacaoAlimentosPERCENTTOLERANCIA: TFMTBCDField
      FieldName = 'PERCENTTOLERANCIA'
      Origin = 'TOLERANCIA_FAB'
      Precision = 18
      Size = 3
    end
    object RacaoAlimentosVALORKG: TFMTBCDField
      FieldName = 'VALORKG'
      Origin = 'VALORKG'
      Required = True
      Precision = 18
      Size = 3
    end
    object RacaoAlimentosMS: TFMTBCDField
      FieldName = 'MS'
      Origin = 'PERCENTMATERIASECA'
      Required = True
      Precision = 18
      Size = 3
    end
  end
  object Usuarios: TFDQuery
    CachedUpdates = True
    Connection = FConFiled
    SQL.Strings = (
      'SELECT '
      ' u.id,'
      ' u.name NOME,'
      ' u.LOGIN,'
      ' u.PASSWORD SENHA,'
      ' CASE '
      '  WHEN ac.NOME='#39'OPERADOR DE PA'#39' THEN '#39'1'#39
      '  ELSE  '
      '   '#39'0'#39
      ' END OPERADOR,'
      ' u.DT_REGISTER DATAREG,'
      ' U.STATUS,'
      ' U.TIPO'
      'FROM USERS u'
      'JOIN AUX_CARGO ac ON u.ID_CARGO =ac.ID ')
    Left = 128
    Top = 24
    object UsuariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object UsuariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NAME'
      Size = 100
    end
    object UsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 100
    end
    object UsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Origin = '"PASSWORD"'
      Size = 255
    end
    object UsuariosOPERADOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OPERADOR'
      Origin = 'OPERADOR'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object UsuariosDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DT_REGISTER'
    end
    object UsuariosSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object UsuariosTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
  end
  object Previsao: TFDQuery
    CachedUpdates = True
    Connection = FConFiled
    SQL.Strings = (
      'SELECT '
      ' DATA_FORN DATA,'
      ' ID_LOCAL IDCURRAL,'
      ' ID_RACAO IDRACAO,'
      ' STATUS,'
      ' TRATO,'
      ' 1 TIPO,'
      ' PREVISTO_MN_KG KGPREVISTO '
      'FROM FORNECIMENTO_CONF A')
    Left = 120
    Top = 304
    object PrevisaoDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA_FORN'
    end
    object PrevisaoIDCURRAL: TIntegerField
      FieldName = 'IDCURRAL'
      Origin = 'ID_LOCAL'
      Required = True
    end
    object PrevisaoIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'ID_RACAO'
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
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
    end
    object PrevisaoKGPREVISTO: TIntegerField
      FieldName = 'KGPREVISTO'
      Origin = 'PREVISTO_MN_KG'
      Required = True
    end
  end
  object Currais: TFDQuery
    CachedUpdates = True
    Connection = FConFiled
    SQL.Strings = (
      'SELECT ID,'
      ' CODIGO NOME, '
      ' CASE '
      '  WHEN POSITION('#39'-'#39' IN CODIGO)>0 THEN'
      '    SUBSTRING(codigo FROM 1 FOR (POSITION('#39'-'#39' IN CODIGO)-1)) '
      '  ELSE'
      '    '#39#39
      ' END LINHA,'
      ' CASE '
      '  WHEN POSITION('#39'-'#39' IN CODIGO)>0 THEN'
      
        '    SUBSTRING(codigo FROM (POSITION('#39'-'#39' IN CODIGO)+1) FOR CHAR_L' +
        'ENGTH(CODIGO)) '
      '  ELSE'
      '    '#39#39
      ' END NUMERO, '
      ' A.TAG_INICIO,'
      ' a.TAG_FIM,'
      ' A.ORDERM_FORN ORDEM,'
      ' A.STATUS '
      'FROM CURRAIS A  ')
    Left = 128
    Top = 136
    object CurraisID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CurraisNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CODIGO'
      Size = 100
    end
    object CurraisLINHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LINHA'
      Origin = 'LINHA'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object CurraisNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object CurraisTAG_INICIO: TStringField
      FieldName = 'TAG_INICIO'
      Origin = 'TAG_INICIO'
      Size = 30
    end
    object CurraisTAG_FIM: TStringField
      FieldName = 'TAG_FIM'
      Origin = 'TAG_FIM'
      Size = 30
    end
    object CurraisORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDERM_FORN'
    end
    object CurraisSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
  end
  object RacaoTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'SELECT '
      ' RD.CRP_CODIGO id,'
      ' V.CR_NOME NOME,'
      ' CR_TIPO TIPO,'
      ' RD.CRP_TEMPO_MISTURA * 60 TempoMistura,'
      ' CASE '
      '  WHEN  RD.CRP_STATUS ='#39'A'#39' THEN '#39'1'#39
      '  WHEN RD.CRP_STATUS  ='#39'I'#39' THEN '#39'-1'#39
      ' END STATUS, '
      ' RD.CRP_DATAREG Datareg'
      'FROM CAD_RACAO_PROD RD  '
      'JOIN CAD_RACAO V ON V.CR_CODIGO=RD.CRP_CODRACAO'
      'WHERE RD.CRP_STATUS ='#39'A'#39
      '')
    Left = 235
    Top = 184
    object RacaoTGCID: TIntegerField
      FieldName = 'ID'
      Origin = 'CRP_CODIGO'
      Required = True
    end
    object RacaoTGCNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'CR_NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object RacaoTGCTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'CR_TIPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object RacaoTGCTEMPOMISTURA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TEMPOMISTURA'
      Origin = 'TEMPOMISTURA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object RacaoTGCSTATUS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object RacaoTGCDATAREG: TDateField
      FieldName = 'DATAREG'
      Origin = 'CRP_DATAREG'
    end
  end
  object AlimentosTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'select '
      ' AA_CODIGO ID,AA_NOME NOME,AA_DATAREG DATAREG,'#39'1'#39' STATUS '
      'from CAD_ALIMENTO')
    Left = 232
    Top = 81
    object AlimentosTGCID: TIntegerField
      FieldName = 'ID'
      Origin = 'AA_CODIGO'
      Required = True
    end
    object AlimentosTGCDATAREG: TDateField
      FieldName = 'DATAREG'
      Origin = 'AA_DATAREG'
    end
    object AlimentosTGCSTATUS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object AlimentosTGCNOME: TStringField
      FieldName = 'NOME'
      Origin = 'AA_NOME'
      Required = True
      Size = 50
    end
  end
  object RacaoAlimentosTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'SELECT '
      ' A.ID,'
      ' CODIGORECEITA IDRACAO,'
      ' CODIGOINGREDIENTE IDALIMENTO,'
      ' A.PERCENTUALMATERIANATURAL INCLUSAOMN,'
      ' A.ORDEMBATIDA ORDEMFABRICACAO,'
      ' A.TOLERANCIA PERCENTTOLERANCIA,'
      ' DP.DETRAP_VALOR VALORKG,'
      ' DP.DETRAP_MSALIM MS'
      'FROM CR1_INGREDIENTES_RECEITA  A '
      
        'JOIN DET_ALIM_RACAO_PROD DP ON DP.DETRAP_CODALIMENTO=A.CODIGOING' +
        'REDIENTE'
      'JOIN CAD_RACAO_PROD CRP ON  A.CODIGORECEITA=CRP.CRP_CODIGO '
      'WHERE CRP.CRP_STATUS='#39'A'#39)
    Left = 236
    Top = 240
    object RacaoAlimentosTGCID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RacaoAlimentosTGCIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'CODIGORECEITA'
      Required = True
    end
    object RacaoAlimentosTGCIDALIMENTO: TIntegerField
      FieldName = 'IDALIMENTO'
      Origin = 'CODIGOINGREDIENTE'
      Required = True
    end
    object RacaoAlimentosTGCINCLUSAOMN: TFMTBCDField
      FieldName = 'INCLUSAOMN'
      Origin = 'PERCENTUALMATERIANATURAL'
      Precision = 18
      Size = 2
    end
    object RacaoAlimentosTGCORDEMFABRICACAO: TIntegerField
      FieldName = 'ORDEMFABRICACAO'
      Origin = 'ORDEMBATIDA'
      Required = True
    end
    object RacaoAlimentosTGCPERCENTTOLERANCIA: TFMTBCDField
      FieldName = 'PERCENTTOLERANCIA'
      Origin = 'TOLERANCIA'
      Precision = 18
      Size = 2
    end
    object RacaoAlimentosTGCVALORKG: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALORKG'
      Origin = 'DETRAP_VALOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object RacaoAlimentosTGCMS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MS'
      Origin = 'DETRAP_MSALIM'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
  end
  object UsuariosTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'SELECT u.CF_CODIGO ID,'
      ' u.CF_NOME NOME,'
      ' u.CF_APELIDO LOGIN,'
      ' u.CF_SENHA SENHA,'
      ' CASE '
      '  WHEN U.CF_cARGO='#39'OPERADOR DE PA'#39' THEN '#39'1'#39
      '  WHEN U.CF_cARGO='#39'OPERADOR'#39' THEN '#39'1'#39
      '  WHEN U.CF_cARGO='#39'PASEIRO'#39' THEN '#39'1'#39
      '  WHEN U.CF_cARGO='#39'OPERADOR P'#193#39' THEN '#39'1'#39
      '  ELSE  '
      '   '#39'0'#39
      ' END OPERADOR,'
      ' CURRENT_DATE DATAREG,'
      ' CASE'
      '  WHEN U.CF_STATUS='#39'A'#39' THEN '#39'1'#39' '
      '  ELSE'
      '   '#39'0'#39
      ' END STATUS,'
      ' '#39'1'#39' TIPO '
      'FROM CAD_FUNCIONARIO U'
      'WHERE U.CF_SENHA>0 ')
    Left = 232
    Top = 32
    object IntegerField10: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'NOME'
      Origin = 'NAME'
      Size = 100
    end
    object StringField5: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 40
    end
    object StringField6: TStringField
      FieldName = 'SENHA'
      Origin = '"PASSWORD"'
    end
    object StringField7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OPERADOR'
      Origin = 'OPERADOR'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object UsuariosTGCDATAREG: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      ProviderFlags = []
      ReadOnly = True
    end
    object UsuariosTGCSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'CF_STATUS'
      FixedChar = True
      Size = 1
    end
    object UsuariosTGCTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
  end
  object PrevisaoTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'SELECT '
      ' Y.DATA,'
      ' Y.IDCURRAL,'
      ' Y.IDRACAO,'
      ' Y.STATUS,'
      ' Y.TRATO,'
      ' Y.TIPO,'
      ' CASE '
      '  WHEN Y.TRATO=Y.MAX_TRATO THEN'
      
        '   ROUND((SELECT SUM(F.CFORN_PREVISTO)-SUM(F.CFORN_REALIZADO) FR' +
        'OM CAD_FORNECIMENTO F '
      '    WHERE F.CFORN_DATAFORNECIDO=Y.DATA'
      '    AND F.CFORN_CODBAIA=Y.IDCURRAL))  '
      '  ELSE'
      '   Y.KGPREVISTO'
      ' END  KGPREVISTO'
      'FROM '
      '(SELECT '
      ' A.CFORN_DATAFORNECIDO DATA,'
      ' A.CFORN_CODBAIA IDCURRAL,'
      ' A.CFORN_CODRACAOPROD IDRACAO,'
      ' '#39'1'#39' STATUS,'
      ' A.CFORN_TRATO TRATO,'
      ' 1 TIPO,'
      ' ROUND(A.CFORN_PREVISTO) KGPREVISTO,'
      ' (SELECT MAX(CFORN_TRATO) FROM CAD_FORNECIMENTO F '
      ' WHERE F.CFORN_DATAFORNECIDO=A.CFORN_DATAFORNECIDO'
      
        ' AND F.CFORN_CODLOTE=A.CFORN_CODLOTE AND A.CFORN_CODBAIA=F.CFORN' +
        '_CODBAIA) MAX_TRATO'
      'FROM CAD_FORNECIMENTO A'
      
        'WHERE A.CFORN_DATAFORNECIDO=(SELECT MAX(CFORN_DATAFORNECIDO) FRO' +
        'M CAD_FORNECIMENTO))Y')
    Left = 232
    Top = 296
    object PrevisaoTGCDATA: TDateField
      FieldName = 'DATA'
      Origin = 'CFORN_DATAFORNECIDO'
    end
    object PrevisaoTGCIDCURRAL: TIntegerField
      FieldName = 'IDCURRAL'
      Origin = 'CFORN_CODBAIA'
      Required = True
    end
    object PrevisaoTGCIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'CFORN_CODRACAOPROD'
      Required = True
    end
    object PrevisaoTGCSTATUS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object PrevisaoTGCTRATO: TIntegerField
      FieldName = 'TRATO'
      Origin = 'CFORN_TRATO'
      Required = True
    end
    object PrevisaoTGCTIPO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
    end
    object PrevisaoTGCKGPREVISTO: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'KGPREVISTO'
      Origin = 'KGPREVISTO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object CurraisTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'SELECT A.CC_CODIGO ID,'
      ' A.CC_NOME NOME, '
      ' A.CC_LINHA LINHA,'
      ' A.CC_NUMERO NUMERO, '
      ' A.CC_TAG_INICIAL TAG_INICIO,'
      ' A.CC_TAG_FINAL TAG_FIM,'
      ' A.CC_ORDEM ORDEM,'
      ' CASE'
      '   WHEN A.CC_STATUS='#39'ATIVO'#39' THEN '#39'1'#39
      '   ELSE'
      '    '#39'-1'#39' '
      ' END'
      'STATUS'
      'FROM CAD_CURRAL A  ')
    Left = 232
    Top = 136
    object CurraisTGCID: TIntegerField
      FieldName = 'ID'
      Origin = 'CC_CODIGO'
      Required = True
    end
    object CurraisTGCNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CC_NOME'
      Size = 21
    end
    object CurraisTGCLINHA: TStringField
      FieldName = 'LINHA'
      Origin = 'CC_LINHA'
      Size = 10
    end
    object CurraisTGCNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'CC_NUMERO'
      Size = 10
    end
    object CurraisTGCTAG_INICIO: TStringField
      FieldName = 'TAG_INICIO'
      Origin = 'CC_TAG_INICIAL'
      Size = 100
    end
    object CurraisTGCTAG_FIM: TStringField
      FieldName = 'TAG_FIM'
      Origin = 'CC_TAG_FINAL'
      Size = 100
    end
    object CurraisTGCORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'CC_ORDEM'
    end
    object CurraisTGCSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'CC_STATUS'
      Size = 80
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
    Left = 32
    Top = 168
  end
  object FabricacaoTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'select '
      ' *'
      'from CAD_BATIDA')
    Left = 376
    Top = 24
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
  object FabricacaoAlimentosTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'select '
      ' *'
      'from DET_BATIDA')
    Left = 360
    Top = 91
    object FabricacaoAlimentosTGCDBT_CODIGO: TIntegerField
      FieldName = 'DBT_CODIGO'
      Origin = 'DBT_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FabricacaoAlimentosTGCDBT_CODBATIDA: TIntegerField
      FieldName = 'DBT_CODBATIDA'
      Origin = 'DBT_CODBATIDA'
    end
    object FabricacaoAlimentosTGCDBT_CODALIMENTO: TIntegerField
      FieldName = 'DBT_CODALIMENTO'
      Origin = 'DBT_CODALIMENTO'
    end
    object FabricacaoAlimentosTGCDBT_QTDE: TBCDField
      FieldName = 'DBT_QTDE'
      Origin = 'DBT_QTDE'
      Precision = 18
    end
    object FabricacaoAlimentosTGCDBT_DATAREG: TDateField
      FieldName = 'DBT_DATAREG'
      Origin = 'DBT_DATAREG'
    end
    object FabricacaoAlimentosTGCDBT_USUARIO: TStringField
      FieldName = 'DBT_USUARIO'
      Origin = 'DBT_USUARIO'
      Size = 50
    end
    object FabricacaoAlimentosTGCDBT_CUSTO: TBCDField
      FieldName = 'DBT_CUSTO'
      Origin = 'DBT_CUSTO'
      Precision = 18
    end
    object FabricacaoAlimentosTGCDBT_DATA: TDateField
      FieldName = 'DBT_DATA'
      Origin = 'DBT_DATA'
    end
    object FabricacaoAlimentosTGCDBT_HORA: TTimeField
      FieldName = 'DBT_HORA'
      Origin = 'DBT_HORA'
    end
    object FabricacaoAlimentosTGCDBT_QTDEPREVISTA: TBCDField
      FieldName = 'DBT_QTDEPREVISTA'
      Origin = 'DBT_QTDEPREVISTA'
      Precision = 18
    end
    object FabricacaoAlimentosTGCDBT_PREV_MS: TBCDField
      FieldName = 'DBT_PREV_MS'
      Origin = 'DBT_PREV_MS'
      Precision = 18
    end
    object FabricacaoAlimentosTGCDBT_PREV_KGMNP: TBCDField
      FieldName = 'DBT_PREV_KGMNP'
      Origin = 'DBT_PREV_KGMNP'
      Precision = 18
    end
    object FabricacaoAlimentosTGCDBT_PREV_KGMSP: TBCDField
      FieldName = 'DBT_PREV_KGMSP'
      Origin = 'DBT_PREV_KGMSP'
      Precision = 18
    end
    object FabricacaoAlimentosTGCDBT_PREV_VALOR_KG: TBCDField
      FieldName = 'DBT_PREV_VALOR_KG'
      Origin = 'DBT_PREV_VALOR_KG'
      Precision = 18
    end
    object FabricacaoAlimentosTGCDBT_PREV_VALOR_TOTAL: TBCDField
      FieldName = 'DBT_PREV_VALOR_TOTAL'
      Origin = 'DBT_PREV_VALOR_TOTAL'
      Precision = 18
    end
    object FabricacaoAlimentosTGCDBT_KGMS: TFloatField
      FieldName = 'DBT_KGMS'
      Origin = 'DBT_KGMS'
    end
    object FabricacaoAlimentosTGCDBT_REAL_KGMSP: TBCDField
      FieldName = 'DBT_REAL_KGMSP'
      Origin = 'DBT_REAL_KGMSP'
      Precision = 18
    end
    object FabricacaoAlimentosTGCDBT_HORA_INI: TTimeField
      FieldName = 'DBT_HORA_INI'
      Origin = 'DBT_HORA_INI'
    end
    object FabricacaoAlimentosTGCDBT_HORA_FIM: TTimeField
      FieldName = 'DBT_HORA_FIM'
      Origin = 'DBT_HORA_FIM'
    end
    object FabricacaoAlimentosTGCDBT_REAL_KGMNP: TBCDField
      FieldName = 'DBT_REAL_KGMNP'
      Origin = 'DBT_REAL_KGMNP'
      Precision = 18
    end
    object FabricacaoAlimentosTGCDBT_CODOPERADOR: TIntegerField
      FieldName = 'DBT_CODOPERADOR'
      Origin = 'DBT_CODOPERADOR'
    end
    object FabricacaoAlimentosTGCDBT_MS: TBCDField
      FieldName = 'DBT_MS'
      Origin = 'DBT_MS'
      Precision = 18
    end
    object FabricacaoAlimentosTGCSYNC_ECO_DATA: TSQLTimeStampField
      FieldName = 'SYNC_ECO_DATA'
      Origin = 'SYNC_ECO_DATA'
    end
    object FabricacaoAlimentosTGCSYNC_ECO: TStringField
      FieldName = 'SYNC_ECO'
      Origin = 'SYNC_ECO'
      FixedChar = True
      Size = 1
    end
  end
  object FornecimentoTGC: TFDQuery
    CachedUpdates = True
    Connection = FConTGC
    SQL.Strings = (
      'SELECT '
      '*'
      'from CAD_fornecimento ')
    Left = 360
    Top = 152
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
    Left = 352
    Top = 200
  end
end
