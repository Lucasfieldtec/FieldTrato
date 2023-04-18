unit UdmSqlite;

interface

uses
  system.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,System.JSON,
  System.JSON.Writers,System.IniFiles, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  FireDAC.Phys.IBBase,FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,System.JSON.Types,
  System.Variants, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,FMX.Dialogs;

type
  TdmSqlite = class(TDataModule)
    FComSQLite: TFDConnection;
    Fabricacao: TFDQuery;
    FabricacaoAlimentos: TFDQuery;
    Fornecimento: TFDQuery;
    FabricacaoAlimentosId: TFDAutoIncField;
    FabricacaoAlimentosIdFabricacao: TIntegerField;
    FabricacaoAlimentosIdAlimento: TIntegerField;
    FabricacaoAlimentosHoraIni: TDateTimeField;
    FabricacaoAlimentosHoraFim: TDateTimeField;
    FabricacaoAlimentosPrevKG: TFMTBCDField;
    FabricacaoAlimentosRealizadoKG: TFMTBCDField;
    FabricacaoAlimentosPesoBalancaInicio: TFMTBCDField;
    FabricacaoAlimentosPesoBalancaFim: TFMTBCDField;
    FabricacaoAlimentosSync: TIntegerField;
    FabricacaoAlimentosDataSync: TDateTimeField;
    FabricacaoAlimentosOrdem: TIntegerField;
    FabricacaoAlimentosPercentToleracia: TIntegerField;
    FabricacaoAlimentosVALORKG: TBCDField;
    FabricacaoAlimentosVALORFABRICADO: TBCDField;
    FabricacaoAlimentosMS_PREV: TBCDField;
    FabricacaoAlimentosKGMS_REAL: TBCDField;
    FabricacaoAlimentosINSUMO: TStringField;
    FabricacaoAlimentosAlimento: TStringField;
    FornecimentoID: TFDAutoIncField;
    FornecimentoIDCARREGAMENTO: TIntegerField;
    FornecimentoDATA: TDateField;
    FornecimentoIDCURRAL: TIntegerField;
    FornecimentoTRATO: TIntegerField;
    FornecimentoIDRACAOPREV: TIntegerField;
    FornecimentoIDRACAOREAL: TIntegerField;
    FornecimentoKGPREVISTO: TIntegerField;
    FornecimentoKGREALIZADO: TIntegerField;
    FornecimentoHORAINICIO: TTimeField;
    FornecimentoHORAFIM: TTimeField;
    FornecimentoPESOINICIO: TBCDField;
    FornecimentoPESOFIM: TBCDField;
    FornecimentoLOTEFAB: TStringField;
    FornecimentoIDUSUARIO: TIntegerField;
    FornecimentoSYNC: TIntegerField;
    FornecimentoDATASYNC: TDateTimeField;
    FornecimentoTIPOPREVISTO: TIntegerField;
    FornecimentoCURRAL: TStringField;
    FornecimentoRACAO: TStringField;
    FornecimentoUSUARIO: TStringField;
    FabricacaoId: TIntegerField;
    FabricacaoIdReceita: TIntegerField;
    FabricacaoIdUsuario: TIntegerField;
    FabricacaoIdOperador: TIntegerField;
    FabricacaoData: TDateField;
    FabricacaoHoraIni: TDateTimeField;
    FabricacaoHoraFim: TDateTimeField;
    FabricacaoPrevKG: TFMTBCDField;
    FabricacaoRealizadoKG: TFMTBCDField;
    FabricacaoPesoBalancaInicio: TFMTBCDField;
    FabricacaoPesoBalancaFim: TFMTBCDField;
    FabricacaoFinalizada: TIntegerField;
    FabricacaoCarregada: TIntegerField;
    FabricacaoSync: TIntegerField;
    FabricacaoDataSync: TDateTimeField;
    FabricacaoIdVAGAO: TIntegerField;
    Fabricacaotrato: TIntegerField;
    FabricacaoLote: TStringField;
    FabricacaoStatus: TIntegerField;
    FabricacaoValorKG: TBCDField;
    FabricacaoRACAO: TStringField;
    FabricacaoOPERADOR: TStringField;
    FConTGC: TFDConnection;
    FBDriverLink: TFDPhysFBDriverLink;
    FabricacaoTGC: TFDQuery;
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
    FabricacaoAlimentosTGCSync: TFDQuery;
    FornecimentoTGC: TFDQuery;
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
    qryAuxTGC: TFDQuery;
    qryAux: TFDQuery;
    SYNC_FABRICACAO: TFDQuery;
    SYNC_FABRICACAOId: TIntegerField;
    SYNC_FABRICACAOIdReceita: TIntegerField;
    SYNC_FABRICACAOIdUsuario: TIntegerField;
    SYNC_FABRICACAOIdOperador: TIntegerField;
    SYNC_FABRICACAOData: TDateField;
    SYNC_FABRICACAOHoraIni: TDateTimeField;
    SYNC_FABRICACAOHoraFim: TDateTimeField;
    SYNC_FABRICACAOPrevKG: TFMTBCDField;
    SYNC_FABRICACAORealizadoKG: TFMTBCDField;
    SYNC_FABRICACAOPesoBalancaInicio: TFMTBCDField;
    SYNC_FABRICACAOPesoBalancaFim: TFMTBCDField;
    SYNC_FABRICACAOFinalizada: TIntegerField;
    SYNC_FABRICACAOCarregada: TIntegerField;
    SYNC_FABRICACAOSync: TIntegerField;
    SYNC_FABRICACAODataSync: TDateTimeField;
    SYNC_FABRICACAOIdVAGAO: TIntegerField;
    SYNC_FABRICACAOtrato: TIntegerField;
    SYNC_FABRICACAOStatus: TIntegerField;
    SYNC_FABRICACAORACAO: TStringField;
    SYNC_FABRICACAOValorKG: TBCDField;
    SYNC_FABRICACAOOPERADOR: TStringField;
    SYNC_FORNECIMENTO: TFDQuery;
    SYNC_FORNECIMENTOID: TIntegerField;
    SYNC_FORNECIMENTOIDCARREGAMENTO: TIntegerField;
    SYNC_FORNECIMENTODATA: TDateField;
    SYNC_FORNECIMENTOIDCURRAL: TIntegerField;
    SYNC_FORNECIMENTOTRATO: TIntegerField;
    SYNC_FORNECIMENTOIDRACAOPREV: TIntegerField;
    SYNC_FORNECIMENTOIDRACAOREAL: TIntegerField;
    SYNC_FORNECIMENTOKGPREVISTO: TIntegerField;
    SYNC_FORNECIMENTOKGREALIZADO: TIntegerField;
    SYNC_FORNECIMENTOHORAINICIO: TTimeField;
    SYNC_FORNECIMENTOHORAFIM: TTimeField;
    SYNC_FORNECIMENTOPESOINICIO: TBCDField;
    SYNC_FORNECIMENTOPESOFIM: TBCDField;
    SYNC_FORNECIMENTOLOTEFAB: TStringField;
    SYNC_FORNECIMENTOIDUSUARIO: TIntegerField;
    SYNC_FORNECIMENTOSYNC: TIntegerField;
    SYNC_FORNECIMENTODATASYNC: TDateTimeField;
    SYNC_FORNECIMENTOTIPOPREVISTO: TIntegerField;
    SYNC_FORNECIMENTOCURRAL: TStringField;
    SYNC_FORNECIMENTORACAO: TStringField;
    SYNC_FORNECIMENTOUSUARIO: TStringField;
    FabricacaoInsumosTGC: TFDQuery;
    FabricacaoInsumosTGCDBT_CODIGO: TIntegerField;
    FabricacaoInsumosTGCDBT_CODBATIDA: TIntegerField;
    FabricacaoInsumosTGCDBT_CODALIMENTO: TIntegerField;
    FabricacaoInsumosTGCDBT_QTDE: TBCDField;
    FabricacaoInsumosTGCDBT_DATAREG: TDateField;
    FabricacaoInsumosTGCDBT_USUARIO: TStringField;
    FabricacaoInsumosTGCDBT_CUSTO: TBCDField;
    FabricacaoInsumosTGCDBT_DATA: TDateField;
    FabricacaoInsumosTGCDBT_HORA: TTimeField;
    FabricacaoInsumosTGCDBT_QTDEPREVISTA: TBCDField;
    FabricacaoInsumosTGCDBT_PREV_MS: TBCDField;
    FabricacaoInsumosTGCDBT_PREV_KGMNP: TBCDField;
    FabricacaoInsumosTGCDBT_PREV_KGMSP: TBCDField;
    FabricacaoInsumosTGCDBT_PREV_VALOR_KG: TBCDField;
    FabricacaoInsumosTGCDBT_PREV_VALOR_TOTAL: TBCDField;
    FabricacaoInsumosTGCDBT_KGMS: TFloatField;
    FabricacaoInsumosTGCDBT_REAL_KGMSP: TBCDField;
    FabricacaoInsumosTGCDBT_HORA_INI: TTimeField;
    FabricacaoInsumosTGCDBT_HORA_FIM: TTimeField;
    FabricacaoInsumosTGCDBT_REAL_KGMNP: TBCDField;
    FabricacaoInsumosTGCDBT_CODOPERADOR: TIntegerField;
    FabricacaoInsumosTGCDBT_MS: TBCDField;
    FabricacaoInsumosTGCSYNC_ECO_DATA: TSQLTimeStampField;
    FabricacaoInsumosTGCSYNC_ECO: TStringField;
    SYNC_FABRICACAO_INSUMO: TFDQuery;
    FornecimentosSync: TFDQuery;
    SYNC_FABRICACAO_INSUMOId: TIntegerField;
    SYNC_FABRICACAO_INSUMOIdFabricacao: TIntegerField;
    SYNC_FABRICACAO_INSUMOIdAlimento: TIntegerField;
    SYNC_FABRICACAO_INSUMOHoraIni: TDateTimeField;
    SYNC_FABRICACAO_INSUMOHoraFim: TDateTimeField;
    SYNC_FABRICACAO_INSUMOPrevKG: TFMTBCDField;
    SYNC_FABRICACAO_INSUMORealizadoKG: TFMTBCDField;
    SYNC_FABRICACAO_INSUMOPesoBalancaInicio: TFMTBCDField;
    SYNC_FABRICACAO_INSUMOPesoBalancaFim: TFMTBCDField;
    SYNC_FABRICACAO_INSUMOSync: TIntegerField;
    SYNC_FABRICACAO_INSUMODataSync: TDateTimeField;
    SYNC_FABRICACAO_INSUMOOrdem: TIntegerField;
    SYNC_FABRICACAO_INSUMOPercentToleracia: TIntegerField;
    SYNC_FABRICACAO_INSUMOVALORKG: TBCDField;
    SYNC_FABRICACAO_INSUMOVALORFABRICADO: TBCDField;
    SYNC_FABRICACAO_INSUMOMS_PREV: TBCDField;
    SYNC_FABRICACAO_INSUMOKGMS_REAL: TBCDField;
    SYNC_FABRICACAO_INSUMOINSUMO: TStringField;
    Usuarios: TFDQuery;
    UsuariosID: TIntegerField;
    UsuariosNOME: TStringField;
    UsuariosLOGIN: TStringField;
    UsuariosSENHA: TWideStringField;
    UsuariosOPERADOR: TIntegerField;
    UsuariosDATAREG: TDateTimeField;
    UsuariosSTATUS: TIntegerField;
    UsuariosTIPO: TIntegerField;
    SYNC_FABRICACAOLote: TStringField;
    Tablekey: TFDQuery;
    TablekeyKEY: TStringField;
    TablekeyDATAREG: TSQLTimeStampField;
    TablekeyID: TIntegerField;
    TablekeySTATUS: TIntegerField;
    procedure FComSQLiteBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DeletaRegistro(Tabela,Id:string);
    procedure AtualizaTotalFabricado(vID,vTotal:string);
    function AcceptFabricacaoSync(obj: TJSONObject): TJSONObject;

    function AcceptForneciemto(obj: TJSONObject): TJSONObject;

    procedure AbreFornecimento(vFiltro:string);
    procedure AbreFabricacao(vFiltro: string);
    procedure AbreFabricacaoAlimento(vIdFabricacao: string);

    function  PostFabricacaoTGC:string;
    function  PostFabricacaoAlimentosTGC(idBatida,idBatidaTGC:string):string;
    function  PostFornecimentoTGC:string;

    function ConectaFB_TGC: TJSONObject;
    function LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;

    function  AcceptFabricacaoInsumos(obj: TJSONObject): TJSONObject;
    function  RetornaMaxIDFabricacaoTGC: String;
    procedure ChangeFlagSyncFabricacao(id: string);
    procedure ChangeFlagSyncFabricacaoInsumo(id: string);
    procedure ChangeFlagSyncFornecimento(idCurral,trato,racao: integer;dataForn:string);
    procedure AbreTGCFabricacaoAlimentos(idFab,idFabTGC: string);
    function  GetAlimentoTGCInterno: TJSONObject;
    function  RetornaTotalPrevisto(vFiltro:string):string;

    function  GetUsuariosTGC: string;

    function  VerificaTabelaExiste(Atabela: string): Boolean;
    procedure CreateTablesVersao(NumeroVersao: string);
    function  ValidaLicencaJaUsada(Chave: String): Boolean;
    procedure InativaKey;

  end;

