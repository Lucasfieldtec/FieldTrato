unit UDmSync;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet,System.IOUtils, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, FireDAC.Stan.StorageBin,
  System.JSON,IdHashMessageDigest,System.JSON.Writers,System.JSON.Types,Data.DBXPlatform,
  FireDAC.Stan.StorageJSON,
  REST.Response.Adapter;

type
  TdmSync = class(TDataModule)
    Racao: TFDQuery;
    RacaoId: TIntegerField;
    RacaoNome: TStringField;
    RacaoTipo: TStringField;
    RacaoTempoMistura: TIntegerField;
    RacaoStatus: TIntegerField;
    RacaoDatareg: TDateTimeField;
    Alimentos: TFDQuery;
    RacaoAlimentos: TFDQuery;
    Usuarios: TFDQuery;
    IdHTTP1: TIdHTTP;
    AlimentosID: TIntegerField;
    AlimentosNOME: TStringField;
    AlimentosDATAREG: TDateTimeField;
    AlimentosSTATUS: TIntegerField;
    RacaoAlimentosID: TFDAutoIncField;
    RacaoAlimentosIDRACAO: TIntegerField;
    RacaoAlimentosIDALIMENTO: TIntegerField;
    RacaoAlimentosINCLUSAOMN: TBCDField;
    RacaoAlimentosORDEMFABRICACAO: TIntegerField;
    RacaoAlimentosPERCENTTOLERANCIA: TBCDField;
    RacaoAlimentosVALORKG: TBCDField;
    RacaoAlimentosMS: TBCDField;
    Fabricacao: TFDQuery;
    FabricacaoAlimentosTGC: TFDQuery;
    qryAux: TFDQuery;
    Previsao: TFDQuery;
    Currais: TFDQuery;
    CurraisID: TIntegerField;
    CurraisLINHA: TStringField;
    CurraisNUMERO: TIntegerField;
    CurraisNOME: TStringField;
    CurraisTAG_INICIO: TStringField;
    CurraisTAG_FIM: TStringField;
    CurraisSTATUS: TIntegerField;
    PrevisaoDATA: TDateField;
    PrevisaoIDCURRAL: TIntegerField;
    PrevisaoIDRACAO: TIntegerField;
    PrevisaoSTATUS: TIntegerField;
    PrevisaoTRATO: TIntegerField;
    PrevisaoTIPO: TIntegerField;
    PrevisaoKGPREVISTO: TIntegerField;
    Fornecimento: TFDQuery;
    Carregamentos: TFDQuery;
    CarregamentosID: TFDAutoIncField;
    CarregamentosIDRacao: TIntegerField;
    CarregamentosKGFabricado: TBCDField;
    CarregamentosDataFabricacao: TDateField;
    CarregamentosDataCarregamento: TDateField;
    CarregamentosPesoInicio: TBCDField;
    CarregamentosPesoFim: TBCDField;
    CarregamentosTotalCarregado: TBCDField;
    CarregamentosLoteFabricacao: TStringField;
    CarregamentosidUsuario: TIntegerField;
    CarregamentosStatus: TIntegerField;
    CarregamentosDatareg: TDateTimeField;
    CarregamentosValorKG: TBCDField;
    CarregamentosFlagSync: TIntegerField;
    CarregamentosDataSync: TDateTimeField;
    CarregamentosIDVAGAO: TIntegerField;
    UsuariosID: TIntegerField;
    UsuariosNOME: TStringField;
    UsuariosLOGIN: TStringField;
    UsuariosSENHA: TWideStringField;
    UsuariosOPERADOR: TIntegerField;
    UsuariosDATAREG: TDateTimeField;
    UsuariosSTATUS: TIntegerField;
    UsuariosTIPO: TIntegerField;
    CurraisORDEM: TIntegerField;
    SYNC_FABRICACAO: TFDQuery;
    SYNC_FABRICACAOId: TFDAutoIncField;
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
    SYNC_FABRICACAOLote: TStringField;
    SYNC_FABRICACAOStatus: TIntegerField;
    SYNC_FABRICACAOValorKG: TBCDField;
    SYNC_FABRICACAORACAO: TStringField;
    SYNC_FABRICACAOOPERADOR: TStringField;
    QryAuxLoop: TFDQuery;
    SYNC_FABRICACAO_INSUMO: TFDQuery;
    SYNC_FABRICACAO_INSUMOId: TFDAutoIncField;
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
    SYNC_FORNECIMENTO: TFDQuery;
    SYNC_FORNECIMENTOID: TFDAutoIncField;
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
    procedure UsuariosReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure RacaoAlimentosReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure CurraisReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    procedure AbreTGCFabricacaoAlimentos(idFab,idFabTGC: string);
    procedure ChangeFlagSyncFabricacao(id:string);
    procedure ChangeFlagSyncFabricacaoInsumos(id:string);
    procedure DeletaPrevDia(vData:TDate);
    procedure ChangeFlagSyncFornecimento(id: string);
    function  GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
    function  LimpaResut(vResult: string): String;
  public
    Host,Porta:string;
    function  TestaServidor: string;
    function  GetGenerico(vGet:string;aDataSet:TFDQuery):string;
    function  GetPrevisaoOutros(aDataSet: TFDQuery): string;
    function  GetCarregamento(aDataSet: TFDQuery): string;
   {GET TGC}
    function  GetUsuariosTGC: string;
    function  GetAlimentosTGC: string;
    function  GetCurraisTGC: string;
    function  GetRacaoTGC: string;
    function  GetRacaoInsumosTGC(IdRacao:string): string;
    function  GetFornecimentoPrevisaoTGC: string;
   {Post TGC}
    function  PostFabricacaoTGC:string;
    function  PostFabricacaoAlimentosTGC(idBatida,idBatidaTGC:string):string;
    function  PostFornecimentoTGC:string;
    function  PostCarregamentoFB:string;
    function  PostAlteraFlagCarregamentoFB(idCarregamento:string):string;

   {Post TGC FIM}
   {WS Field}
    function  TestaServidorField:string;
    function  GetUsuarios: string;
    function  GetAlimentos: string;
    function  GetCurrais: string;
    function  GetRacao: string;
    function  GetRacaoInsumos(IdRacao:string): string;
    function  GetFornecimentoPrevisao: string;
   {WS Field}
    function  SyncFabricacao: string;
    function  SyncFabricacaoInsumos: string;
    function  SyncCarregamentos:string;
    function  SyncFornecimento: string;
  end;

