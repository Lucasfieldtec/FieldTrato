unit dmDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,System.JSON,
  System.JSON.Writers,System.IniFiles, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  FireDAC.Phys.IBBase,FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,System.JSON.Types,
  System.Variants, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs;

type
  Tudb = class(TDataModule)
    FConFiled: TFDConnection;
    FBDriverLink: TFDPhysFBDriverLink;
    Racao: TFDQuery;
    Alimentos: TFDQuery;
    RacaoAlimentos: TFDQuery;
    Usuarios: TFDQuery;
    Previsao: TFDQuery;
    Currais: TFDQuery;
    UsuariosID: TIntegerField;
    UsuariosNOME: TStringField;
    UsuariosLOGIN: TStringField;
    UsuariosSENHA: TStringField;
    UsuariosOPERADOR: TStringField;
    UsuariosDATAREG: TSQLTimeStampField;
    UsuariosSTATUS: TIntegerField;
    UsuariosTIPO: TIntegerField;
    AlimentosID: TIntegerField;
    AlimentosNOME: TStringField;
    AlimentosDATAREG: TSQLTimeStampField;
    AlimentosSTATUS: TIntegerField;
    CurraisID: TIntegerField;
    CurraisLINHA: TStringField;
    CurraisNUMERO: TStringField;
    CurraisTAG_INICIO: TStringField;
    CurraisTAG_FIM: TStringField;
    CurraisORDEM: TIntegerField;
    CurraisSTATUS: TIntegerField;
    CurraisNOME: TStringField;
    RacaoID: TIntegerField;
    RacaoNOME: TStringField;
    RacaoTIPO: TStringField;
    RacaoTEMPOMISTURA: TIntegerField;
    RacaoSTATUS: TIntegerField;
    RacaoDATAREG: TSQLTimeStampField;
    RacaoAlimentosID: TIntegerField;
    RacaoAlimentosIDRACAO: TIntegerField;
    RacaoAlimentosIDALIMENTO: TIntegerField;
    RacaoAlimentosINCLUSAOMN: TFMTBCDField;
    RacaoAlimentosORDEMFABRICACAO: TIntegerField;
    RacaoAlimentosPERCENTTOLERANCIA: TFMTBCDField;
    RacaoAlimentosVALORKG: TFMTBCDField;
    RacaoAlimentosMS: TFMTBCDField;
    PrevisaoDATA: TDateField;
    PrevisaoIDCURRAL: TIntegerField;
    PrevisaoIDRACAO: TIntegerField;
    PrevisaoSTATUS: TIntegerField;
    PrevisaoTRATO: TIntegerField;
    PrevisaoTIPO: TIntegerField;
    PrevisaoKGPREVISTO: TIntegerField;
    RacaoTGC: TFDQuery;
    AlimentosTGC: TFDQuery;
    RacaoAlimentosTGC: TFDQuery;
    UsuariosTGC: TFDQuery;
    IntegerField10: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    PrevisaoTGC: TFDQuery;
    CurraisTGC: TFDQuery;
    FConTGC: TFDConnection;
    UsuariosTGCDATAREG: TDateField;
    UsuariosTGCSTATUS: TStringField;
    UsuariosTGCTIPO: TStringField;
    AlimentosTGCID: TIntegerField;
    AlimentosTGCDATAREG: TDateField;
    AlimentosTGCSTATUS: TStringField;
    CurraisTGCID: TIntegerField;
    CurraisTGCNOME: TStringField;
    CurraisTGCLINHA: TStringField;
    CurraisTGCNUMERO: TStringField;
    CurraisTGCTAG_INICIO: TStringField;
    CurraisTGCTAG_FIM: TStringField;
    CurraisTGCORDEM: TIntegerField;
    CurraisTGCSTATUS: TStringField;
    RacaoTGCID: TIntegerField;
    RacaoTGCNOME: TStringField;
    RacaoTGCTIPO: TStringField;
    RacaoTGCTEMPOMISTURA: TFMTBCDField;
    RacaoTGCSTATUS: TStringField;
    RacaoTGCDATAREG: TDateField;
    RacaoAlimentosTGCID: TIntegerField;
    RacaoAlimentosTGCIDRACAO: TIntegerField;
    RacaoAlimentosTGCIDALIMENTO: TIntegerField;
    RacaoAlimentosTGCINCLUSAOMN: TFMTBCDField;
    RacaoAlimentosTGCORDEMFABRICACAO: TIntegerField;
    RacaoAlimentosTGCPERCENTTOLERANCIA: TFMTBCDField;
    RacaoAlimentosTGCVALORKG: TBCDField;
    RacaoAlimentosTGCMS: TBCDField;
    PrevisaoTGCDATA: TDateField;
    PrevisaoTGCIDCURRAL: TIntegerField;
    PrevisaoTGCIDRACAO: TIntegerField;
    PrevisaoTGCSTATUS: TStringField;
    PrevisaoTGCTRATO: TIntegerField;
    PrevisaoTGCTIPO: TIntegerField;
    AlimentosTGCNOME: TStringField;
    PrevisaoTGCKGPREVISTO: TLargeintField;
    FabricacaoTGC: TFDQuery;
    FabricacaoAlimentosTGC: TFDQuery;
    FornecimentoTGC: TFDQuery;
    FabricacaoAlimentosTGCDBT_CODIGO: TIntegerField;
    FabricacaoAlimentosTGCDBT_CODBATIDA: TIntegerField;
    FabricacaoAlimentosTGCDBT_CODALIMENTO: TIntegerField;
    FabricacaoAlimentosTGCDBT_QTDE: TBCDField;
    FabricacaoAlimentosTGCDBT_DATAREG: TDateField;
    FabricacaoAlimentosTGCDBT_USUARIO: TStringField;
    FabricacaoAlimentosTGCDBT_CUSTO: TBCDField;
    FabricacaoAlimentosTGCDBT_DATA: TDateField;
    FabricacaoAlimentosTGCDBT_HORA: TTimeField;
    FabricacaoAlimentosTGCDBT_QTDEPREVISTA: TBCDField;
    FabricacaoAlimentosTGCDBT_PREV_MS: TBCDField;
    FabricacaoAlimentosTGCDBT_PREV_KGMNP: TBCDField;
    FabricacaoAlimentosTGCDBT_PREV_KGMSP: TBCDField;
    FabricacaoAlimentosTGCDBT_PREV_VALOR_KG: TBCDField;
    FabricacaoAlimentosTGCDBT_PREV_VALOR_TOTAL: TBCDField;
    FabricacaoAlimentosTGCDBT_KGMS: TFloatField;
    FabricacaoAlimentosTGCDBT_REAL_KGMSP: TBCDField;
    FabricacaoAlimentosTGCDBT_HORA_INI: TTimeField;
    FabricacaoAlimentosTGCDBT_HORA_FIM: TTimeField;
    FabricacaoAlimentosTGCDBT_REAL_KGMNP: TBCDField;
    FabricacaoAlimentosTGCDBT_CODOPERADOR: TIntegerField;
    FabricacaoAlimentosTGCDBT_MS: TBCDField;
    FabricacaoAlimentosTGCSYNC_ECO_DATA: TSQLTimeStampField;
    FabricacaoAlimentosTGCSYNC_ECO: TStringField;
    FornecimentoTGCCFORN_CODIGO: TIntegerField;
    FornecimentoTGCCFORN_CODBAIA: TIntegerField;
    FornecimentoTGCCFORN_PREVISTO: TBCDField;
    FornecimentoTGCCFORN_REALIZADO: TBCDField;
    FornecimentoTGCCFORN_FLAG: TStringField;
    FornecimentoTGCCFORN_STATUS: TStringField;
    FornecimentoTGCCFORN_DATAREG: TDateField;
    FornecimentoTGCCFORN_TRATO: TIntegerField;
    FornecimentoTGCCFORN_QTDEPARCIAL: TIntegerField;
    FornecimentoTGCCFORN_DIFERENCA: TBCDField;
    FornecimentoTGCCFORN_CODRACAOPROD: TIntegerField;
    FornecimentoTGCCFORN_MSRACAO: TBCDField;
    FornecimentoTGCCFORN_QTDECAB: TIntegerField;
    FornecimentoTGCCFORN_FLAG_LEITURA: TStringField;
    FornecimentoTGCCFORN_CUSTO: TBCDField;
    FornecimentoTGCCFORN_MOTORISTA: TStringField;
    FornecimentoTGCCFORN_HORA: TTimeField;
    FornecimentoTGCCFORN_CODLOTE: TIntegerField;
    FornecimentoTGCCFORN_FLAG_CONTAB: TStringField;
    FornecimentoTGCCFORN_NUMVAGAO: TStringField;
    FornecimentoTGCCFORN_CUSTO_RACAOPROD: TFloatField;
    FornecimentoTGCCFORN_FLAG_ENVIADO: TStringField;
    FornecimentoTGCCFORN_DATAFORNECIDO: TDateField;
    FornecimentoTGCCFORN_CODRACAOPROD_FORN: TIntegerField;
    FornecimentoTGCCFORN_SOBRACOCHO: TBCDField;
    FornecimentoTGCCFORN_FORNECIDO_REAL: TBCDField;
    FornecimentoTGCCFORN_FLAG_SOBRA: TStringField;
    FornecimentoTGCCFORN_MSRACAO_PREV: TBCDField;
    FornecimentoTGCCFORN_CODRACAOPROD_PREV: TIntegerField;
    FornecimentoTGCCFORN_AJUSTE_FORN: TFloatField;
    FornecimentoTGCCFORN_PREVISTO_LEITURA: TFloatField;
    FornecimentoTGCCFORN_REALIZADO_ACUMULADO_DIA: TFloatField;
    FornecimentoTGCCFORN_TOTAL_TRATO_DIA: TFloatField;
    FornecimentoTGCCFORN_DIF_TOTAL_ACUMULADO: TFloatField;
    FornecimentoTGCCFORN_ORIGEM_DADOS: TStringField;
    FornecimentoTGCCFORN_LOTE_FABRICACAO: TStringField;
    FornecimentoTGCCFORN_HORA_INI: TTimeField;
    FornecimentoTGCCFORN_HORA_FIM: TTimeField;
    FornecimentoTGCCFORN_FLAG_TMP: TStringField;
    FornecimentoTGCCFON_COD_CARREGAMENTO: TIntegerField;
    FornecimentoTGCCFORN_ORIGEM_CUSTO: TStringField;
    FornecimentoTGCCFORN_FLAG_RATEIO: TStringField;
    FornecimentoTGCSYNC_ECO_DATA: TSQLTimeStampField;
    FornecimentoTGCSYNC_ECO: TStringField;
    FornecimentoTGCCFORN_CODOCORRENCIA: TIntegerField;
    FabricacaoTGCCBT_CODIGO: TIntegerField;
    FabricacaoTGCCBT_CODRACAOPROD: TIntegerField;
    FabricacaoTGCCBT_QTDEBATIDA: TBCDField;
    FabricacaoTGCCBT_QTDECABECA: TIntegerField;
    FabricacaoTGCCBT_CUSTO: TBCDField;
    FabricacaoTGCCBT_DATA: TDateField;
    FabricacaoTGCCBT_INICIO: TTimeField;
    FabricacaoTGCCBT_FIM: TTimeField;
    FabricacaoTGCCBT_FLAG_FIM: TStringField;
    FabricacaoTGCCBT_DATAREG: TDateField;
    FabricacaoTGCCBT_USUARIO: TStringField;
    FabricacaoTGCCBT_TIPOENTRADA: TIntegerField;
    FabricacaoTGCCBT_CODCONCENTRADO: TIntegerField;
    FabricacaoTGCCBT_TIPO: TStringField;
    FabricacaoTGCCBT_TMP_CODBATIDA_DS: TIntegerField;
    FabricacaoTGCCBT_COD_BATIDA_ENVIADA: TIntegerField;
    FabricacaoTGCCBT_TOT_BATIDA_ENVIADA: TBCDField;
    FabricacaoTGCCBT_TMP_NUMBALANCA: TStringField;
    FabricacaoTGCCBT_CENTROCUSTO: TStringField;
    FabricacaoTGCCBT_QTDEPREVISTA: TBCDField;
    FabricacaoTGCCBT_LOTE_FABRICACAO: TStringField;
    FabricacaoTGCCBT_NOMEOPERADOR: TStringField;
    FabricacaoTGCCBT_NOME_MOTORISTA: TStringField;
    FabricacaoTGCCBT_ORIGEM_DADOS: TStringField;
    FabricacaoTGCCBT_COD_OPERADOR_PA: TIntegerField;
    FabricacaoTGCCBT_NUM_BALANCA: TIntegerField;
    FabricacaoTGCSYNC_ECO: TStringField;
    FabricacaoTGCSYNC_ECO_DATA: TSQLTimeStampField;
    FabricacaoTGCID_ARRENDAMENTO: TLargeintField;
    qryAuxTGC: TFDQuery;
    procedure qryAuxTGCReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    function GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
  public
    function ConectaFB_Local: TJSONObject;
    function ConectaFB_TGC: TJSONObject;
    function LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
    function GetTestaServidor: TJSONObject;
    function GetUsuario: TJSONObject;
    function GetAlimento: TJSONObject;
    function GetCurrais: TJSONObject;
    function GetRacao: TJSONObject;
    function AcceptInsumoRacao(Obj: TJSONObject): TJSONObject;
    function GetPrevisao: TJSONObject;
    //TGC
    function GetUsuarioTGC: TJSONObject;
    function GetAlimentoTGC: TJSONObject;
    function GetCurraisTGC: TJSONObject;
    function GetRacaoTGC: TJSONObject;
    function AcceptInsumoRacaoTGC(Obj: TJSONObject): TJSONObject;
    function GetPrevisaoTGC: TJSONObject;
    function AcceptFabricacaoTGC(Obj: TJSONObject): TJSONObject;
    function AcceptFabricacaoInsumosTGC(Obj: TJSONObject): TJSONObject;
    function AcceptFornecimentoTGC(Obj: TJSONObject): TJSONObject;
    function AcceptLeituraTGC(Obj: TJSONObject): TJSONObject;

    function RetornaNomeOperador(Id:string):string;
    function RetornaMSIngrediente(IdAlimento:string):string;

    function RetornaMaxIDFabricacaoTGC:String;
    function RetornaMaxIDCR1FabricacaoTGC:String;




  end;