var
  dmSqlite: TdmSqlite;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses dmDB, UdmLeitura, UWsField;

{$R *.dfm}

{ TdmSqlite }

procedure TdmSqlite.CreateTablesVersao(NumeroVersao: string);
var
 vQryAux:TFDQuery;
begin
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := FComSQLite;
 if VerificaTabelaExiste('KEYFIELD')then
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('CREATE TABLE KEYFIELD (');
   Add('	ID INTEGER NOT NULL,');
   Add('	"KEY" VARCHAR(30),');
   Add('	DATAREG TIMESTAMP DEFAULT CURRENT_TIMESTAMP,');
   Add('	STATUS INTEGER DEFAULT 1 NOT NULL,');
   Add('	CONSTRAINT PK_KEYFIELD PRIMARY KEY (ID))');
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage('Erro ao inserir Campo : '+E.Message);
   end;
 end;
 vQryAux.Free;
end;

function TdmSqlite.VerificaTabelaExiste(Atabela: string): Boolean;
var
 vQryAux:TFDQuery;
 vExiste:integer;
begin
 vExiste :=0;
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := FComSQLite;
 vExiste:=0;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('PRAGMA table_info('+Atabela+')');
   Open;
   Result:=vQryAux.IsEmpty;
 end;
 vQryAux.Free;