var
  dmSync: TdmSync;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UDmDb, UPrincipal;

{$R *.dfm}

{ TdmSync }
function TdmSync.SyncCarregamentos: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('select');
   Add('A.*,');
   Add('b.NOME RACAO,');
   Add('(SELECT NOME FROM usuario WHERE ID=A.IDOPERADOR) OPERADOR');
   Add('from Fabricacao A');
   Add('join Racao b on b.ID=A.IdReceita');
   Add('where a.finalizada=1 and sync=0');
   Add('and A.RealizadoKG>0');
   Open;
   while not QryAuxLoop.Eof do
   begin
     frmprincipal.memoLog.text:='Enviando Fabricacao:'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount);
     with SYNC_FABRICACAO,SYNC_FABRICACAO.SQL do
     begin
      Clear;
      Add('select');
      Add('A.*,');
      Add('b.NOME RACAO,');
      Add('(SELECT NOME FROM usuario WHERE ID=A.IDOPERADOR) OPERADOR');
      Add('from Fabricacao A');
      Add('join Racao b on b.ID=A.IdReceita');
      Add('where a.id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not SYNC_FABRICACAO.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       SYNC_FABRICACAO.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/SyncFabricacao';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           ChangeFlagSyncFabricacao(QryAuxLoop.FieldByName('id').AsString);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
            ShowMessage(vReultHTTP);
          end);
         Inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage('Erro ao sioncronizar Fabricacao  : '+e.Message);
          end);
          Result:='Erro ao sioncronizar Fabricacao  : '+e.Message;
        end;
       end;
     end;
   end;
 end;
 Result     := vReultHTTP;
end;

function  TdmSync.SyncFabricacao: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('select');
   Add('A.*,');
   Add('b.NOME RACAO,');
   Add('(SELECT NOME FROM usuario WHERE ID=A.IDOPERADOR) OPERADOR');
   Add('from Fabricacao A');
   Add('join Racao b on b.ID=A.IdReceita');
   Add('where a.finalizada=1 and sync=0');
   Add('and A.RealizadoKG>0');
   Open;
   while not QryAuxLoop.Eof do
   begin
     frmprincipal.memoLog.text:='Enviando Fabricacao:'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount);
     with SYNC_FABRICACAO,SYNC_FABRICACAO.SQL do
     begin
      Clear;
      Add('select');
      Add('A.*,');
      Add('b.NOME RACAO,');
      Add('(SELECT NOME FROM usuario WHERE ID=A.IDOPERADOR) OPERADOR');
      Add('from Fabricacao A');
      Add('join Racao b on b.ID=A.IdReceita');
      Add('where a.id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not SYNC_FABRICACAO.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       SYNC_FABRICACAO.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/SyncFabricacao';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           ChangeFlagSyncFabricacao(QryAuxLoop.FieldByName('id').AsString);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
            ShowMessage(vReultHTTP);
          end);
         Inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage('Erro ao sioncronizar Fabricacao  : '+e.Message);
          end);
          Result:='Erro ao sioncronizar Fabricacao  : '+e.Message;
        end;
       end;
     end;
   end;
 end;
 Result     := vReultHTTP;
end;

function  TdmSync.SyncFabricacaoInsumos: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('select');
   Add(' A.*,');
   Add(' b.NOME INSUMO');
   Add('from FabricacaoAlimentos A');
   Add('join Alimentos b on b.ID=A.IdAlimento');
   Add('WHERE A.RealizadoKG>0 AND A.Sync=0');
   Open;
   while not QryAuxLoop.Eof do
   begin
     frmprincipal.memoLog.text:='Enviando Fabricacao Inusmos:'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount);
     with SYNC_FABRICACAO_INSUMO,SYNC_FABRICACAO_INSUMO.SQL do
     begin
      Clear;
      Add('select');
      Add(' A.*,');
      Add(' b.NOME INSUMO');
      Add('from FabricacaoAlimentos A');
      Add('join Alimentos b on b.ID=A.IdAlimento');
      Add('where A.id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not SYNC_FABRICACAO_INSUMO.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       SYNC_FABRICACAO_INSUMO.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/SyncFabricacaoInsumos';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           ChangeFlagSyncFabricacaoInsumos(QryAuxLoop.FieldByName('id').AsString);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
            ShowMessage(vReultHTTP);
          end);
         Inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage('Erro ao sioncronizar Fabricacao Insumos : '+e.Message);
          end);
          Result:='Erro ao sioncronizar Fabricacao Insumos : '+e.Message;
        end;
       end;
     end;
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.SyncFornecimento: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('SELECT');
   Add('v.*,');
   Add(' c.NOME CURRAL,');
   Add(' r.NOME RACAO,');
   Add(' U.NOME USUARIO');
   Add('from fornecimento V');
   Add('JOIN usuario U ON V.IDUSUARIO=U.ID');
   Add('join currais c on c.ID=V.IDCURRAL');
   Add('join Racao r on r.ID=V.IDRACAOREAL');
   Add('where v.Sync=0 AND V.KGREALIZADO>0');
   Open;
   while not QryAuxLoop.Eof do
   begin
     frmprincipal.memoLog.text:='Enviando Fornecimento:'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount);
     with SYNC_FORNECIMENTO,SYNC_FORNECIMENTO.SQL do
     begin
      Clear;
      Add('SELECT');
      Add('v.*,');
      Add(' c.NOME CURRAL,');
      Add(' r.NOME RACAO,');
      Add(' U.NOME USUARIO');
      Add('from fornecimento V');
      Add('JOIN usuario U ON V.IDUSUARIO=U.ID');
      Add('join currais c on c.ID=V.IDCURRAL');
      Add('join Racao r on r.ID=V.IDRACAOREAL');
      Add('where v.id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not SYNC_FORNECIMENTO.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       SYNC_FORNECIMENTO.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/SyncFornecimento';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           ChangeFlagSyncFornecimento(QryAuxLoop.FieldByName('id').AsString);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
            ShowMessage(vReultHTTP);
          end);
         Inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage('Erro ao sioncronizar Fornecimento: '+e.Message);
          end);
          Result:='Erro ao sioncronizar Fornecimento : '+e.Message;
        end;
       end;
     end;
   end;
 end;
 Result     := vReultHTTP;