var
  udb: Tudb;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UWsField, UdmSqlite;

{$R *.dfm}


{ Tudb }




function Tudb.GetTestaServidor: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
begin
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue('Servidor Testado com Sucesso!');
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function Tudb.AcceptInsumoRacaoTGC(Obj: TJSONObject): TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
 vJsonString,idAgenda:string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
begin
 if FConTGC.Connected=false then
  ConectaFB_TGC;
 vJsonString    := Obj.ToString;
 vJoInsert      := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem        := vJoInsert.GetValue('Racao') as TJSONArray;
 vJoItemO       := vJoItem.Items[0] as TJSONObject;
 idAgenda       :=  vJoItemO.GetValue('id').value;
 with RacaoAlimentosTGC,RacaoAlimentosTGC.SQL do
 begin
   Clear;
   Add('SELECT');
   Add('A.ID,');
   Add(' CODIGORECEITA IDRACAO,');
   Add(' CODIGOINGREDIENTE IDALIMENTO,');
   Add(' A.PERCENTUALMATERIANATURAL INCLUSAOMN,');
   Add(' A.ORDEMBATIDA ORDEMFABRICACAO,');
   Add(' A.TOLERANCIA PERCENTTOLERANCIA,');
   Add(' DP.DETRAP_VALOR VALORKG,');
   Add(' DP.DETRAP_MSALIM MS');
   Add('FROM CR1_INGREDIENTES_RECEITA  A');
   Add('JOIN DET_ALIM_RACAO_PROD DP ON DP.DETRAP_CODRACAOPROD=A.CODIGORECEITA');
   Add('AND DP.DETRAP_CODALIMENTO=A.CODIGOINGREDIENTE AND COD_MISTURADOR=1');
   Add('JOIN CAD_RACAO_PROD CRP ON  A.CODIGORECEITA=CRP.CRP_CODIGO AND A.CODIGOINGREDIENTE=DP.DETRAP_CODALIMENTO');
   Add('WHERE CRP.CRP_STATUS=''A''');
   Add('AND A.CODIGORECEITA='+idAgenda);
   Open;
 end;
 Result := GetDataSetAsJSON(RacaoAlimentosTGC);