end;

procedure TdmSqlite.ChangeFlagSyncFornecimento(idCurral,trato,racao: integer;dataForn:String);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('UPDATE fornecimento SET Sync=1,DataSync=CURRENT_TIMESTAMP');
   Add('where IDCURRAL=:IDCURRAL');
   Add('and TRATO=:TRATO');
   Add('and IDRACAOPREV=:IDRACAOPREV');
   Add('and "DATA" =:dataForn');
   ParamByName('IDCURRAL').AsInteger      := IDCURRAL;
   ParamByName('TRATO').AsInteger         := TRATO;
   ParamByName('IDRACAOPREV').AsInteger   := racao;
   ParamByName('dataForn').AsString       := dataForn;
   ExecSQL;
 end;
end;

function TdmSqlite.RetornaMaxIDFabricacaoTGC: String;
begin
 with qryAuxTGC,qryAuxTGC.SQL do
 begin
   Clear;
   Add('select max(CBT_CODIGO)maxId from cad_batida');
   Open;
   Result := FieldByName('maxId').AsString;
 end;
end;



function TdmSqlite.RetornaTotalPrevisto(vFiltro: string): string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('SELECT');
   Add('SUM(F.prev) as TOTAL_PREV');
   Add('FROM');
   Add('(select');
   Add('idcurral');
   Add(',kgprevisto as prev');
   Add('from Fornecimento f2');
   Add('where 1=1');
   Add(vFiltro);
   Add('group by idcurral) F');
   Open;
   Result := FieldByName('TOTAL_PREV').AsString;
 end;