end;



function TdmSync.TestaServidor: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+frmPrincipal.HostSrv+':'+frmPrincipal.PortaSrv+'/datasnap/rest/TServerMethods1/GetTestaServidor';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    Result:= vJsonString;
   except
     Result  := 'Erro';
   end;
end;

function TdmSync.TestaServidorField: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/teste';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    Result:= LimpaResut(vJsonString);
   except
     Result  := 'Erro';
   end;
end;

function TdmSync.LimpaResut(vResult: string): String;
begin
  vResult :=copy(vResult,pos(':',vResult)+1);
  vResult :=StringReplace(vResult,'"','',[rfReplaceAll]);
  vResult :=StringReplace(vResult,'}','',[rfReplaceAll]);
  vResult :=StringReplace(vResult,'{','',[rfReplaceAll]);
  Result  := vResult;
end;

procedure TdmSync.AbreTGCFabricacaoAlimentos(idFab,idFabTGC: string);
begin
 with FabricacaoAlimentosTGC,FabricacaoAlimentosTGC.SQL do
 begin
   Clear;
   Add('select');
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
   Add('(cast(a.KGMS_REAL as double precision) *100)/b.RealizadoKG DBT_REAL_KGMSP,');
   Add('cast(a.HoraIni as varchar(10)) DBT_HORA_INI,');
   Add('cast(a.HoraFim as varchar(10)) DBT_HORA_FIM,');
   Add('(cast(a.RealizadoKG as double precision) *100)/b.RealizadoKG DBT_REAL_KGMNP,');
   Add('b.IdOperador DBT_CODOPERADOR');
   Add('from FabricacaoAlimentos a');
   Add('join Fabricacao b on a.IdFabricacao=b.Id');
   Add('where IdFabricacao='+idFab);
   FabricacaoAlimentosTGC.SQL.Text;
   Open;
 end;
end;


procedure TdmSync.ChangeFlagSyncFabricacao(id: string);
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

procedure TdmSync.ChangeFlagSyncFabricacaoInsumos(id: string);
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

procedure TdmSync.ChangeFlagSyncFornecimento(id: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('UPDATE fornecimento SET Sync=1,DataSync=CURRENT_TIMESTAMP');
   Add('WHERE ID=:ID');
   ParamByName('ID').AsString := id;
   ExecSQL;
 end;
end;

procedure TdmSync.CurraisReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
  frmPrincipal.memoLog.Lines.Add('Erro ao Inserir Curral '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now)+' : '+
  E.Message);
end;

procedure TdmSync.DeletaPrevDia(vData: TDate);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('DELETE FROM  FornecimentoPrevisto WHERE DATA=:VDATA');
   ParamByName('VDATA').AsDate := vData;
   ExecSQL;
 end;
end;

function TdmSync.GetCarregamento(aDataSet: TFDQuery): string;
var
 Url,vJsonString,vID,vField:string;
 vJoGetJ         : TJSONObject;
 vJoGet,joItems  : TJSONArray;
 I,J,Z           :integer;
 joName,joItem   : TJSONObject;
begin
   Url :='http://'+frmPrincipal.HostSrv+':'+frmPrincipal.PortaSrv+'/datasnap/rest/TServerMethods1/GetBaixaCarregamento';
   try
     IdHTTP1.Request.CustomHeaders.Clear;
     vJsonString        := IdHTTP1.Get(URL);
      if(vJsonString<>'{"result":[{"GetCarregamento":[]}]}') then
      begin
        joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
        joItems := joName.GetValue('result') as TJSONArray;
        for i  := 0 to joItems.Count-1 do
        begin
          joItem := joItems.Items[I] as TJSONObject;
          vJoGet := joItem.GetValue('GetCarregamento') as TJSONArray;
          for j := 0 to vJoGet.Count-1 do
          begin
            vJoGetJ         := vJoGet.Items[j] as TJSONObject;
            vID             := vJoGetJ.GetValue('ID').value;
            udb.Carregamento.Filtered := false;
            udb.Carregamento.Close;
            udb.Carregamento.Open;
            udb.Carregamento.Filter   := 'ID='+vID;
            udb.Carregamento.Filtered := true;
            if udb.Carregamento.IsEmpty then
             udb.Carregamento.Insert
            else
             udb.Carregamento.Edit;

            for z := 0 to udb.Carregamento.Fields.Count -1 do
            begin
             if udb.Carregamento.Fields[z].Name='CarregamentoDataCarregamento' then
              vField :='DATACARREGAMENTO'
             else
             vField:=UpperCase(StringReplace(udb.Carregamento.Fields[z].Name,'Carregamento','',[rfReplaceAll]));
             if vField='DATACARREGAMENTO' then
              udb.Carregamento.FieldByName(vField).AsDateTime := NOW
             else
              udb.Carregamento.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
            end;
            try
              udb.Carregamento.ApplyUpdates(-1);
            except
            on E: Exception do
               result:=('Erro: ' + E.Message );
            end;
          end
        end;
      end
      else
      begin
        Result :='Nenhum Carregamento Disponivel!';
        Exit;
      end;
      udB.CarregamentoDistribuidor.Close;
      udB.CarregamentoDistribuidor.Open;
      Result :='OK';
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
       Exit;
     end;
   end;
end;

function TdmSync.GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
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