end;

function Tudb.ConectaFB_Local: TJSONObject;
var
 Arquivo,
 vVendorLib,
 dbUser,
 dbPassw,
 dbName,
 dbServer,
 dbPort,vDataBase: String;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
begin
 StrAux  := TStringWriter.Create;
 txtJson := TJsonTextWriter.Create(StrAux);
 Arquivo := ExtractFilePath(ParamStr(0))+'CtrMineral.ini';
 if not FileExists(Arquivo) then
 begin
   txtJson.WriteStartObject;
   txtJson.WritePropertyName('Erro');
   txtJson.WriteValue('Arquivo CtrMineral.ini não localizado no seguinte diretorio:'+
   Arquivo);
   txtJson.WriteEndObject;
   Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
 end
 else
 begin
   vVendorLib := ExtractFilePath(ParamStr(0))+'\fbclient_32.dll';
   dbUser     := LerIni(Arquivo,'FIREBIRD','User','');
   dbPassw    := LerIni(Arquivo,'FIREBIRD','Password','');
   dbName     := LerIni(Arquivo,'FIREBIRD','Database','');
   dbServer   := LerIni(Arquivo,'FIREBIRD','Server','');
   dbPort     := LerIni(Arquivo,'FIREBIRD','Port','');
   with FConFiled do
   begin
    Params.Clear;
    Params.Values['DriverID']        := 'FB';
    Params.Values['User_name']       := dbUser;
    Params.Values['Database']        := dbName;
    Params.Values['Password']        := dbPassw;
    Params.Values['DriverName']      := 'FB';
    Params.Values['Server']          := dbServer;
    Params.Values['Port']            := dbPort;
    FBDriverLink.VendorLib           := vVendorLib;
    try
     Connected := true;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Conexao OK');
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     except
     on E : Exception do
       begin
        raise Exception.Create('');
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Não foi possivel conectar ao banco:'+e.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
   end;
 end;