end;

function TdmSqlite.PostFabricacaoTGC: string;
var
 vIdentificador,vIdentificadorTGC,vIdUauario:string;
begin
 if FConTGC.Connected=false then
  ConectaFB_TGC;

 Fabricacao.Filtered := false;
 Fabricacao.Close;
 Fabricacao.Open;
 Fabricacao.Filter   := 'sync=0';
 Fabricacao.Filtered := true;
  while not Fabricacao.Eof do
  begin
    vIdentificador                                   := FabricacaoId.AsString;
    vIdUauario                                       := FabricacaoIdUsuario.AsString;
    FabricacaoTGC.Close;
    FabricacaoTGC.Open;
    FabricacaoTGC.Insert;
    FabricacaoTGCCBT_CODRACAOPROD.AsString           := FabricacaoIdReceita.AsString;
    FabricacaoTGCCBT_QTDEBATIDA.AsString             := FabricacaoRealizadoKG.AsString;
    FabricacaoTGCCBT_CUSTO.AsString                  := FabricacaoValorKG.AsString;
    FabricacaoTGCCBT_DATA.AsDateTime                 := FabricacaoData.AsDateTime;
    FabricacaoTGCCBT_INICIO.AsDateTime               := FabricacaoHoraIni.AsDateTime;
    FabricacaoTGCCBT_FIM.AsDateTime                  := FabricacaoHoraFim.AsDateTime;
    FabricacaoTGCCBT_USUARIO.AsString                := FabricacaoIdUsuario.AsString;
    FabricacaoTGCCBT_QTDEPREVISTA.AsString           := FabricacaoPrevKG.AsString;
    FabricacaoTGCCBT_LOTE_FABRICACAO.AsString        := FabricacaoLote.AsString;
    FabricacaoTGCCBT_NOMEOPERADOR.AsString           := FabricacaoOPERADOR.AsString;
    FabricacaoTGCCBT_COD_OPERADOR_PA.AsString        := FabricacaoIdOperador.AsString;
    try
     FabricacaoTGC.ApplyUpdates(-1);
     vIdentificadorTGC := RetornaMaxIDFabricacaoTGC;
     PostFabricacaoAlimentosTGC(FabricacaoId.AsString,vIdentificadorTGC);
     ChangeFlagSyncFabricacao(vIdentificador);
     Fabricacao.Next;
    except
     on E: Exception do
     begin
       ShowMessage('Erro Ao Sincronizar Operacao:'+E.Message);
     end;
    end;
  end;
end;