function TdmSync.GetFornecimentoPrevisao: string;
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
   Url := 'http://'+Host+':'+Porta+'/fornecimentoprevisaoTGC';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      vJoGet := jSubObj.GetValue<TJSONArray>('PrevisaoTGC') as TJSONArray;
      if vJoGet.Count>0 then
       DeletaPrevDia(date);
      for i := 0 to vJoGet.Count-1 do
      begin
        vJoGetJ            := vJoGet.Items[i] as TJSONObject;
        Previsao.Close;
        Previsao.Open;
        Previsao.Insert;
        for z := 0 to Previsao.Fields.Count -1 do
        begin
         vField:=UpperCase(StringReplace(Previsao.Fields[z].Name,
          'Previsao','',[rfReplaceAll]));
         Previsao.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
        end;
        try
         Previsao.ApplyUpdates(-1);
        except
         on E: Exception do
           begin
             result:='Erro ao inserir Previsao:'+E.Message;
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

function TdmSync.GetFornecimentoPrevisaoTGC: string;
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
   Url := 'http://'+Host+':'+Porta+'/fornecimentoprevisaoTGC';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      vJoGet := jSubObj.GetValue<TJSONArray>('PrevisaoTGC') as TJSONArray;
      if vJoGet.Count>0 then
       DeletaPrevDia(date);
      for i := 0 to vJoGet.Count-1 do
      begin
        vJoGetJ            := vJoGet.Items[i] as TJSONObject;
        Previsao.Close;
        Previsao.Open;
        Previsao.Insert;
        for z := 0 to Previsao.Fields.Count -1 do
        begin
         vField:=UpperCase(StringReplace(Previsao.Fields[z].Name,
          'Previsao','',[rfReplaceAll]));
         Previsao.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
        end;

        try
         Previsao.ApplyUpdates(-1);
        except
         on E: Exception do
           begin
             result:='Erro ao inserir Previsao:'+E.Message;
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

function TdmSync.GetGenerico(vGet: string; aDataSet: TFDQuery): string;
var
 Url,vJsonString,vID,vField:string;
 vJoGetJ         : TJSONObject;
 vJoGet,joItems  : TJSONArray;
 I,J,Z           :integer;
 joName,joItem   : TJSONObject;
begin
   Url :='http://'+frmPrincipal.HostSrv+':'+frmPrincipal.PortaSrv+'/datasnap/rest/TServerMethods1/'+vGet;
   try
     IdHTTP1.Request.CustomHeaders.Clear;
     vJsonString        := IdHTTP1.Get(URL);
      if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Receituario encontrado!"}]}') then
      begin
        joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
        joItems := joName.GetValue('result') as TJSONArray;
        for i  := 0 to joItems.Count-1 do
        begin
          joItem := joItems.Items[I] as TJSONObject;
          vJoGet := joItem.GetValue(aDataSet.Name) as TJSONArray;
          for j := 0 to vJoGet.Count-1 do
          begin
            vJoGetJ         := vJoGet.Items[j] as TJSONObject;
            vID             := vJoGetJ.GetValue('ID').value;
            aDataSet.Filtered := false;
            aDataSet.Close;
            aDataSet.Open;
            aDataSet.Filter   := 'ID='+vID;
            aDataSet.Filtered := true;
            if aDataSet.IsEmpty then
             aDataSet.Insert
            else
             aDataSet.Edit;

            for z := 0 to aDataSet.Fields.Count -1 do
            begin
             vField:=UpperCase(StringReplace(aDataSet.Fields[z].Name,aDataSet.Name,'',[rfReplaceAll]));
             aDataSet.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
            end;
            try
              aDataSet.ApplyUpdates(-1);
            except
            on E: Exception do
               result:=('Erro: ' + E.Message );
            end;
          end
        end;
      end;
      Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
       Exit;
     end;
   end;
   result:='Dados Baixado com sucesso!';
end;

function TdmSync.GetPrevisaoOutros(aDataSet: TFDQuery): string;
var
 Url,vJsonString,vIDCurral,vData,Trato,IDRacao,vField:string;
 vJoGetJ         : TJSONObject;
 vJoGet,joItems  : TJSONArray;
 I,J,Z           :integer;
 joName,joItem   : TJSONObject;
 vQryAux:TFDQuery;
begin
   vQryAux := TFDQuery.Create(nil);
   vQryAux.Connection := udb.FCon;
   Url :='http://'+frmPrincipal.HostSrv+':'+frmPrincipal.PortaSrv+'/datasnap/rest/TServerMethods1/GetPrevisaoFornOutros';
   try
     IdHTTP1.Request.CustomHeaders.Clear;
     vJsonString        := IdHTTP1.Get(URL);
      if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Registro encontrado!"}]}') then
      begin
        joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
        joItems := joName.GetValue('result') as TJSONArray;
        for i  := 0 to joItems.Count-1 do
        begin
          joItem := joItems.Items[I] as TJSONObject;
          vJoGet := joItem.GetValue(aDataSet.Name) as TJSONArray;
          for j := 0 to vJoGet.Count-1 do
          begin
            vJoGetJ         := vJoGet.Items[j] as TJSONObject;
            with vQryAux,vQryAux.SQL do
            begin
              Clear;
              Add('INSERT OR REPLACE INTO FornecimentoPrevisto(DATA,IDCURRAL,IDRACAO,KGPREVISTO,TRATO)');
              Add('VALUES(:DATA,:IDCURRAL,:IDRACAO,:KGPREVISTO,:TRATO)');
              ParamByName('DATA').AsString        := FormatDateTime('yyyy-mm-dd',StrToDate(vJoGetJ.GetValue('DATA').value));
              ParamByName('IDCURRAL').AsString    := vJoGetJ.GetValue('IDCURRAL').value;
              ParamByName('IDRACAO').AsString     := vJoGetJ.GetValue('IDRACAO').value;
              ParamByName('KGPREVISTO').AsInteger := trunc(strToFloat(vJoGetJ.GetValue('KGPREVISTO').value));
              ParamByName('TRATO').AsString       := vJoGetJ.GetValue('TRATO').value;
              try
               vQryAux.ExecSQL;
               except
               on E: Exception do
                result:=('Erro: ' + E.Message );
              end;

            end;
          end;
        end;
      end;
      Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
       Exit;
     end;
   end;
   result:='Dados Baixado com sucesso!';
end;


