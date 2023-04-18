object dmLeitura: TdmLeitura
  OldCreateOrder = False
  Height = 499
  Width = 692
  object SyncCurral: TFDQuery
    Connection = udb.FConTGC
    SQL.Strings = (
      'select *'
      'from CAD_CURRAL'
      'WHERE CC_STATUS='#39'ATIVO'#39)
    Left = 80
    Top = 40
    object SyncCurralCC_CODIGO: TIntegerField
      FieldName = 'CC_CODIGO'
      Origin = 'CC_CODIGO'
      Required = True
    end
    object SyncCurralCC_LINHA: TStringField
      FieldName = 'CC_LINHA'
      Origin = 'CC_LINHA'
      Size = 10
    end
    object SyncCurralCC_NUMERO: TStringField
      FieldName = 'CC_NUMERO'
      Origin = 'CC_NUMERO'
      Size = 10
    end
    object SyncCurralCC_STATUS: TStringField
      FieldName = 'CC_STATUS'
      Origin = 'CC_STATUS'
      Size = 80
    end
    object SyncCurralCC_NOME: TStringField
      FieldName = 'CC_NOME'
      Origin = 'CC_NOME'
      Size = 100
    end
    object SyncCurralCC_ORDEM: TIntegerField
      FieldName = 'CC_ORDEM'
      Origin = 'CC_ORDEM'
    end
  end
  object SyncLote: TFDQuery
    Connection = udb.FConTGC
    SQL.Strings = (
      'SELECT *  FROM CAD_LOTE A'
      'WHERE CLL_STATUS='#39'A'#39)
    Left = 80
    Top = 88
  end
  object SyncNotas: TFDQuery
    Connection = udb.FConTGC
    SQL.Strings = (
      'SELECT * FROM SELECT_NOTAS'
      'WHERE AJUSTE IS NOT NULL')
    Left = 80
    Top = 144
    object SyncNotasNOTA: TFMTBCDField
      FieldName = 'NOTA'
      Origin = 'NOTA'
      Precision = 18
      Size = 2
    end
    object SyncNotasAJUSTE: TFMTBCDField
      FieldName = 'AJUSTE'
      Origin = 'AJUSTE'
      Precision = 18
      Size = 2
    end
  end
  object SyncUsuario: TFDQuery
    Connection = udb.FConTGC
    SQL.Strings = (
      'SELECT '
      ' CUSER_CODIGO ID,'
      ' CUSER_NOME NOME,'
      ' CUSER_LOGIN USUARIO,'
      ' CUSER_SENHA SENHA'
      'FROM CAD_USUARIO')
    Left = 80
    Top = 200
    object SyncUsuarioID: TIntegerField
      FieldName = 'ID'
      Origin = 'CUSER_CODIGO'
      Required = True
    end
    object SyncUsuarioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CUSER_NOME'
      Required = True
      Size = 80
    end
    object SyncUsuarioUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'CUSER_LOGIN'
      Required = True
      Size = 30
    end
    object SyncUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'CUSER_SENHA'
      Required = True
    end
  end
  object SyncLeitura: TFDQuery
    Connection = udb.FConTGC
    SQL.Strings = (
      'SELECT * FROM TMP_LEITURA_APP')
    Left = 80
    Top = 256
    object SyncLeituraTMP_CODIGO: TLargeintField
      FieldName = 'TMP_CODIGO'
      Origin = 'TMP_CODIGO'
      Required = True
    end
    object SyncLeituraTMP_CURRAL: TStringField
      FieldName = 'TMP_CURRAL'
      Origin = 'TMP_CURRAL'
    end
    object SyncLeituraTMP_CODCURRAL: TIntegerField
      FieldName = 'TMP_CODCURRAL'
      Origin = 'TMP_CODCURRAL'
    end
    object SyncLeituraTMP_NOTA_DIURNA: TFMTBCDField
      FieldName = 'TMP_NOTA_DIURNA'
      Origin = 'TMP_NOTA_DIURNA'
      Precision = 18
      Size = 2
    end
    object SyncLeituraTMP_NOTA_NOTURNA: TStringField
      FieldName = 'TMP_NOTA_NOTURNA'
      Origin = 'TMP_NOTA_NOTURNA'
      FixedChar = True
      Size = 1
    end
    object SyncLeituraTMP_DATA_HORA: TSQLTimeStampField
      FieldName = 'TMP_DATA_HORA'
      Origin = 'TMP_DATA_HORA'
    end
    object SyncLeituraTMP_COMPORTAMENTO: TStringField
      FieldName = 'TMP_COMPORTAMENTO'
      Origin = 'TMP_COMPORTAMENTO'
      Size = 50
    end
    object SyncLeituraTMP_CODUSUARIO: TIntegerField
      FieldName = 'TMP_CODUSUARIO'
      Origin = 'TMP_CODUSUARIO'
      Required = True
    end
    object SyncLeituraTMP_DATAREG: TSQLTimeStampField
      FieldName = 'TMP_DATAREG'
      Origin = 'TMP_DATAREG'
    end
    object SyncLeituraTMP_FLAG_LEITURA: TStringField
      FieldName = 'TMP_FLAG_LEITURA'
      Origin = 'TMP_FLAG_LEITURA'
      FixedChar = True
      Size = 1
    end
    object SyncLeituraTMP_FLAG_ATUALIZADO: TStringField
      FieldName = 'TMP_FLAG_ATUALIZADO'
      Origin = 'TMP_FLAG_ATUALIZADO'
      FixedChar = True
      Size = 1
    end
  end
  object SyncHistLeitura: TFDQuery
    Connection = udb.FConTGC
    SQL.Strings = (
      'SELECT * FROM HIST_NOTAS')
    Left = 184
    Top = 40
    object SyncHistLeituraDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object SyncHistLeituraID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
    end
    object SyncHistLeituraID_BAIA: TStringField
      FieldName = 'ID_BAIA'
      Origin = 'ID_BAIA'
      Size = 30
    end
    object SyncHistLeituraNOTA: TFMTBCDField
      FieldName = 'NOTA'
      Origin = 'NOTA'
      Precision = 18
      Size = 2
    end
    object SyncHistLeituraAJUSTE_KG: TFMTBCDField
      FieldName = 'AJUSTE_KG'
      Origin = 'AJUSTE_KG'
      Precision = 18
      Size = 2
    end
  end
  object SyncHistConsumo: TFDQuery
    Connection = udb.FConTGC
    SQL.Strings = (
      'SELECT * FROM GRAFICO_CONSUMO')
    Left = 184
    Top = 96
    object SyncHistConsumoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object SyncHistConsumoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
    end
    object SyncHistConsumoLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      Size = 30
    end
    object SyncHistConsumoMN: TFMTBCDField
      FieldName = 'MN'
      Origin = 'MN'
      Precision = 18
      Size = 2
    end
    object SyncHistConsumoMS: TFMTBCDField
      FieldName = 'MS'
      Origin = 'MS'
      Precision = 18
      Size = 2
    end
    object SyncHistConsumoIMS_PV: TFMTBCDField
      FieldName = 'IMS_PV'
      Origin = 'IMS_PV'
      Precision = 18
      Size = 2
    end
  end
end