end;

function Tudb.ConectaFB_TGC: TJSONObject;
var
 Arquivo,
 vVendorLib,
 dbUser,
 dbPassw,
 dbName,
 dbServer,
 dbPort,vDataBase: String;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
begin
 StrAux  := TStringWriter.Create;
 txtJson := TJsonTextWriter.Create(StrAux);
 Arquivo := ExtractFilePath(ParamStr(0))+'fieldconf.ini';
 if not FileExists(Arquivo) then
 begin
   txtJson.WriteStartObject;
   txtJson.WritePropertyName('Erro');
   txtJson.WriteValue('Arquivo CtrMineral.ini não localizado no seguinte diretorio:'+
   Arquivo);
   txtJson.WriteEndObject;
   Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
 end
 else
 begin
   vVendorLib := ExtractFilePath(ParamStr(0))+'fbclient_32.dll';
   dbUser     := LerIni(Arquivo,'TGC','User','');
   dbPassw    := LerIni(Arquivo,'TGC','Password','');
   dbName     := LerIni(Arquivo,'TGC','Database','');
   dbServer   := LerIni(Arquivo,'TGC','Server','');
   dbPort     := LerIni(Arquivo,'TGC','Port','');
   with FConTGC do
   begin
    Params.Clear;
    Params.Values['DriverID']        := 'FB';
    Params.Values['User_name']       := dbUser;
    Params.Values['Database']        := dbName;
    Params.Values['Password']        := dbPassw;
    Params.Values['DriverName']      := 'FB';
    Params.Values['Server']          := dbServer;
    Params.Values['Port']            := dbPort;
    FBDriverLink.VendorLib           := vVendorLib;
    try
     Connected := true;
     dmSqlite.GetUsuariosTGC;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Conexao OK');
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     except
     on E : Exception do
       begin
        frmPrincipal.memoLog.Lines.Add('Não foi possivel conectar ao banco:'+e.Message);
        raise Exception.Create('');
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Não foi possivel conectar ao banco:'+e.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
   end;
 end;