function TdmSync.PostAlteraFlagCarregamentoFB(idCarregamento: string): string;
var
   URL,vReultHTTP:STRING;
   JsonToSend  : TStringStream;
   I:integer;
   Txt         : TextFile;
   Quebra      : TStringList;
   LJSon       : TJSONArray;
   vReultHTTPc,
   vReultHTTPClean: String;
   StrAux      : TStringWriter;
   txtJson     : TJsonTextWriter;
   LJsonObj    : TJSONObject;
begin
 JsonToSend := TStringStream.Create(nil);
 StrAux  := TStringWriter.Create;
   txtJson := TJsonTextWriter.Create(StrAux);
   txtJson.Formatting := TJsonFormatting.Indented;
   txtJson.WriteStartObject;
   TxtJSON.WritePropertyName('Carregamento');
    TxtJSON.WriteStartArray;
     txtJson.WriteStartObject;
       txtJson.WritePropertyName('id');
       txtJson.WriteValue(idCarregamento);
     txtJson.WriteEndObject;
    TxtJSON.WriteEndArray;
   txtJson.WriteEndObject;
   LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
   Url := 'http://'+frmPrincipal.HostSrv+':'+frmPrincipal.PortaSrv+'/datasnap/rest/TServerMethods1/MudaFlagCarregamento';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
   end;
 Result     := vReultHTTP;
end;

function TdmSync.PostCarregamentoFB: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
 qryAux:TFDQuery;
begin
  udb.Carregamento.Close;
  udb.Carregamento.Open;
  udb.Carregamento.First;
  if not udb.Carregamento.IsEmpty then
  begin
   JsonToSend := TStringStream.Create(nil);
   udb.Carregamento.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+frmPrincipal.HostSrv+':'+frmPrincipal.PortaSrv+'/datasnap/rest/TServerMethods1/EnviaCarregamento';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     udb.AlteraFlagCarregamento(vReultHTTP);
   end;
  end;
  Result := vReultHTTP;
end;

function TdmSync.PostFabricacaoAlimentosTGC(idBatida,idBatidaTGC:string):string;
var
 Txt         : TextFile;
 Quebra      : TStringList;
 LJSon       : TJSONArray;
 Url,URLDec,vReultHTTP,vReultHTTPc,
 vReultHTTPClean,vIdLocal: String;
 JsonToSend  : TStringStream;
 i           : integer;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
begin
  AbreTGCFabricacaoAlimentos(idBatida,idBatidaTGC);
  FabricacaoAlimentosTGC.First;
  if not FabricacaoAlimentosTGC.IsEmpty then
  begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    TxtJSON.WritePropertyName('FabricacaoAlimentosTGC');
    TxtJSON.WriteStartArray;
    while not FabricacaoAlimentosTGC.Eof do
    begin
        txtJson.WriteStartObject;
         txtJson.WritePropertyName('DBT_CODBATIDA');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_CODBATIDA').AsString);
         txtJson.WritePropertyName('DBT_CODALIMENTO');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_CODALIMENTO').AsString);
         txtJson.WritePropertyName('DBT_QTDE');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_QTDE').AsString);
         txtJson.WritePropertyName('DBT_USUARIO');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_USUARIO').AsString);
         txtJson.WritePropertyName('DBT_CUSTO');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_CUSTO').AsString);
         txtJson.WritePropertyName('DBT_DATA');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_DATA').AsString);
         txtJson.WritePropertyName('DBT_HORA');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_HORA').AsString);
         txtJson.WritePropertyName('DBT_QTDEPREVISTA');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_QTDEPREVISTA').AsString);
         txtJson.WritePropertyName('DBT_PREV_MS');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_PREV_MS').AsString);
         txtJson.WritePropertyName('DBT_PREV_KGMNP');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_PREV_KGMNP').AsString);
         txtJson.WritePropertyName('DBT_PREV_VALOR_KG');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_PREV_VALOR_KG').AsString);
         txtJson.WritePropertyName('DBT_PREV_VALOR_TOTAL');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_PREV_VALOR_TOTAL').AsString);
         txtJson.WritePropertyName('DBT_REAL_KGMSP');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_REAL_KGMSP').AsString);
         txtJson.WritePropertyName('DBT_HORA_INI');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_HORA_INI').AsString);
         txtJson.WritePropertyName('DBT_HORA_FIM');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_HORA_FIM').AsString);
         txtJson.WritePropertyName('DBT_REAL_KGMNP');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_REAL_KGMNP').AsString);
         txtJson.WritePropertyName('DBT_REAL_KGMNP');
         txtJson.WriteValue(FabricacaoAlimentosTGC.FieldByName('DBT_REAL_KGMNP').AsString);
       txtJson.WriteEndObject;
       FabricacaoAlimentosTGC.Next;
    end;
    TxtJSON.WriteEndArray; //Fecha Array dos Itens
    txtJson.WriteEndObject;

    LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
    JsonToSend := TStringStream.Create(LJsonObj.ToJSON);

    Url := 'http://'+Host+':'+Porta+'/FabricacaoInsumosTGC';
    IdHTTP1.Request.CustomHeaders.Clear;
    IdHTTP1.Request.Accept      := 'application/json';
    IdHTTP1.Request.ContentType := 'application/json';
    try
      vReultHTTP  := IdHTTP1.Post(url,JsonToSend);
      result      := 'ok'
    except
    on E: EIdHTTPProtocolException do
      begin
        result:=('Erro ao Sincronizar Fabricao:'+e.Message);
      end;
     end;
  end;
end;

function TdmSync.PostFabricacaoTGC: string;
var
 Txt         : TextFile;
 Quebra      : TStringList;
 LJSon       : TJSONArray;
 Url,URLDec,vReultHTTP,vReultHTTPc,
 vReultHTTPClean,vIdLocal: String;
 JsonToSend  : TStringStream;
 i           : integer;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