procedure TdmSqlite.ChangeFlagSyncFabricacao(id: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('UPDATE Fabricacao SET Sync=1,DataSync=CURRENT_TIMESTAMP');
   Add('WHERE ID=:ID');
   ParamByName('ID').AsString := id;
   ExecSQL;
 end;
end;


procedure TdmSqlite.ChangeFlagSyncFabricacaoInsumo(id: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('UPDATE FabricacaoAlimentos SET Sync=1,DataSync=CURRENT_TIMESTAMP');
   Add('WHERE ID=:ID');
   ParamByName('ID').AsString := id;
   ExecSQL;
 end;
end;

function TdmSqlite.AcceptFabricacaoSync(obj: TJSONObject): TJSONObject;
var
  I,X,vEdit: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FComSQLite;
  SYNC_FABRICACAO.Connection := FComSQLite;
  SYNC_FABRICACAO.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    SYNC_FABRICACAO.Close;
    SYNC_FABRICACAO.Open;
    SYNC_FABRICACAO.Insert;

    for x := 0 to SYNC_FABRICACAO.Fields.Count -1 do
    begin
     vField  := UpperCase(StringReplace(SYNC_FABRICACAO.Fields[x].Name,
      'SYNC_FABRICACAO','',[rfReplaceAll]));
     SYNC_FABRICACAO.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
      SYNC_FABRICACAO.ApplyUpdates(-1);
      SYNC_FABRICACAO.Connection.Commit;
      vIdResult :=SYNC_FABRICACAOID.ASSTRING;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Abastecimento:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

procedure TdmSqlite.AbreFabricacaoAlimento(vIdFabricacao: string);
begin
 with FabricacaoAlimentos,FabricacaoAlimentos.SQL do
 begin
   Clear;
   Add('select');
   Add(' a.*,');
   Add(' b.nome Alimento');
   Add('from FabricacaoAlimentos a');
   Add('join Alimentos b on a.IdAlimento=b.Id');
   Add('where IdFabricacao='+vIdFabricacao);
   Open;
 end;
end;

procedure TdmSqlite.AbreFornecimento(vFiltro: string);
begin
 with Fornecimento,Fornecimento.SQL do
 begin
   Clear;
   Add('SELECT');
   Add(' v.*');
   Add('from fornecimento V');
   Add('where 1=1');
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmSqlite.AbreFabricacao(vFiltro: string);
begin
 Fabricacao.Filtered := false;
 with Fabricacao,Fabricacao.SQL do
 begin
   Clear;
   Add('select a.* from Fabricacao a ');
   Add('where 1=1');
   Add(vFiltro);
   Fabricacao.SQL.Text;
   Open;
 end;
end;

procedure TdmSqlite.AbreTGCFabricacaoAlimentos(idFab,idFabTGC: string);
begin
 with FabricacaoAlimentosTGCSync,FabricacaoAlimentosTGCSync.SQL do
 begin
   Clear;
   Add('select');
   Add('a.ID,');
   Add(idFabTGC+' DBT_CODBATIDA,');
   Add('IdAlimento DBT_CODALIMENTO,');
   Add('a.RealizadoKG DBT_QTDE,');
   Add('(select nome from usuario where id=b.IdUsuario) DBT_USUARIO,');
   Add('VALORFABRICADO DBT_CUSTO,');
   Add('b.Data DBT_DATA,');
   Add('a.HoraIni DBT_HORA,');
   Add('a.PrevKG DBT_QTDEPREVISTA,');
   Add('a.MS_PREV DBT_PREV_MS,');
   Add('(cast(a.PrevKG as double precision) *100)/b.PrevKG DBT_PREV_KGMNP,');
   Add('(cast(a.MS_PREV as double precision) *100)/b.PrevKG DBT_PREV_KGMSP,');
   Add('a.VALORKG DBT_PREV_VALOR_KG,');
   Add('a.VALORFABRICADO DBT_PREV_VALOR_TOTAL,');
   Add('coalesce((cast(a.KGMS_REAL as double precision) *100)/b.RealizadoKG,0) DBT_REAL_KGMSP,');
   Add('cast(a.HoraIni as varchar(10)) DBT_HORA_INI,');
   Add('cast(a.HoraFim as varchar(10)) DBT_HORA_FIM,');
   Add('coalesce((cast(a.KGMS_REAL as double precision) *100)/b.RealizadoKG,0) DBT_REAL_KGMNP,');
   Add('b.IdOperador DBT_CODOPERADOR');
   Add('from FabricacaoAlimentos a');
   Add('join Fabricacao b on a.IdFabricacao=b.Id');
   Add('where IdFabricacao='+idFab);
   FabricacaoAlimentosTGCSync.SQL.Text;
   Open;
 end;
end;


function TdmSqlite.AcceptFabricacaoInsumos(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
  vValorKG   : Double;
  vCustoTotal: Double;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FComSQLite;
  SYNC_FABRICACAO_INSUMO.Connection := FComSQLite;
  SYNC_FABRICACAO_INSUMO.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    SYNC_FABRICACAO_INSUMO.Close;
    SYNC_FABRICACAO_INSUMO.Open;
    SYNC_FABRICACAO_INSUMO.Insert;
    for x := 0 to SYNC_FABRICACAO_INSUMO.Fields.Count -1 do
    begin
     vField  := StringReplace(SYNC_FABRICACAO_INSUMO.Fields[x].Name,
      'SYNC_FABRICACAO_INSUMO','',[rfReplaceAll]);
     SYNC_FABRICACAO_INSUMO.FieldByName(vField).AsString     :=
      vQry.FieldByName(vField).AsString;
    end;
    try
      SYNC_FABRICACAO_INSUMO.ApplyUpdates(-1);
      SYNC_FABRICACAO_INSUMO.Connection.Commit;
      if vIdResult.Length>0 then
       vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult:=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Fabricacao Insumos:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmSqlite.AcceptForneciemto(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
  vValorKG   : Double;
  vCustoTotal: Double;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := FComSQLite;
  SYNC_FORNECIMENTO.Connection := FComSQLite;
  SYNC_FORNECIMENTO.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    SYNC_FORNECIMENTO.Close;
    SYNC_FORNECIMENTO.Open;
    SYNC_FORNECIMENTO.Insert;
    for x := 0 to SYNC_FORNECIMENTO.Fields.Count -1 do
    begin
     vField  := StringReplace(SYNC_FORNECIMENTO.Fields[x].Name,
      'SYNC_FORNECIMENTO','',[rfReplaceAll]);
     SYNC_FORNECIMENTO.FieldByName(vField).AsString     :=
      vQry.FieldByName(vField).AsString;
    end;
    try
      SYNC_FORNECIMENTO.ApplyUpdates(-1);
      SYNC_FORNECIMENTO.Connection.Commit;
      if vIdResult.Length>0 then
       vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult:=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Fornecimento:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;


procedure TdmSqlite.AtualizaTotalFabricado(vID, vTotal: string);
begin
 with qryAux,qryAux.SQL do
 begin
  Clear;
  Add('update Fabricacao set RealizadoKG='+vTotal);
  Add('where id='+vId);
  ExecSQL;
 end;
end;



function TdmSqlite.LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
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

function TdmSqlite.ConectaFB_TGC: TJSONObject;
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
     GetUsuariosTGC;
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

procedure TdmSqlite.DeletaRegistro(Tabela, Id: string);
begin
  with qryAux,qryAux.sql do
  begin
    Clear;
    Add('delete from '+Tabela);
    Add('where id='+Id);
    ExecSQL;
  end;
end;

procedure TdmSqlite.InativaKey;
var
 vQryAux :TFDQuery;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FComSQLite;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('UPDATE KEYFIELD SET STATUS=-1');
   try
    ExecSQL;
   EXCEPT
   on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
   end;
 end;
 vQryAux.Free;
end;


function TdmSqlite.ValidaLicencaJaUsada(Chave: String): Boolean;
var
 vQryAux :TFDQuery;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FComSQLite;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('select * from keyfield');
   Add('where "KEY"='+Chave.QuotedString);
   Open;
   Result := vQryAux.IsEmpty;
 end;
 vQryAux.Free;
end;


procedure TdmSqlite.FComSQLiteBeforeConnect(Sender: TObject);
var
 ArquivoDB:string;
begin
  ArquivoDB := ExtractFilePath(ParamStr(0))+'db\WS.db';
  if FileExists(ArquivoDB) then
   begin
    FComSQLite.Params.DriverID :='SQLite';
    FComSQLite.Params.Values['Database'] :=ArquivoDB;
   end
   else
    ShowMessage('BD Não localizado!!');
end;

function TdmSqlite.GetAlimentoTGCInterno: TJSONObject;
begin
  with qryAux,qryAux.sql do
  begin
    Clear;
    Add('delete from alimentos');
    ExecSQL;
  end;
  udb.AlimentosTGC.Close;
  udb.AlimentosTGC.Open;
  udb.AlimentosTGC.First;
  while not udb.AlimentosTGC.eof do
  begin
    with qryAux,qryAux.sql do
    begin
      Clear;
      Add('insert into alimentos(ID,NOME)VALUES(');
      Add(udb.AlimentosTGCID.AsString+',');
      Add(udb.AlimentosTGCNOME.AsString.QuotedString+')');
      ExecSQL;
    end;
    udb.AlimentosTGC.Next;
  end;
end;

function TdmSqlite.GetUsuariosTGC: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   try
    vJsonString        := udb.GetUsuarioTGC.ToString;
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      vJoGet := jSubObj.GetValue<TJSONArray>('UsuariosTGC') as TJSONArray;
      for i := 0 to vJoGet.Count-1 do
      begin
        Usuarios.Close;
        Usuarios.Open;
        vJoGetJ            := vJoGet.Items[i] as TJSONObject;
        vId                := vJoGetJ.GetValue('ID').value;
        Usuarios.Filtered := false;
        Usuarios.Filter   := 'id='+vId;
        Usuarios.Filtered := true;
        if not Usuarios.IsEmpty then
         Usuarios.Edit
        else
         Usuarios.Insert;
        for z := 0 to Usuarios.Fields.Count -1 do
        begin
         vField:=UpperCase(StringReplace(Usuarios.Fields[z].Name,
          'Usuarios','',[rfReplaceAll]));
         Usuarios.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
        end;
        try
         Usuarios.ApplyUpdates(-1);
        except
         on E: Exception do
           begin
             result:='Erro ao inserir Usuarios:'+E.Message;
           end;
        end;
      end;
    end;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSqlite.PostFabricacaoAlimentosTGC(idBatida,
  idBatidaTGC: string): string;
var
 vIdPedido,vIdentificador,vIdOperacaoExiste:string;
 I          : Integer;
begin
 if FConTGC.Connected=false then
  ConectaFB_TGC;
 AbreTGCFabricacaoAlimentos(idBatida,idBatidaTGC);
 try
  while not FabricacaoAlimentosTGCSync.eof do
  begin
    FabricacaoInsumosTGC.Close;
    FabricacaoInsumosTGC.Open;
    FabricacaoInsumosTGC.Insert;
    FabricacaoInsumosTGCDBT_CODBATIDA.AsString          := FabricacaoAlimentosTGCSync.FieldByName('DBT_CODBATIDA').AsString;
    FabricacaoInsumosTGCDBT_CODALIMENTO.AsString        := FabricacaoAlimentosTGCSync.FieldByName('DBT_CODALIMENTO').AsString;
    FabricacaoInsumosTGCDBT_QTDE.AsFloat                := FabricacaoAlimentosTGCSync.FieldByName('DBT_QTDE').AsFloat;
    FabricacaoInsumosTGCDBT_USUARIO.AsString            := FabricacaoAlimentosTGCSync.FieldByName('DBT_USUARIO').AsString;
    FabricacaoInsumosTGCDBT_CUSTO.AsFloat               := FabricacaoAlimentosTGCSync.FieldByName('DBT_CUSTO').AsFloat;
    FabricacaoInsumosTGCDBT_DATA.AsString               := FabricacaoAlimentosTGCSync.FieldByName('DBT_DATA').AsString;
    FabricacaoInsumosTGCDBT_HORA.AsString               := FabricacaoAlimentosTGCSync.FieldByName('DBT_HORA').AsString;
    FabricacaoInsumosTGCDBT_QTDEPREVISTA.AsFloat        := FabricacaoAlimentosTGCSync.FieldByName('DBT_QTDEPREVISTA').AsFloat;
    FabricacaoInsumosTGCDBT_PREV_MS.AsFloat             := FabricacaoAlimentosTGCSync.FieldByName('DBT_PREV_MS').AsFloat;
    FabricacaoInsumosTGCDBT_PREV_KGMNP.AsFloat          := FabricacaoAlimentosTGCSync.FieldByName('DBT_PREV_KGMNP').AsFloat;
    FabricacaoInsumosTGCDBT_PREV_VALOR_KG.AsFloat       := FabricacaoAlimentosTGCSync.FieldByName('DBT_PREV_VALOR_KG').AsFloat;
    FabricacaoInsumosTGCDBT_PREV_VALOR_TOTAL.AsFloat    := FabricacaoAlimentosTGCSync.FieldByName('DBT_PREV_VALOR_TOTAL').AsFloat;
    FabricacaoInsumosTGCDBT_REAL_KGMSP.AsFloat          := FabricacaoAlimentosTGCSync.FieldByName('DBT_REAL_KGMSP').AsFloat;
    FabricacaoInsumosTGCDBT_HORA_INI.AsString           := FabricacaoAlimentosTGCSync.FieldByName('DBT_HORA_INI').AsString;
    FabricacaoInsumosTGCDBT_HORA_FIM.AsString           := FabricacaoAlimentosTGCSync.FieldByName('DBT_HORA_FIM').AsString;
    FabricacaoInsumosTGCDBT_REAL_KGMNP.AsFloat          := FabricacaoAlimentosTGCSync.FieldByName('DBT_REAL_KGMNP').AsFloat;
    FabricacaoInsumosTGCDBT_REAL_KGMNP.AsFloat          := FabricacaoAlimentosTGCSync.FieldByName('DBT_REAL_KGMNP').AsFloat;
    try
     FabricacaoInsumosTGC.ApplyUpdates(-1);
     ChangeFlagSyncFabricacaoInsumo(FabricacaoAlimentosTGCSync.FieldByName('id').AsString);
     FabricacaoAlimentosTGCSync.Next;
     except
     on E: Exception do
     begin
       ShowMessage('Erro Ao Sincronizar Insumos Racao:'+E.Message);
     end;
    end;
  end;
 except
 on E: Exception do
   begin
    ShowMessage('Erro Ao Sincronizar Insumos Racao:'+E.Message);
   end;
 end;
end;


function TdmSqlite.PostFornecimentoTGC: string;
var
 vIdPedido,vIdentificador,vIdOperacaoExiste,
 Ano,Mes,Dia:string;
 I          : Integer;
begin
 frmPrincipal.memoLog.lines.Add('Conectando ao TGC');
 if FConTGC.Connected=false then
  ConectaFB_TGC;
  qryAuxTGC.Connection:= FConTGC;
  FornecimentosSYNC.Close;
  FornecimentosSYNC.Open;
  frmPrincipal.memoLog.lines.Add('Realizando Fornecimento!');
  I:=1;
  while not FornecimentosSYNC.Eof do
  begin
//    Ano := Copy(FornecimentosSync.FieldByName('CFORN_DATAFORNECIDO').AsString,0,4);
//    Mes := Copy(FornecimentosSync.FieldByName('CFORN_DATAFORNECIDO').AsString,6,2);
//    Dia := Copy(FornecimentosSync.FieldByName('CFORN_DATAFORNECIDO').AsString,9,2);

    frmPrincipal.memoLog.lines.Add('Update fornecimento :'+intToStr(i));
    with qryAuxTGC,qryAuxTGC.SQL do
    begin
        Clear;
        Add('UPDATE CAD_FORNECIMENTO  SET');
        Add('CFORN_FLAG=''S''');
        Add(',CFORN_REALIZADO=CFORN_REALIZADO+'+FornecimentosSync.FieldByName('CFORN_REALIZADO').AsString);
        Add(',CFORN_CUSTO='+StringReplace(FornecimentosSync.FieldByName('CFORN_CUSTO').AsString,',','.',[rfReplaceAll]));
        Add(',CFORN_MOTORISTA='+FornecimentosSync.FieldByName('CFORN_MOTORISTA').AsString.QuotedString);
        Add(',CFORN_HORA='+FornecimentosSync.FieldByName('CFORN_HORA').AsString.QuotedString);
        Add(',CFORN_LOTE_FABRICACAO='+FornecimentosSync.FieldByName('CFORN_LOTE_FABRICACAO').AsString.QuotedString);
        Add(',CFORN_HORA_INI='+FornecimentosSync.FieldByName('CFORN_HORA_INI').AsString.QuotedString);
        Add(',CFORN_HORA_FIM='+FornecimentosSync.FieldByName('CFORN_HORA_FIM').AsString.QuotedString);
        Add(',CFORN_DATAFORNECIDO='+FornecimentosSync.FieldByName('CFORN_DATAFORNECIDO').AsString.QuotedString);
        Add(',CFORN_CODBAIA='+FornecimentosSync.FieldByName('CFORN_CODBAIA').AsString);
        Add(',CFORN_TRATO='+FornecimentosSync.FieldByName('CFORN_TRATO').AsString);
        Add(',CFORN_CODRACAOPROD_PREV='+FornecimentosSync.FieldByName('CFORN_CODRACAOPROD_PREV').AsString);
        Add('WHERE CFORN_CODBAIA='+FornecimentosSync.FieldByName('CFORN_CODBAIA').AsString);
        Add('AND CFORN_TRATO='+FornecimentosSync.FieldByName('CFORN_TRATO').AsString);
        Add('AND CFORN_DATAFORNECIDO='+FornecimentosSync.FieldByName('CFORN_DATAFORNECIDO').AsString.QuotedString);
       try
        frmPrincipal.memoLog.lines.Add(qryAuxTGC.SQL.Text);
        ExecSQL;
        ChangeFlagSyncFornecimento(
         FornecimentosSync.FieldByName('CFORN_CODBAIA').AsInteger,
         FornecimentosSync.FieldByName('CFORN_TRATO').AsInteger,
         FornecimentosSync.FieldByName('CFORN_CODRACAOPROD_PREV').AsInteger,
         FornecimentosSync.FieldByName('CFORN_DATAFORNECIDO').AsString
         );
//         strToDate(MES+'/'+DIA+'/'+ANO));

        FornecimentosSync.Next;
      except
       on E: Exception do
       begin
         ShowMessage('Erro Ao Sincronizar Fornecimento:'+E.Message);
       end;
      end;
    end;
  end;
  ShowMessage('Fornecimento Sincronizado!');
end;

end.