end;

function Tudb.LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
var
 FileIni: TIniFile;
begin
  result := ValorPadrao;
  try
    FileIni := TIniFile.Create(Diretorio);
    if FileExists(Diretorio) then
      result := FileIni.ReadString(Chave1, Chave2, ValorPadrao);
  finally
    FreeAndNil(FileIni)
  end;
end;

procedure Tudb.qryAuxTGCReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 frmPrincipal.memoLog.Lines.Add(e.Message)
end;

function Tudb.RetornaMaxIDCR1FabricacaoTGC: String;
begin
  with qryAuxTGC,qryAuxTGC.SQL do
 begin
   Clear;
   Add('select COALESCE(max(CR1W_DETFAB_CODIGO),0)+1 maxId from CR1_WIN_DET_FABRICACOES');
   Open;
   Result := FieldByName('maxId').AsString;
 end;
end;

function Tudb.RetornaMaxIDFabricacaoTGC: String;
begin
 with qryAuxTGC,qryAuxTGC.SQL do
 begin
   Clear;
   Add('select max(CBT_CODIGO)maxId from cad_batida');
   Open;
   Result := FieldByName('maxId').AsString;
 end;
end;

function Tudb.RetornaMSIngrediente(IdAlimento: string): string;
begin
 with qryAuxTGC,qryAuxTGC.SQL do
 begin
   Clear;
   Add('SELECT AA_MS FROM CAD_ALIMENTO');
   Add('WHERE AA_CODIGO='+IdAlimento);
   Open;
   Result := FieldByName('AA_MS').AsString;
 end;
end;

function Tudb.RetornaNomeOperador(Id: string): string;
begin
 with qryAuxTGC,qryAuxTGC.SQL do
 begin
   Clear;
   Add('SELECT * FROM CAD_FUNCIONARIO');
   Add('WHERE CF_CODIGO='+Id);
   Open;
   Result := FieldByName('CF_NOME').AsString;
 end;
end;

function Tudb.GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
var
  f: TField;
  o: TJSOnObject;
  a: TJSONArray;
begin
  a := TJSONArray.Create;
  DataSet.Active := True;
  DataSet.First;
  while not DataSet.EOF do begin
    o := TJSOnObject.Create;
    for f in DataSet.Fields do
      o.AddPair(f.FieldName, VarToStr(f.Value));
    a.AddElement(o);
    DataSet.Next;
  end;
  DataSet.Active := False;
  Result := TJSONObject.Create;
  Result.AddPair(DataSet.Name, a);
end;




function Tudb.GetUsuario: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FConFiled.Connected=false then ConectaFB_Local;
  Usuarios.Connection := FConFiled;
 Usuarios.Close;
 Usuarios.Open;
 Result := GetDataSetAsJSON(Usuarios);
end;

function Tudb.GetUsuarioTGC: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 UsuariosTGC.Close;
 UsuariosTGC.Open;
 Result := GetDataSetAsJSON(UsuariosTGC);
end;

function Tudb.GetAlimento: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FConFiled.Connected=false then ConectaFB_Local;
  Alimentos.Connection := FConFiled;
 Alimentos.Close;
 Alimentos.Open;
 Result := GetDataSetAsJSON(Alimentos);
end;

function Tudb.GetAlimentoTGC: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FConTGC.Connected=false then ConectaFB_TGC;
  AlimentosTGC.Connection := FConTGC;
 AlimentosTGC.Close;
 AlimentosTGC.Open;
 Result := GetDataSetAsJSON(AlimentosTGC);