begin
  Fabricacao.Close;
  Fabricacao.Open;
  if not Fabricacao.IsEmpty then
  begin
   Fabricacao.First;
   while not Fabricacao.Eof do
   begin
     vIdLocal:= Fabricacao.FieldByName('Id').AsString;
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     TxtJSON.WritePropertyName('TGCFabricacao');
      TxtJSON.WriteStartArray;
       txtJson.WriteStartObject;
         txtJson.WritePropertyName('CBT_CODRACAOPROD');
         txtJson.WriteValue(Fabricacao.FieldByName('CBT_CODRACAOPROD').AsString);
         txtJson.WritePropertyName('CBT_QTDEBATIDA');
         txtJson.WriteValue(Fabricacao.FieldByName('CBT_QTDEBATIDA').AsString);
         txtJson.WritePropertyName('CBT_CUSTO');
         txtJson.WriteValue(Fabricacao.FieldByName('CBT_CUSTO').AsString);
         txtJson.WritePropertyName('CBT_DATA');
         txtJson.WriteValue(Fabricacao.FieldByName('CBT_DATA').AsString);
         txtJson.WritePropertyName('CBT_INICIO');
         txtJson.WriteValue(FormatDateTime('hh:mm:ss',Fabricacao.FieldByName('CBT_INICIO').AsDateTime));
         txtJson.WritePropertyName('CBT_FIM');
         txtJson.WriteValue(FormatDateTime('hh:mm:ss',Fabricacao.FieldByName('CBT_FIM').AsDateTime));
         txtJson.WritePropertyName('CBT_USUARIO');
         txtJson.WriteValue(Fabricacao.FieldByName('CBT_USUARIO').AsString);
         txtJson.WritePropertyName('CBT_QTDEPREVISTA');
         txtJson.WriteValue(Fabricacao.FieldByName('CBT_QTDEPREVISTA').AsString);
         txtJson.WritePropertyName('CBT_LOTE_FABRICACAO');
         txtJson.WriteValue(Fabricacao.FieldByName('CBT_LOTE_FABRICACAO').AsString);
         txtJson.WritePropertyName('CBT_NOMEOPERADOR');
         txtJson.WriteValue(Fabricacao.FieldByName('CBT_NOMEOPERADOR').AsString);
         txtJson.WritePropertyName('CBT_COD_OPERADOR_PA');
         txtJson.WriteValue(Fabricacao.FieldByName('CBT_COD_OPERADOR_PA').AsString);
       txtJson.WriteEndObject;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     txtJson.WriteEndObject;

     LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     JsonToSend := TStringStream.Create(LJsonObj.ToJSON);

     Url := 'http://'+Host+':'+Porta+'/fabricacaoTGC';
     IdHTTP1.Request.CustomHeaders.Clear;
     IdHTTP1.Request.Accept      := 'application/json';
     IdHTTP1.Request.ContentType := 'application/json';
     try
      vReultHTTP  := IdHTTP1.Post(url,JsonToSend);
      vReultHTTPc := copy(vReultHTTP,0,18);
      if IdHTTP1.ResponseCode=200 then
      begin
       try
        if IdHTTP1.ResponseCode=200 then
        begin
         vReultHTTPClean :=LimpaResut(vReultHTTP);
         if PostFabricacaoAlimentosTGC(vIdLocal,vReultHTTPClean)='ok' then
          ChangeFlagSyncFabricacao(vIdLocal)
         else
          ShowMessage('Erro ao enviar Fabricação');
        end;
       except
        on E: EIdHTTPProtocolException do
        begin
          result:=('Erro ao Sincronizar Fabricao:'+e.Message);
          Break;
        end;
       end;
      end;
     Fabricacao.Next;
     except
      on E: EIdHTTPProtocolException do
      begin
        result:=('Erro ao Sincronizar Fabricao:'+e.Message);
        Break;
      end;
     end;
   end;
  end;
end;

function TdmSync.PostFornecimentoTGC: string;
var
 Txt         : TextFile;
 Quebra      : TStringList;
 LJSon       : TJSONArray;
 Url,URLDec,vReultHTTP,vReultHTTPc,
 vReultHTTPClean,vIdLocal: String;
 JsonToSend  : TStringStream;
 i           : integer;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
begin
  Fornecimento.Close;
  Fornecimento.Open;
  if not Fornecimento.IsEmpty then
  begin
   Fornecimento.First;
   while not Fornecimento.Eof do
   begin
     vIdLocal:= Fornecimento.FieldByName('ID').AsString;
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     TxtJSON.WritePropertyName('TGCFornecimento');
      TxtJSON.WriteStartArray;
       txtJson.WriteStartObject;
         txtJson.WritePropertyName('CFORN_REALIZADO');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_REALIZADO').AsString);
         txtJson.WritePropertyName('CFORN_DATAFORNECIDO');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_DATAFORNECIDO').AsString);
         txtJson.WritePropertyName('CFORN_CUSTO');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_CUSTO').AsString);
         txtJson.WritePropertyName('CFORN_MOTORISTA');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_MOTORISTA').AsString);
         txtJson.WritePropertyName('CFORN_HORA');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_HORA').AsString);
         txtJson.WritePropertyName('CFORN_LOTE_FABRICACAO');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_LOTE_FABRICACAO').AsString);
         txtJson.WritePropertyName('CFORN_HORA_INI');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_HORA_INI').AsString);
         txtJson.WritePropertyName('CFORN_HORA_FIM');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_HORA_FIM').AsString);
         txtJson.WritePropertyName('CFORN_DATAFORNECIDO');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_DATAFORNECIDO').AsString);
         txtJson.WritePropertyName('CFORN_CODBAIA');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_CODBAIA').AsString);
         txtJson.WritePropertyName('CFORN_TRATO');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_TRATO').AsString);
         txtJson.WritePropertyName('CFORN_CODRACAOPROD_PREV');
         txtJson.WriteValue(Fornecimento.FieldByName('CFORN_CODRACAOPROD_PREV').AsString);
      txtJson.WriteEndObject;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     txtJson.WriteEndObject;

     LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     JsonToSend := TStringStream.Create(LJsonObj.ToJSON);


     Url := 'http://'+Host+':'+Porta+'/FornecimentoTGC';
     IdHTTP1.Request.CustomHeaders.Clear;
     IdHTTP1.Request.Accept      := 'application/json';
     IdHTTP1.Request.ContentType := 'application/json';
     try
      vReultHTTP  := IdHTTP1.Post(url,JsonToSend);
      vReultHTTPc := copy(vReultHTTP,0,18);
      if IdHTTP1.ResponseCode=200 then
       ChangeFlagSyncFornecimento(vIdLocal);
     Fornecimento.Next;
     except
      on E: EIdHTTPProtocolException do
      begin
        result:=('Erro ao Sincronizar Fabricao:'+e.Message);
        Break;
      end;
     end;
   end;
  end;
