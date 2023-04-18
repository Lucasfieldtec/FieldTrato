unit UdmLeitura;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,System.JSON,
  System.JSON.Writers,System.IniFiles, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  FireDAC.Phys.IBBase,FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,System.JSON.Types,
  System.Variants;
type
  TdmLeitura = class(TDataModule)
    SyncCurral: TFDQuery;
    SyncCurralCC_CODIGO: TIntegerField;
    SyncCurralCC_LINHA: TStringField;
    SyncCurralCC_NUMERO: TStringField;
    SyncCurralCC_STATUS: TStringField;
    SyncCurralCC_NOME: TStringField;
    SyncCurralCC_ORDEM: TIntegerField;
    SyncLote: TFDQuery;
    SyncNotas: TFDQuery;
    SyncUsuario: TFDQuery;
    SyncLeitura: TFDQuery;
    SyncUsuarioID: TIntegerField;
    SyncUsuarioNOME: TStringField;
    SyncUsuarioUSUARIO: TStringField;
    SyncUsuarioSENHA: TStringField;
    SyncLeituraTMP_CODIGO: TLargeintField;
    SyncLeituraTMP_CURRAL: TStringField;
    SyncLeituraTMP_CODCURRAL: TIntegerField;
    SyncLeituraTMP_NOTA_DIURNA: TFMTBCDField;
    SyncLeituraTMP_NOTA_NOTURNA: TStringField;
    SyncLeituraTMP_DATA_HORA: TSQLTimeStampField;
    SyncLeituraTMP_COMPORTAMENTO: TStringField;
    SyncLeituraTMP_CODUSUARIO: TIntegerField;
    SyncLeituraTMP_DATAREG: TSQLTimeStampField;
    SyncLeituraTMP_FLAG_LEITURA: TStringField;
    SyncLeituraTMP_FLAG_ATUALIZADO: TStringField;
    SyncNotasNOTA: TFMTBCDField;
    SyncNotasAJUSTE: TFMTBCDField;
    SyncHistLeitura: TFDQuery;
    SyncHistLeituraDATA: TDateField;
    SyncHistLeituraID_LOTE: TIntegerField;
    SyncHistLeituraID_BAIA: TStringField;
    SyncHistLeituraNOTA: TFMTBCDField;
    SyncHistLeituraAJUSTE_KG: TFMTBCDField;
    SyncHistConsumo: TFDQuery;
    SyncHistConsumoDATA: TDateField;
    SyncHistConsumoID_LOTE: TIntegerField;
    SyncHistConsumoLOTE: TStringField;
    SyncHistConsumoMN: TFMTBCDField;
    SyncHistConsumoMS: TFMTBCDField;
    SyncHistConsumoIMS_PV: TFMTBCDField;
  private
    function GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
  public
    function GetCurrais: TJSONObject;
    function GetLotes: TJSONObject;
    function GetUusarios: TJSONObject;
    function GetNotas: TJSONObject;
    function GetHistLeitura: TJSONObject;
    function GetHistConsumo: TJSONObject;
  end;

var
  dmLeitura: TdmLeitura;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses dmDB, UWsField;

{$R *.dfm}

function TdmLeitura.GetHistLeitura: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if udb.FConTGC.Connected=false then udb.ConectaFB_TGC;
  SyncHistLeitura.Connection := udb.FConTGC;
 SyncHistLeitura.Close;
 SyncHistLeitura.Open;
 Result := GetDataSetAsJSON(SyncHistLeitura);
end;

function TdmLeitura.GetHistConsumo: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if udb.FConTGC.Connected=false then udb.ConectaFB_TGC;
  SyncHistConsumo.Connection := udb.FConTGC;
 SyncHistConsumo.Close;
 SyncHistConsumo.Open;
 Result := GetDataSetAsJSON(SyncHistConsumo);
end;

function TdmLeitura.GetCurrais: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if udb.FConTGC.Connected=false then udb.ConectaFB_TGC;
  SyncCurral.Connection := udb.FConTGC;
 SyncCurral.Close;
 SyncCurral.Open;
 Result := GetDataSetAsJSON(SyncCurral);
end;


function TdmLeitura.GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
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

function TdmLeitura.GetLotes: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if udb.FConTGC.Connected=false then udb.ConectaFB_TGC;
  SyncNotas.Connection := udb.FConTGC;
 SyncLote.Close;
 SyncLote.Open;
 Result := GetDataSetAsJSON(SyncLote);
end;

function TdmLeitura.GetNotas: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if udb.FConTGC.Connected=false then udb.ConectaFB_TGC;
  SyncNotas.Connection := udb.FConTGC;
 SyncNotas.Close;
 SyncNotas.Open;
 Result := GetDataSetAsJSON(SyncNotas);
end;

function TdmLeitura.GetUusarios: TJSONObject;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if udb.FConTGC.Connected=false then udb.ConectaFB_TGC;
  SyncUsuario.Connection := udb.FConTGC;
 SyncUsuario.Close;
 SyncUsuario.Open;
 Result := GetDataSetAsJSON(SyncUsuario);
end;

end.