end;

function Tudb.GetCurrais: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FConFiled.Connected=false then ConectaFB_Local;
  Currais.Connection := FConFiled;
 Currais.Close;
 Currais.Open;
 Result := GetDataSetAsJSON(Currais);
end;

function Tudb.GetCurraisTGC: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FConTGC.Connected=false then ConectaFB_TGC;
  CurraisTGC.Connection := FConTGC;
 CurraisTGC.Close;
 CurraisTGC.Open;
 Result := GetDataSetAsJSON(CurraisTGC);
end;

function Tudb.GetRacao: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FConFiled.Connected=false then ConectaFB_Local;
  Racao.Connection := FConFiled;
 Racao.Close;
 Racao.Open;
 Result := GetDataSetAsJSON(Racao);
end;

function Tudb.GetRacaoTGC: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FConTGC.Connected=false then ConectaFB_TGC;
  RacaoTGC.Connection := FConTGC;
 RacaoTGC.Close;
 RacaoTGC.Open;
 Result := GetDataSetAsJSON(RacaoTGC);
end;

function Tudb.AcceptFabricacaoTGC(Obj: TJSONObject): TJSONObject;
var
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
 vIdPedido,vIdentificador,vIdOperacaoExiste:string;
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 I          : Integer;
begin
 if FConTGC.Connected=false then
  ConectaFB_TGC;

 FabricacaoTGC.Close;
 FabricacaoTGC.Open;
 vJsonString := obj.ToString;
 vJoInsert := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem := vJoInsert.GetValue('TGCFabricacao') as TJSONArray;
 try
  for i := 0 to vJoItem.Count-1 do
  begin
    vJoItemO := vJoItem.Items[I] as TJSONObject;
    FabricacaoTGC.Insert;
    FabricacaoTGCCBT_CODRACAOPROD.AsString           := vJoItemO.GetValue('CBT_CODRACAOPROD').value;
    FabricacaoTGCCBT_QTDEBATIDA.AsString             := vJoItemO.GetValue('CBT_QTDEBATIDA').value;
    FabricacaoTGCCBT_CUSTO.AsString                  := vJoItemO.GetValue('CBT_CUSTO').value;
    FabricacaoTGCCBT_DATA.AsString                   := vJoItemO.GetValue('CBT_DATA').value;
    FabricacaoTGCCBT_INICIO.AsString                 := vJoItemO.GetValue('CBT_INICIO').value;
    FabricacaoTGCCBT_FIM.AsString                    := vJoItemO.GetValue('CBT_FIM').value;
    FabricacaoTGCCBT_USUARIO.AsString                := vJoItemO.GetValue('CBT_USUARIO').value;
    FabricacaoTGCCBT_QTDEPREVISTA.AsString           := vJoItemO.GetValue('CBT_QTDEPREVISTA').value;
    FabricacaoTGCCBT_LOTE_FABRICACAO.AsString        := vJoItemO.GetValue('CBT_LOTE_FABRICACAO').value;
    FabricacaoTGCCBT_NOMEOPERADOR.AsString           := vJoItemO.GetValue('CBT_NOMEOPERADOR').value;
    FabricacaoTGCCBT_COD_OPERADOR_PA.AsString        := vJoItemO.GetValue('CBT_COD_OPERADOR_PA').value;
    try
     FabricacaoTGC.ApplyUpdates(-1);
     vIdentificador := RetornaMaxIDFabricacaoTGC;
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Ok');
     txtJson.WriteValue(vIdentificador);
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
    except
     on E: Exception do
     begin
      StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       txtJson.WritePropertyName('Erro');
       txtJson.WriteValue('Erro Ao Sincronizar Operacao:'+E.Message);
       txtJson.WriteEndObject;
       Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     end;
    end;
  end;
 except
 on E: Exception do
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('Erro');
    txtJson.WriteValue('Erro Ao Sincronizar Pedido:'+E.Message);
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
 end;
end;

function Tudb.AcceptLeituraTGC(Obj: TJSONObject): TJSONObject;
var
 vJsonString,vCodTGC :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
 vIdPedido,vIdentificador,vIdOperacaoExiste:string;
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 I          : Integer;
begin
 if FConTGC.Connected=false then
  ConectaFB_TGC;

 vJsonString := obj.ToString;
 vJoInsert := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem := vJoInsert.GetValue('SyncLeitura') as TJSONArray;
  for i := 0 to vJoItem.Count-1 do
  begin
    vJoItemO := vJoItem.Items[I] as TJSONObject;
    with qryAuxTGC,qryAuxTGC.SQL do
    begin
        Clear;
        Add('INSERT INTO TMP_LEITURA_APP');
        Add('(TMP_CURRAL,TMP_CODCURRAL,TMP_NOTA_DIURNA,TMP_DATA_HORA,TMP_CODUSUARIO)');
        Add('values(');
        Add(vJoItemO.GetValue('TMP_CURRAL').value);
        Add(','+vJoItemO.GetValue('TMP_CODCURRAL').value);
        Add(','+vJoItemO.GetValue('TMP_NOTA_DIURNA').value);
        Add(','+vJoItemO.GetValue('TMP_DATA_HORA').value);
        Add(','+vJoItemO.GetValue('TMP_CODUSUARIO').value);
        Add(')');
       try
        qryAuxTGC.SQL.Text;
        ExecSQL;
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Ok');
        txtJson.WriteValue(vIdentificador);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      except
       on E: Exception do
       begin
        StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Leitura:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
      end;
    end;
  end;