end;

procedure TdmSync.RacaoAlimentosReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(E.Message);
end;

procedure TdmSync.UsuariosReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 frmPrincipal.memoLog.Lines.Add('Erro ao Inserir Usuario '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now)+' : '+
  E.Message);
end;

function TdmSync.GetUsuarios: string;
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
   Url := 'http://'+Host+':'+Porta+'/usuario';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      vJoGet := jSubObj.GetValue<TJSONArray>('Usuarios') as TJSONArray;
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

function TdmSync.GetUsuariosTGC: string;
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
   Url := 'http://'+Host+':'+Porta+'/usuarioTGC';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
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

function TdmSync.GetCurrais: string;
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
   Url := 'http://'+Host+':'+Porta+'/curral';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      vJoGet := jSubObj.GetValue<TJSONArray>('Currais') as TJSONArray;
      for i := 0 to vJoGet.Count-1 do
      begin
        Currais.Close;
        Currais.Open;
        vJoGetJ            := vJoGet.Items[i] as TJSONObject;
        vId                := vJoGetJ.GetValue('ID').value;
        Currais.Filtered := false;
        Currais.Filter   := 'id='+vId;
        Currais.Filtered := true;
        if not Currais.IsEmpty then
         Currais.Edit
        else
         Currais.Insert;
        for z := 0 to Currais.Fields.Count -1 do
        begin
         vField:=UpperCase(StringReplace(Currais.Fields[z].Name,
          'Currais','',[rfReplaceAll]));
         Currais.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
        end;
        try
         Currais.ApplyUpdates(-1);
        except
         on E: Exception do
           begin
             result:='Erro ao inserir Currais:'+E.Message;
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

function TdmSync.GetCurraisTGC: string;
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
   Url := 'http://'+Host+':'+Porta+'/curralTGC';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      vJoGet := jSubObj.GetValue<TJSONArray>('CurraisTGC') as TJSONArray;
      for i := 0 to vJoGet.Count-1 do
      begin
        Currais.Close;
        Currais.Open;
        vJoGetJ            := vJoGet.Items[i] as TJSONObject;
        vId                := vJoGetJ.GetValue('ID').value;
        Currais.Filtered := false;
        Currais.Filter   := 'id='+vId;
        Currais.Filtered := true;
        if not Currais.IsEmpty then
         Currais.Edit
        else
         Currais.Insert;
        for z := 0 to Currais.Fields.Count -1 do
        begin
         vField:=UpperCase(StringReplace(Currais.Fields[z].Name,
          'Currais','',[rfReplaceAll]));
         Currais.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
        end;
        try
         Currais.ApplyUpdates(-1);
        except
         on E: Exception do
           begin
             result:='Erro ao inserir Currais:'+E.Message;
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

function TdmSync.GetAlimentos: string;
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
   Url := 'http://'+Host+':'+Porta+'/alimento';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      vJoGet := jSubObj.GetValue<TJSONArray>('Alimentos') as TJSONArray;
      for i := 0 to vJoGet.Count-1 do
      begin
        Alimentos.Close;
        Alimentos.Open;
        vJoGetJ            := vJoGet.Items[i] as TJSONObject;
        vId                := vJoGetJ.GetValue('ID').value;
        Alimentos.Filtered := false;
        Alimentos.Filter   := 'id='+vId;
        Alimentos.Filtered := true;
        if not Alimentos.IsEmpty then
         Alimentos.Edit
        else
         Alimentos.Insert;
        for z := 0 to Alimentos.Fields.Count -1 do
        begin
         vField:=UpperCase(StringReplace(Alimentos.Fields[z].Name,
          'Alimentos','',[rfReplaceAll]));
         Alimentos.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
        end;
        try
         Alimentos.ApplyUpdates(-1);
        except
         on E: Exception do
           begin
             result:='Erro ao inserir Alimentos:'+E.Message;
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

function TdmSync.GetAlimentosTGC: string;
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
   Url := 'http://'+Host+':'+Porta+'/alimentoTGC';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      vJoGet := jSubObj.GetValue<TJSONArray>('AlimentosTGC') as TJSONArray;
      for i := 0 to vJoGet.Count-1 do
      begin
        Alimentos.Close;
        Alimentos.Open;
        vJoGetJ            := vJoGet.Items[i] as TJSONObject;
        vId                := vJoGetJ.GetValue('ID').value;
        Alimentos.Filtered := false;
        Alimentos.Filter   := 'id='+vId;
        Alimentos.Filtered := true;
        if not Alimentos.IsEmpty then
         Alimentos.Edit
        else
         Alimentos.Insert;
        for z := 0 to Alimentos.Fields.Count -1 do
        begin
         vField:=UpperCase(StringReplace(Alimentos.Fields[z].Name,
          'Alimentos','',[rfReplaceAll]));
         Alimentos.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
        end;
        try
         Alimentos.FieldByName('DATAREG').AsDateTime := now;
         Alimentos.ApplyUpdates(-1);
        except
         on E: Exception do
           begin
             result:='Erro ao inserir Alimentos:'+E.Message;
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

function TdmSync.GetRacao: string;
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
   Url := 'http://'+Host+':'+Porta+'/racao';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      vJoGet := jSubObj.GetValue<TJSONArray>('Racao') as TJSONArray;
      for i := 0 to vJoGet.Count-1 do
      begin
        Racao.Close;
        Racao.Open;
        vJoGetJ            := vJoGet.Items[i] as TJSONObject;
        vId                := vJoGetJ.GetValue('ID').value;
        Racao.Filtered := false;
        Racao.Filter   := 'id='+vId;
        Racao.Filtered := true;
        if not Racao.IsEmpty then
         Racao.Edit
        else
         Racao.Insert;
        for z := 0 to Racao.Fields.Count -1 do
        begin
         vField:=UpperCase(StringReplace(Racao.Fields[z].Name,
          'Racao','',[rfReplaceAll]));
         Racao.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
        end;
        try
         Racao.ApplyUpdates(-1);
         frmPrincipal.memoLog.Lines.Add('Baixando Insumos Racao:');
         frmPrincipal.memoLog.Lines.Add(GetRacaoInsumos(vId));
        except
         on E: Exception do
           begin
             result:='Erro ao inserir Racao:'+E.Message;
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