end;


function Tudb.AcceptFornecimentoTGC(Obj: TJSONObject): TJSONObject;
var
 vJsonString,vCodTGC :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
 vIdPedido,vIdentificador,vIdOperacaoExiste:string;
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 I          : Integer;
begin
 if FConTGC.Connected=false then
  ConectaFB_TGC;

 vJsonString := obj.ToString;
 vJoInsert := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem := vJoInsert.GetValue('TGCFornecimento') as TJSONArray;
  for i := 0 to vJoItem.Count-1 do
  begin
    vJoItemO := vJoItem.Items[I] as TJSONObject;
    with qryAuxTGC,qryAuxTGC.SQL do
    begin
        Clear;
        Add('UPDATE CAD_FORNECIMENTO  SET');
        Add('CFORN_FLAG=''S''');
        Add(',CFORN_REALIZADO=CFORN_REALIZADO+'+vJoItemO.GetValue('CFORN_REALIZADO').value);
        Add(',CFORN_CUSTO='+StringReplace(vJoItemO.GetValue('CFORN_CUSTO').value,',','.',[rfReplaceAll]));
        Add(',CFORN_MOTORISTA='+vJoItemO.GetValue('CFORN_MOTORISTA').value.QuotedString);
        Add(',CFORN_HORA='+vJoItemO.GetValue('CFORN_HORA').value.QuotedString);
        Add(',CFORN_LOTE_FABRICACAO='+vJoItemO.GetValue('CFORN_LOTE_FABRICACAO').value.QuotedString);
        Add(',CFORN_HORA_INI='+vJoItemO.GetValue('CFORN_HORA_INI').value.QuotedString);
        Add(',CFORN_HORA_FIM='+vJoItemO.GetValue('CFORN_HORA_FIM').value.QuotedString);
        Add(',CFORN_DATAFORNECIDO='+vJoItemO.GetValue('CFORN_DATAFORNECIDO').value.QuotedString);
        Add(',CFORN_CODBAIA='+vJoItemO.GetValue('CFORN_CODBAIA').value);
        Add(',CFORN_TRATO='+vJoItemO.GetValue('CFORN_TRATO').value);
        Add(',CFORN_CODRACAOPROD_PREV='+vJoItemO.GetValue('CFORN_CODRACAOPROD_PREV').value);
        Add('WHERE CFORN_CODBAIA='+vJoItemO.GetValue('CFORN_CODBAIA').value);
        Add('AND CFORN_TRATO='+vJoItemO.GetValue('CFORN_TRATO').value);
        Add('AND CFORN_DATAFORNECIDO='+vJoItemO.GetValue('CFORN_DATAFORNECIDO').value.QuotedString);
       try
        qryAuxTGC.SQL.Text;
        ExecSQL;
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Ok');
        txtJson.WriteValue(vIdentificador);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      except
       on E: Exception do
       begin
        StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Operacao:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
      end;
    end;
  end;
end;

function Tudb.AcceptFabricacaoInsumosTGC(Obj: TJSONObject): TJSONObject;
var
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
 vIdPedido,vIdentificador,vIdOperacaoExiste:string;
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 I          : Integer;
begin
 if FConTGC.Connected=false then
  ConectaFB_TGC;

 FabricacaoAlimentosTGC.Close;
 FabricacaoAlimentosTGC.Open;
 vJsonString := obj.ToString;
 vJoInsert := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem := vJoInsert.GetValue('FabricacaoAlimentosTGC') as TJSONArray;
 try
  for i := 0 to vJoItem.Count-1 do
  begin
    vJoItemO := vJoItem.Items[I] as TJSONObject;
    FabricacaoAlimentosTGC.Close;
    FabricacaoAlimentosTGC.Open;
    FabricacaoAlimentosTGC.Insert;
    FabricacaoAlimentosTGCDBT_CODBATIDA.AsString     := vJoItemO.GetValue('DBT_CODBATIDA').value;
    FabricacaoAlimentosTGCDBT_CODALIMENTO.AsString   := vJoItemO.GetValue('DBT_CODALIMENTO').value;
    FabricacaoAlimentosTGCDBT_QTDE.AsString          := vJoItemO.GetValue('DBT_QTDE').value;
    FabricacaoAlimentosTGCDBT_USUARIO.AsString       := vJoItemO.GetValue('DBT_USUARIO').value;
    FabricacaoAlimentosTGCDBT_CUSTO.AsString         := vJoItemO.GetValue('DBT_CUSTO').value;
    FabricacaoAlimentosTGCDBT_DATA.AsString          := vJoItemO.GetValue('DBT_DATA').value;
    FabricacaoAlimentosTGCDBT_HORA.AsString          := vJoItemO.GetValue('DBT_HORA').value;
    FabricacaoAlimentosTGCDBT_QTDEPREVISTA.AsString  := vJoItemO.GetValue('DBT_QTDEPREVISTA').value;
    FabricacaoAlimentosTGCDBT_PREV_MS.AsString       := vJoItemO.GetValue('DBT_PREV_MS').value;
    FabricacaoAlimentosTGCDBT_PREV_KGMNP.AsString    := vJoItemO.GetValue('DBT_PREV_KGMNP').value;
    FabricacaoAlimentosTGCDBT_PREV_VALOR_KG.AsString       := vJoItemO.GetValue('DBT_PREV_VALOR_KG').value;
    FabricacaoAlimentosTGCDBT_PREV_VALOR_TOTAL.AsString    := vJoItemO.GetValue('DBT_PREV_VALOR_TOTAL').value;
    FabricacaoAlimentosTGCDBT_REAL_KGMSP.AsString          := vJoItemO.GetValue('DBT_REAL_KGMSP').value;
    FabricacaoAlimentosTGCDBT_HORA_INI.AsString            := vJoItemO.GetValue('DBT_HORA_INI').value;
    FabricacaoAlimentosTGCDBT_HORA_FIM.AsString            := vJoItemO.GetValue('DBT_HORA_FIM').value;
    FabricacaoAlimentosTGCDBT_REAL_KGMNP.AsString          := vJoItemO.GetValue('DBT_REAL_KGMNP').value;
    FabricacaoAlimentosTGCDBT_REAL_KGMNP.AsString          := vJoItemO.GetValue('DBT_REAL_KGMNP').value;
    try
     FabricacaoAlimentosTGC.ApplyUpdates(-1);
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Ok');
     txtJson.WriteValue(vIdentificador);
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
    except
     on E: Exception do
     begin
      StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       txtJson.WritePropertyName('Erro');
       txtJson.WriteValue('Erro Ao Sincronizar Insumos Racao:'+E.Message);
       txtJson.WriteEndObject;
       Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     end;
    end;
  end;
 except
 on E: Exception do
   begin
    frmPrincipal.memoLog.Lines.Add('Erro Ao Sincronizar Insumos Racao:'+E.Message);
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('Erro');
    txtJson.WriteValue('Erro Ao Sincronizar Insumos Racao:'+E.Message);
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
 end;
end;

function TUDB.AcceptInsumoRacao(Obj: TJSONObject): TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
 vJsonString,idAgenda:string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
begin
 if FConFiled.Connected=false then
  ConectaFB_Local;
 vJsonString    := Obj.ToString;
 vJoInsert      := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem        := vJoInsert.GetValue('Racao') as TJSONArray;
 vJoItemO       := vJoItem.Items[0] as TJSONObject;
 idAgenda       :=  vJoItemO.GetValue('id').value;
 with RacaoAlimentos,RacaoAlimentos.SQL do
 begin
   Clear;
   Add('SELECT');
   Add(' ID,');
   Add(' IDRACAO,');
   Add(' COALESCE(IDINSUMOALIMENTO,ID_PREMISTURA)IDALIMENTO,');
   Add(' A.INCLUSAOMATERIANATURAL INCLUSAOMN,');
   Add(' A.ORDEM_FABRICACAO ORDEMFABRICACAO,');
   Add(' A.TOLERANCIA_FAB PERCENTTOLERANCIA,');
   Add(' A.VALORKG,');
   Add(' A.PERCENTMATERIASECA MS');
   Add('FROM RACAOINSUMOS  A');
   Add('WHERE IDRACAO='+idAgenda);
   Add('and A.STATUS>-1');
   Open;
 end;
 Result := GetDataSetAsJSON(RacaoAlimentos);
end;


function Tudb.GetPrevisao: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FConFiled.Connected=false then ConectaFB_Local;
  Previsao.Connection := FConFiled;
 Previsao.Close;
 Previsao.Open;
 Result := GetDataSetAsJSON(Previsao);
end;

function Tudb.GetPrevisaoTGC: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if FConTGC.Connected=false then ConectaFB_TGC;
  PrevisaoTGC.Connection := FConTGC;
 PrevisaoTGC.Close;
 PrevisaoTGC.Open;
 Result := GetDataSetAsJSON(PrevisaoTGC);
end;

end.