function TdmSync.GetRacaoInsumos(IdRacao:string): string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;

 JsonToSend : TStringStream;
 LJsonObj   : TJSONObject;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 Stream: TMemoryStream;
begin
  StrAux  := TStringWriter.Create;

  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  TxtJSON.WriteStartObject;
   TxtJSON.WritePropertyName('Racao');
   TxtJSON.WriteStartArray;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('id');
     txtJson.WriteValue(IdRacao);
   TxtJSON.WriteEndArray;
  TxtJSON.WriteEndObject;
  LJsonObj := TJsonObject.ParseJSONValue(TEncoding.ASCII.GetBytes(StrAux.ToString),0)as TJSONObject;
  JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
  IdHTTP1.Request.CustomHeaders.Clear;
  IdHTTP1.Request.Clear;
  IdHTTP1.Request.Accept      := 'application/json';
  IdHTTP1.Request.ContentType := 'application/json';


   Url := 'http://'+Host+':'+Porta+'/racaoinsumoTGC';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Post(url,JsonToSend);
    if IdHTTP1.ResponseCode=200 then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('RacaoAlimentosTGC') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ            := vJoGet.Items[i] as TJSONObject;
          vId                := vJoGetJ.GetValue('ID').value;
          RacaoAlimentos.Close;
          RacaoAlimentos.Open;
          RacaoAlimentos.Filtered := false;
          RacaoAlimentos.Filter   := 'id='+vId;
          RacaoAlimentos.Filtered := true;
          if RacaoAlimentos.IsEmpty then
          begin
             RacaoAlimentos.Insert;
              for z := 0 to RacaoAlimentos.Fields.Count -1 do
              begin
               vField:= UpperCase(StringReplace(RacaoAlimentos.Fields[z].Name,
                'RacaoAlimentos','',[rfReplaceAll]));
               RacaoAlimentos.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
              end;
            try
              RacaoAlimentos.ApplyUpdates(-1);
            except
             on E: Exception do
               begin
                 result:='Erro ao inserir Racao Insumos:'+E.Message;
               end;
            end;
          end;
       end;
       result:='Racao Insumos Baixados com Sucesso!'
    end
    else
     Result :='Erro ao Baixar Insumos Ração!'
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;



function TdmSync.GetRacaoInsumosTGC(IdRacao: string): string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;

 JsonToSend : TStringStream;
 LJsonObj   : TJSONObject;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 Stream: TMemoryStream;
begin
  StrAux  := TStringWriter.Create;

  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  TxtJSON.WriteStartObject;
   TxtJSON.WritePropertyName('Racao');
   TxtJSON.WriteStartArray;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('id');
     txtJson.WriteValue(IdRacao);
   TxtJSON.WriteEndArray;
  TxtJSON.WriteEndObject;
  LJsonObj := TJsonObject.ParseJSONValue(TEncoding.ASCII.GetBytes(StrAux.ToString),0)as TJSONObject;
  JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
  IdHTTP1.Request.CustomHeaders.Clear;
  IdHTTP1.Request.Clear;
  IdHTTP1.Request.Accept      := 'application/json';
  IdHTTP1.Request.ContentType := 'application/json';


   Url := 'http://'+Host+':'+Porta+'/racaoinsumoTGC';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Post(url,JsonToSend);
    if IdHTTP1.ResponseCode=200 then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('RacaoAlimentosTGC') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ            := vJoGet.Items[i] as TJSONObject;
          vId                := vJoGetJ.GetValue('ID').value;
          RacaoAlimentos.Close;
          RacaoAlimentos.Open;
          RacaoAlimentos.Filtered := false;
          RacaoAlimentos.Filter   := 'id='+vId;
          RacaoAlimentos.Filtered := true;
          if RacaoAlimentos.IsEmpty then
            RacaoAlimentos.Insert
          else
            RacaoAlimentos.Edit;

              for z := 0 to RacaoAlimentos.Fields.Count -1 do
              begin
               vField:= UpperCase(StringReplace(RacaoAlimentos.Fields[z].Name,
                'RacaoAlimentos','',[rfReplaceAll]));
               RacaoAlimentos.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
              end;
            try
              RacaoAlimentos.ApplyUpdates(-1);
            except
             on E: Exception do
               begin
                 result:='Erro ao inserir Racao Insumos:'+E.Message;
               end;
            end;

       end;
       result:='Racao Insumos Baixados com Sucesso!'
    end
    else
     Result :='Erro ao Baixar Insumos Ração!'
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;

end;

function TdmSync.GetRacaoTGC: string;
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
   Url := 'http://'+Host+':'+Porta+'/racaoTGC';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      vJoGet := jSubObj.GetValue<TJSONArray>('RacaoTGC') as TJSONArray;

      for i := 0 to vJoGet.Count-1 do
      begin
        Racao.Close;
        Racao.Open;
        vJoGetJ            := vJoGet.Items[i] as TJSONObject;
        vId                := vJoGetJ.GetValue('ID').value;
        Racao.Filtered := false;
        Racao.Filter   := 'id='+vId;
        Racao.Filtered := true;
        if not Racao.IsEmpty then
         Racao.Edit
        else
         Racao.Insert;
        for z := 0 to Racao.Fields.Count -1 do
        begin
         vField:=UpperCase(StringReplace(Racao.Fields[z].Name,
          'Racao','',[rfReplaceAll]));
         Racao.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
        end;
        try
         Racao.ApplyUpdates(-1);
         frmPrincipal.memoLog.Lines.Add('Baixando Insumos Racao:');
         frmPrincipal.memoLog.Lines.Add(GetRacaoInsumosTGC(vId));
        except
         on E: Exception do
           begin
             result:='Erro ao inserir Racao:'+E.Message;
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

end.
