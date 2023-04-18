unit UDmDb;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client,FMX.Dialogs,FMX.Forms,System.UITypes,FireDAC.DApt,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  System.IOUtils, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase;

type
  Tudb = class(TDataModule)
    FCon: TFDConnection;
    LinkDriverLink1: TFDPhysSQLiteDriverLink;
    Config: TFDQuery;
    Configid: TFDAutoIncField;
    ConfigIpServ: TStringField;
    ConfigPortaServ: TStringField;
    ConfigIPClp: TStringField;
    ConfigPortaCLP: TStringField;
    ConfigTipoOperacao: TIntegerField;
    Alimentos: TFDQuery;
    AlimentosId: TIntegerField;
    AlimentosNome: TStringField;
    AlimentosDataReg: TDateTimeField;
    AlimentosStatus: TIntegerField;
    Racao: TFDQuery;
    RacaoId: TIntegerField;
    RacaoNome: TStringField;
    RacaoTipo: TStringField;
    RacaoTempoMistura: TIntegerField;
    RacaoStatus: TIntegerField;
    RacaoDatareg: TDateTimeField;
    FabricacaoAlimentos: TFDQuery;
    Fabricacao: TFDQuery;
    RacaoAlimentos: TFDQuery;
    ConfigidVagao: TIntegerField;
    ConfigTempoPularIngrediente: TIntegerField;
    Operador: TFDQuery;
    OperadorId: TFDAutoIncField;
    OperadorNome: TStringField;
    OperadorLogin: TStringField;
    OperadorSenha: TWideStringField;
    OperadorOperador: TIntegerField;
    OperadorDatareg: TDateTimeField;
    OperadorStatus: TIntegerField;
    OperadorTipo: TIntegerField;
    FabricacaoId: TFDAutoIncField;
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
    FabricacaoRacao: TStringField;
    FabricacaoOperador: TStringField;
    TRacaoFabricando: TFDQuery;
    TRacaoFabricandoId: TFDAutoIncField;
    TRacaoFabricandoIdReceita: TIntegerField;
    TRacaoFabricandoIdUsuario: TIntegerField;
    TRacaoFabricandoIdOperador: TIntegerField;
    TRacaoFabricandoData: TDateField;
    TRacaoFabricandoHoraIni: TDateTimeField;
    TRacaoFabricandoHoraFim: TDateTimeField;
    TRacaoFabricandoPrevKG: TFMTBCDField;
    TRacaoFabricandoRealizadoKG: TFMTBCDField;
    TRacaoFabricandoPesoBalancaInicio: TFMTBCDField;
    TRacaoFabricandoPesoBalancaFim: TFMTBCDField;
    TRacaoFabricandoFinalizada: TIntegerField;
    TRacaoFabricandoCarregada: TIntegerField;
    TRacaoFabricandoSync: TIntegerField;
    TRacaoFabricandoDataSync: TDateTimeField;
    TRacaoFabricandoIdVAGAO: TIntegerField;
    TRacaoFabricandotrato: TIntegerField;
    TRacaoFabricandoLote: TStringField;
    TRacaoFabricandoStatus: TIntegerField;
    TRacaoFabricandoAlimentos: TFDQuery;
    TRacaoFabricandoAlimentosId: TFDAutoIncField;
    TRacaoFabricandoAlimentosIdFabricacao: TIntegerField;
    TRacaoFabricandoAlimentosIdAlimento: TIntegerField;
    TRacaoFabricandoAlimentosHoraIni: TDateTimeField;
    TRacaoFabricandoAlimentosHoraFim: TDateTimeField;
    TRacaoFabricandoAlimentosPrevKG: TFMTBCDField;
    TRacaoFabricandoAlimentosRealizadoKG: TFMTBCDField;
    TRacaoFabricandoAlimentosPesoBalancaInicio: TFMTBCDField;
    TRacaoFabricandoAlimentosPesoBalancaFim: TFMTBCDField;
    TRacaoFabricandoAlimentosSync: TIntegerField;
    TRacaoFabricandoAlimentosDataSync: TDateTimeField;
    TRacaoFabricandoAlimentosOrdem: TIntegerField;
    TRacaoFabricandoAlimentosPercentToleracia: TIntegerField;
    TRacaoFabricandoAlimentosAlimento: TStringField;
    TIngredienteFabricando: TFDQuery;
    TIngredienteFabricandoId: TFDAutoIncField;
    TIngredienteFabricandoIdFabricacao: TIntegerField;
    TIngredienteFabricandoIdAlimento: TIntegerField;
    TIngredienteFabricandoHoraIni: TDateTimeField;
    TIngredienteFabricandoHoraFim: TDateTimeField;
    TIngredienteFabricandoPrevKG: TFMTBCDField;
    TIngredienteFabricandoRealizadoKG: TFMTBCDField;
    TIngredienteFabricandoPesoBalancaInicio: TFMTBCDField;
    TIngredienteFabricandoPesoBalancaFim: TFMTBCDField;
    TIngredienteFabricandoSync: TIntegerField;
    TIngredienteFabricandoDataSync: TDateTimeField;
    TIngredienteFabricandoOrdem: TIntegerField;
    TIngredienteFabricandoPercentToleracia: TIntegerField;
    TIngredienteFabricandoAlimento: TStringField;
    TRacaoFabricandoRacaoFab: TStringField;
    ConfigPesoEstavelBalanca: TIntegerField;
    RacaoAlimentosID: TFDAutoIncField;
    RacaoAlimentosIDRACAO: TIntegerField;
    RacaoAlimentosIDALIMENTO: TIntegerField;
    RacaoAlimentosINCLUSAOMN: TBCDField;
    RacaoAlimentosORDEMFABRICACAO: TIntegerField;
    RacaoAlimentosPERCENTTOLERANCIA: TBCDField;
    RacaoAlimentosVALORKG: TBCDField;
    RacaoAlimentosAlimento: TStringField;
    RacaoAlimentosMS: TBCDField;
    Usuario: TFDQuery;
    UsuarioID: TIntegerField;
    UsuarioNOME: TStringField;
    UsuarioLOGIN: TStringField;
    UsuarioSENHA: TWideStringField;
    UsuarioOPERADOR: TIntegerField;
    UsuarioDATAREG: TDateTimeField;
    UsuarioSTATUS: TIntegerField;
    UsuarioTIPO: TIntegerField;
    Currais: TFDQuery;
    PrevistoFor: TFDQuery;
    Carregamento: TFDQuery;
    Fornecimento: TFDQuery;
    CurraisID: TIntegerField;
    CurraisLINHA: TStringField;
    CurraisNUMERO: TIntegerField;
    CurraisNOME: TStringField;
    CurraisTAG_INICIO: TStringField;
    CurraisTAG_FIM: TStringField;
    CurraisSTATUS: TIntegerField;
    CarregamentoIDRacao: TIntegerField;
    CarregamentoKGFabricado: TBCDField;
    CarregamentoDataFabricacao: TDateField;
    CarregamentoDataCarregamento: TDateField;
    CarregamentoPesoInicio: TBCDField;
    CarregamentoPesoFim: TBCDField;
    CarregamentoTotalCarregado: TBCDField;
    CarregamentoLoteFabricacao: TStringField;
    CarregamentoidUsuario: TIntegerField;
    CarregamentoStatus: TIntegerField;
    CarregamentoDatareg: TDateTimeField;
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
    FornecimentoCurral: TStringField;
    FornecimentoRacaoPrev: TStringField;
    FornecimentoRacaoReal: TStringField;
    FornecimentoUsuario: TStringField;
    QPrevistoFor: TFDQuery;
    PrevistoForID: TFDAutoIncField;
    PrevistoForDATA: TDateField;
    PrevistoForIDCURRAL: TIntegerField;
    PrevistoForIDRACAO: TIntegerField;
    PrevistoForSTATUS: TIntegerField;
    PrevistoForTRATO: TIntegerField;
    PrevistoForTIPO: TIntegerField;
    PrevistoForKGPREVISTO: TIntegerField;
    QPrevistoForID: TFDAutoIncField;
    QPrevistoForDATA: TDateField;
    QPrevistoForIDCURRAL: TIntegerField;
    QPrevistoForIDRACAO: TIntegerField;
    QPrevistoForKGPREVISTO: TIntegerField;
    QPrevistoForSTATUS: TIntegerField;
    QPrevistoForTRATO: TIntegerField;
    QPrevistoForTIPO: TIntegerField;
    QPrevistoForCURRAL: TStringField;
    QPrevistoForRACAO: TStringField;
    QPrevistoForRealizado: TWideStringField;
    QPrevistoForHoraIni: TWideStringField;
    QPrevistoForHoraFim: TWideStringField;
    CarregamentoDistribuidor: TFDQuery;
    CarregamentoDistribuidorIDRacao: TIntegerField;
    CarregamentoDistribuidorKGFabricado: TBCDField;
    CarregamentoDistribuidorDataFabricacao: TDateField;
    CarregamentoDistribuidorDataCarregamento: TDateField;
    CarregamentoDistribuidorPesoInicio: TBCDField;
    CarregamentoDistribuidorPesoFim: TBCDField;
    CarregamentoDistribuidorTotalCarregado: TBCDField;
    CarregamentoDistribuidorLoteFabricacao: TStringField;
    CarregamentoDistribuidoridUsuario: TIntegerField;
    CarregamentoDistribuidorStatus: TIntegerField;
    CarregamentoDistribuidorDatareg: TDateTimeField;
    QPrevistoForTAG_INICIO: TStringField;
    QPrevistoForTAG_FIM: TStringField;
    QReplyPrev: TFDQuery;
    QReplyPrevID: TFDAutoIncField;
    QReplyPrevDATA: TDateField;
    QReplyPrevIDCURRAL: TIntegerField;
    QReplyPrevIDRACAO: TIntegerField;
    QReplyPrevKGPREVISTO: TIntegerField;
    QReplyPrevSTATUS: TIntegerField;
    QReplyPrevTRATO: TIntegerField;
    QReplyPrevTIPO: TIntegerField;
    QReplyPrevI: TFDQuery;
    QReplyPrevIID: TFDAutoIncField;
    QReplyPrevIDATA: TDateField;
    QReplyPrevIIDCURRAL: TIntegerField;
    QReplyPrevIIDRACAO: TIntegerField;
    QReplyPrevIKGPREVISTO: TIntegerField;
    QReplyPrevISTATUS: TIntegerField;
    QReplyPrevITRATO: TIntegerField;
    QReplyPrevITIPO: TIntegerField;
    FornecimentoTIPOPREVISTO: TIntegerField;
    qryAux: TFDQuery;
    CarregamentoValorKG: TBCDField;
    CarregamentoFlagSync: TIntegerField;
    CarregamentoDataSync: TDateTimeField;
    CarregamentoIDVAGAO: TIntegerField;
    CarregamentoDistribuidorValorKG: TBCDField;
    CarregamentoDistribuidorFlagSync: TIntegerField;
    CarregamentoDistribuidorDataSync: TDateTimeField;
    CarregamentoDistribuidorIDVAGAO: TIntegerField;
    CarregamentoDistribuidorID: TIntegerField;
    CarregamentoID: TIntegerField;
    CarregamentoDistribuidorcarregamento: TWideStringField;
    ConfigSistema: TIntegerField;
    CurraisORDEM: TIntegerField;
    procedure FConBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure FabricacaoReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    function  VerificaPrevistoDias:Boolean;
  public
    vIdUsuario,vNomeUsuario,vTipoUsuario,
     vIdCarregamento,vIdReceitaCarregada,vNomeReceitaCarregada,
     vIdLoteCarregado:string;//Carregamento Fornecimento
    vMsgConfirm:integer;
    function ValidaUsuario(login,senha:string):Boolean;
    function  ReplicaPrevisto:string;
    procedure AlteraFlagPrevisto;
    procedure AlteraFlagCarregamento(vId:string);

    procedure FinalizaCarregamento(idCarregamento:string);
    //abre Tabelas
    procedure AbreFabricacao(vFiltro:string);
    procedure AbrePrevistoForn(vFiltro:string);
    procedure AbrePrevistoFornCad(vIdRacao,IdTrato: string);
    procedure AbreFabricacaoIngredientes(vIdFabricacao:string);
    procedure AbreRacaoAlimentosFabricando(idFab:string);
    //Fabricacao
    function  InsereFabricacao(idRacao,idOperador,trato,previsto:string):string;
    function  InsereCarregamento(idFabricacao:string):string;
    procedure InsereFabricacaoAlimentos(vIdRacao,kgPrevisto:string);
    function  ReturnsIdByName(vTable,Nome:string):string;
    procedure CancelaFabricacao(vIdFab:string);
    procedure AtualizaIngredienteFabricacao(
     vIdDet,vHoraInicio,vHoraFim,vPesoInicio,vPesoFim,vPesoRealizado:string);
    procedure FinalizaFabricacao(vIdFab,vHoraFim,vRealizado:string);
    function RetornaTempoMisturaRacao(idRacao:string):integer;
    function RetornaTotalFabricado(vIdFab:string):string;
    function VerificaCarregamentoAberto:Boolean;
    function VerificaCarregamentoCarregado:Boolean;
    procedure InsereFornecimento(
     IDCARREGAMENTO,
     vDATA,
     IDCURRAL,
     TRATO,
     IDRACAOPREV,
     IDRACAOREAL,
     KGPREVISTO,
     KGREALIZADO,
     HORAINICIO,
     HORAFIM,
     PESOINICIO,
     PESOFIM,
     LOTEFAB,
     IDUSUARIO,
     TIPOPREVISTO :string);
    function RetornaIdCarregamento:string;
    function RetornaLoteFab(vIdCarregamento:string):string;
    function RetornaTotalFabCarregamento(vIdCarregamento: string): string;
    procedure AtualizaCarregamento(vPesoIni,vPesoFim,TotalCarregado,vId:string);
    procedure CreateTablesVersao(NumeroVersao: string);
    function VerificaCampoExiste(Acampo, Atabela: string):Boolean;
  end;

var
  udb: Tudb;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UPrincipal;

{$R *.dfm}

function Tudb.VerificaCampoExiste(Acampo, Atabela: string):Boolean;
var
 vQryAux:TFDQuery;
 vExiste:integer;
begin
 vExiste :=0;
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := FCon;
 vExiste:=0;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('PRAGMA table_info('+Atabela+')');
   Open;
   while not vQryAux.eof do
   begin
     if Acampo=vQryAux.FieldByName('name').AsString then
       vExiste:=1;
     vQryAux.Next;
   end;
 end;
 Result:=vExiste=1;
 vQryAux.Free;
end;

procedure Tudb.CreateTablesVersao(NumeroVersao: string);
var
 vQryAux:TFDQuery;
begin
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := FCon;
 if NumeroVersao='1.0.0.0' then
 begin
   if not VerificaCampoExiste('Sistema', 'Config') then
   begin
    with vQryAux,vQryAux.SQL do
    begin
     Clear;
     Add('ALTER TABLE Config ADD Sistema INTEGER NOT NULL DEFAULT 1');
     ExecSQL;
    end;
   end;
 end;
 vQryAux.Free;
end;

procedure Tudb.AbreFabricacao(vFiltro: string);
begin
 with Fabricacao,Fabricacao.SQL do
 begin
   Clear;
   Add('select a.*,b.Nome Racao,c.Nome Operador from Fabricacao a');
   Add('join Racao b on a.IdReceita=b.Id');
   Add('join usuario c on c.id=a.IdOperador');
   Add('where a.status=1');
   Add(vFiltro);
   Open;
 end;
end;

procedure Tudb.AbrePrevistoForn(vFiltro: string);
begin
 with QPrevistoFor,QPrevistoFor.SQL do
 begin
   Clear;
   Add('select');
   Add('A.*,');
   Add('B.NOME CURRAL,');
   Add('C.NOME RACAO,');
   Add('B.TAG_INICIO,');
   Add('B.TAG_FIM,');
   Add('CAST(coalesce((select sum(KGREALIZADO) from Fornecimento s');
   Add('where s.data=a.data and S.IDRACAOPREV=A.IDRACAO AND S.IDCURRAL=A.IDCURRAL');
   Add('and s.Trato=a.Trato),0)AS VARCHAR(20)) Realizado,');
   Add('(select min(s.horainicio) from Fornecimento s');
   Add('where s.data=a.data and S.IDRACAOPREV=A.IDRACAO AND S.IDCURRAL=A.IDCURRAL and s.Trato=a.Trato)HoraIni,');
   Add('(select min(s.horafim) from Fornecimento s');
   Add('where s.data=a.data and S.IDRACAOPREV=A.IDRACAO AND S.IDCURRAL=A.IDCURRAL and s.Trato=a.Trato)HoraFim');
   Add('from FornecimentoPrevisto A');
   Add('JOIN Currais B ON  A.IDCURRAL=B.ID');
   Add('JOIN RACAO C ON C.ID=A.IDRACAO');
   Add('WHERE 1=1');
   Add(vFiltro);
   Add('order by B.NOME');
   Open;
 end;
end;

procedure Tudb.AbrePrevistoFornCad(vIdRacao,IdTrato: string);
begin
 with QPrevistoFor,QPrevistoFor.SQL do
 begin
   Clear;
   Add('select');
   Add('A.*,');
   Add('B.NOME CURRAL,');
   Add('C.NOME RACAO,');
   Add('B.TAG_INICIO,');
   Add('B.TAG_FIM,');
   Add('CAST(coalesce((select sum(KGREALIZADO) from Fornecimento s');
   Add('where s.data=a.data and S.IDRACAOPREV=A.IDRACAO AND S.IDCURRAL=A.IDCURRAL),0)AS VARCHAR(20)) Realizado,');
   Add('(select min(s.horainicio) from Fornecimento s');
   Add('where s.data=a.data and S.IDRACAOPREV=A.IDRACAO AND S.IDCURRAL=A.IDCURRAL)HoraIni,');
   Add('(select min(s.horafim) from Fornecimento s');
   Add('where s.data=a.data and S.IDRACAOPREV=A.IDRACAO AND S.IDCURRAL=A.IDCURRAL)HoraFim');
   Add('from FornecimentoPrevisto A');
   Add('JOIN Currais B ON  A.IDCURRAL=B.ID');
   Add('JOIN RACAO C ON C.ID=A.IDRACAO');
   Add('where a.data='+FormatDateTime('yyyy-mm-dd',date).QuotedString);
   Add('and idracao='+vIdRacao);
   Add('and trato='+IdTrato);
   Add('order by B.NOME');
   QPrevistoFor.SQL.Text;
   Open;
   vNomeReceitaCarregada := FieldByName('RACAO').AsString;
 end;
end;

procedure Tudb.AbreFabricacaoIngredientes(vIdFabricacao: string);
begin
 with FabricacaoAlimentos,FabricacaoAlimentos.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Alimento,');
   Add('(a.PrevKG-a.RealizadoKG) difKG,');
   Add('(a.RealizadoKG*100)/(a.PrevKG) difPercent');
   Add('from FabricacaoAlimentos a');
   Add('join Alimentos b on a.IdAlimento=b.Id');
   Add('where a.IdFabricacao='+vIdFabricacao);
   Add('order by Ordem');
   Open;
 end;
end;

procedure Tudb.AbreRacaoAlimentosFabricando(idFab:string);
begin
 with TRacaoFabricandoAlimentos,TRacaoFabricandoAlimentos.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Alimento from FabricacaoAlimentos a');
   Add('join Alimentos b on a.IdAlimento=b.Id');
   Add('where a.IdFabricacao='+idFab);
   Add('order by a.Ordem');
   Open;
 end;
end;

procedure Tudb.AlteraFlagPrevisto;
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update FornecimentoPrevisto set status=-1');
   Add('where data<>:DATE');
   ParamByName('DATE').AsDate:=date;
   ExecSQL;
 end;
 vQry.Free;
end;

procedure Tudb.AlteraFlagCarregamento(vId:string);
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update carregamento set FlagSync=1,DataSync=current_timestamp');
   Add('where id=:id');
   ParamByName('id').Asstring:=vid;
   ExecSQL;
 end;
 vQry.Free;
end;

procedure Tudb.AtualizaCarregamento(vPesoIni, vPesoFim, TotalCarregado,
  vId: string);
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update Carregamento set');
   Add('PesoInicio=:PesoInicio,');
   Add('PesoFim=:PesoFim,');
   Add('TotalCarregado=:TotalCarregado,');
   Add('STATUS=2');
   Add('where id=:id');
   ParamByName('PesoInicio').AsString        := vPesoIni;
   ParamByName('PesoFim').AsString           := vPesoFim;
   ParamByName('TotalCarregado').AsString    := TotalCarregado;
   ParamByName('ID').AsString                := vId;
   try
     vQry.ExecSQL;
   except
     on E: Exception do
      ShowMessage('Erro ao Atualizar Carregamento:'+E.Message);
   end;
 end;
 vQry.Free;
end;

procedure Tudb.AtualizaIngredienteFabricacao(
     vIdDet,vHoraInicio,vHoraFim,vPesoInicio,vPesoFim,vPesoRealizado:string);
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update FabricacaoAlimentos set');
   Add('HoraIni=:HoraIni,');
   Add('HoraFim=:HoraFim,');
   Add('PesoBalancaInicio=:PesoBalancaInicio,');
   Add('PesoBalancaFim=:PesoBalancaFim,');
   Add('RealizadoKG=:RealizadoKG,');
   Add('VALORFABRICADO=:RealizadoKG * coalesce(VALORKG,0),');
   Add('KGMS_REAL=:RealizadoKG * (cast(MS_PREV as double precision)/(100))');
   Add('where id=:id');
   ParamByName('HoraIni').AsString           := vHoraInicio;
   ParamByName('HoraFim').AsString           := vHoraFim;
   ParamByName('PesoBalancaInicio').AsString := vPesoInicio;
   ParamByName('PesoBalancaFim').AsString    := vPesoFim;
   ParamByName('RealizadoKG').AsString       := vPesoRealizado;
   ParamByName('ID').AsString                := vIdDet;
   try
     vQry.ExecSQL;
   except
     on E: Exception do
      ShowMessage('Erro ao Atualizar Ingrediente:'+E.Message);
   end;
 end;
 vQry.Free;
end;

procedure Tudb.DataModuleCreate(Sender: TObject);
begin
 FCon.Connected := true;
end;

procedure Tudb.FabricacaoReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure Tudb.FConBeforeConnect(Sender: TObject);
var
 vPath:string;
begin
 {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   FCon.Params.DriverID :='SQLite';
   FCon.Params.Values['Database'] :=
   TPath.Combine(TPath.GetDocumentsPath,'Trato2.db');
 {$ENDIF}
 {$IFDEF MSWINDOWS}
   vPath := ExtractFilePath(ParamStr(0))+'db\dbFieldTrato.db';
   if FileExists(vPath) then
   begin
    FCon.Params.DriverID :='SQLite';
    FCon.Params.Values['Database'] :=vPath;
   end
   else
    ShowMessage('BD Não localizado!!');
 {$ENDIF}
end;

procedure Tudb.FinalizaCarregamento(idCarregamento: string);
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update Carregamento set status=2');
   Add('where Id=:id');
   ParamByName('id').AsString          := idCarregamento;
   try
    ExecSQL;
   except
    on E: Exception do
      ShowMessage('Erro ao Finalizar Carregamento:'+E.Message);
   end;
 end;
 vQry.Free;
end;

procedure Tudb.FinalizaFabricacao(vIdFab, vHoraFim, vRealizado: string);
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update Fabricacao set');
   Add('HoraFim=:HoraFim,');
   Add('RealizadoKG=:RealizadoKG,');
   Add('Finalizada=1,');
   Add('LOTE=id||idReceita||:RealizadoKG||strftime(''%H%M%S'')');
   Add('where Id=:id');
   ParamByName('HoraFim').AsString     := vHoraFim;
   ParamByName('RealizadoKG').AsString := vRealizado;
   ParamByName('id').AsString          := vIdFab;
   try
    ExecSQL;
   except
    on E: Exception do
      ShowMessage('Erro ao Cancelar Fabricação :'+E.Message);
   end;
 end;
 vQry.Free;
end;

procedure Tudb.CancelaFabricacao(vIdFab: string);
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update Fabricacao set Finalizada=1,Status=2');
   Add('where Id='+vIdFab);
   try
    ExecSQL;
   except
    on E: Exception do
      ShowMessage('Erro ao Cancelar Fabricação :'+E.Message);
   end;
 end;
 vQry.Free;
end;


function Tudb.InsereCarregamento(idFabricacao: string): string;
var
 vQry:TFDQuery;
 vIdReceita,RealizadoKG,DataFab,Lote,IdUsuario,ValorKG:string;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Add('select');
   Add('A.IdReceita,');
   Add('A.RealizadoKG,');
   Add('A.Data,');
   Add('a.Lote,');
   Add('a.idUsuario,');
   Add('a.ValorKG');
   Add('from fabricacao A');
   Add('where a.ID='+idFabricacao);
   Open;
   vIdReceita  :=FieldByName('IdReceita').AsString;
   RealizadoKG :=FieldByName('RealizadoKG').AsString;
   DataFab     :=FormatDateTime('yyyy-mm-dd',FieldByName('Data').AsDateTime);
   Lote        :=FieldByName('Lote').AsString;
   IdUsuario   :=FieldByName('idUsuario').AsString;
   ValorKG     :=StringReplace(FieldByName('ValorKG').AsString,',','.',[rfReplaceAll]);

   Clear;
   Add('insert into carregamento(');
   Add('id');
   Add(',IDRacao');
   Add(',KGFabricado');
   Add(',DataFabricacao');
   Add(',LoteFabricacao');
   Add(',idUsuario,');
   Add('ValorKG,');
   Add('IdVagao');
   Add(')');
   Add('values(');
   Add(':id');
   Add(',:IDRacao');
   Add(',:KGFabricado');
   Add(',:DataFabricacao');
   Add(',:LoteFabricacao');
   Add(',:idUsuario');
   Add(',:ValorKG');
   Add(',:IdVagao');
   Add(')');
   ParamByName('id').AsString             := RetornaIdCarregamento;
   ParamByName('IDRacao').AsString        := vIdReceita;
   ParamByName('KGFabricado').AsString    := RealizadoKG;
   ParamByName('DataFabricacao').AsString := DataFab;
   ParamByName('LoteFabricacao').AsString := Lote;
   ParamByName('idUsuario').AsString      := IdUsuario;
   ParamByName('ValorKG').AsString        := ValorKG;
   ParamByName('IdVagao').AsString        := frmPrincipal.vIdVagao;
   try
    ExecSQL;
    Result := 'OK';
   except
    on E: Exception do
     Result := ('Erro ao Inserir Carregamento:'+E.Message);
   end;
 end;
 vQry.Free;
end;

function Tudb.InsereFabricacao(idRacao, idOperador, trato,
  previsto: string): string;
begin
 Fabricacao.Close;
 Fabricacao.Open;
 Fabricacao.Insert;
 FabricacaoIdReceita.AsString  := idRacao;
 FabricacaoIdOperador.AsString := idOperador;
 FabricacaoIdUsuario.AsString  := vIdUsuario;
 FabricacaoHoraIni.AsDateTime  := now;
 Fabricacaotrato.AsString      := trato;
 FabricacaoPrevKG.AsString     := previsto;
 FabricacaoData.AsDateTime     := date;
 FabricacaoData.AsDateTime     := now;
 FabricacaoCarregada.AsInteger := 0;
 FabricacaoSync.AsInteger      := 0;
 FabricacaoStatus.AsInteger    := 1;
 try
  Fabricacao.ApplyUpdates(-1);
  InsereFabricacaoAlimentos(idRacao,previsto);
  Result :='OK';
 except
  on E: Exception do
    Result :='Erro ao salvar Fabricacao:'+E.Message;
 end;
end;

procedure Tudb.InsereFabricacaoAlimentos(vIdRacao, kgPrevisto: string);
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('INSERT INTO FabricacaoAlimentos(IdFabricacao,IdAlimento,Ordem,PercentToleracia,');
   Add('PrevKG,VALORKG,MS_PREV)');
   Add('select');
   Add('(SELECT MAX(ID) FROM Fabricacao) MaxIDFabricacao,');
   Add('a.idAlimento,');
   Add('a.OrdemFabricacao,');
   Add('a.PercentTolerancia,');
   Add('ROUND(CAST(:kgPrev AS DOUBLE PRECISION)*(CAST(InclusaoMN AS DOUBLE PRECISION)/100))kgPrevisto,');
   Add('VALORKG,');
   Add('MS');
   Add('from RacaoAlimentos a');
   Add('where idRacao=:IDRACAO');
   ParamByName('kgPrev').AsString  := kgPrevisto;
   ParamByName('IDRACAO').AsString := vIdRacao;
   try
    ExecSQL;
   except
    on E: Exception do
      ShowMessage('Erro ao salvar Ingredientes Fabricacao:'+E.Message);
   end;
 end;
 vQry.Free;
end;

procedure Tudb.InsereFornecimento(IDCARREGAMENTO, vDATA, IDCURRAL, TRATO,
  IDRACAOPREV, IDRACAOREAL, KGPREVISTO, KGREALIZADO, HORAINICIO, HORAFIM,
  PESOINICIO, PESOFIM, LOTEFAB, IDUSUARIO, TIPOPREVISTO: string);
begin
 try
   with qryAux,qryAux.SQL do
   begin
     Clear;
     Add('Insert Into Fornecimento(');
     Add('IDCARREGAMENTO,');
     Add('DATA,');
     Add('IDCURRAL,');
     Add('TRATO,');
     Add('IDRACAOPREV,');
     Add('IDRACAOREAL,');
     Add('KGPREVISTO,');
     Add('KGREALIZADO,');
     Add('HORAINICIO,');
     Add('HORAFIM,');
     Add('PESOINICIO,');
     Add('PESOFIM,');
     Add('LOTEFAB,');
     Add('IDUSUARIO,');
     Add('TIPOPREVISTO)');
     Add('VALUES(');
     Add(':IDCARREGAMENTO,');
     Add(':DATA,');
     Add(':IDCURRAL,');
     Add(':TRATO,');
     Add(':IDRACAOPREV,');
     Add(':IDRACAOREAL,');
     Add(':KGPREVISTO,');
     Add(':KGREALIZADO,');
     Add(':HORAINICIO,');
     Add(':HORAFIM,');
     Add(':PESOINICIO,');
     Add(':PESOFIM,');
     Add(':LOTEFAB,');
     Add(':IDUSUARIO,');
     Add(':TIPOPREVISTO)');
     ParamByName('IDCARREGAMENTO').AsString  := IDCARREGAMENTO;
     ParamByName('DATA').AsString            := vDATA;
     ParamByName('IDCURRAL').AsString        := IDCURRAL;
     ParamByName('TRATO').AsString           := TRATO;
     ParamByName('IDRACAOPREV').AsString     := IDRACAOPREV;
     ParamByName('IDRACAOREAL').AsString     := IDRACAOREAL;
     ParamByName('KGPREVISTO').AsString      := KGPREVISTO;
     ParamByName('KGREALIZADO').AsString     := KGREALIZADO;
     ParamByName('HORAINICIO').AsString      := HORAINICIO;
     ParamByName('HORAFIM').AsString         := HORAFIM;
     ParamByName('PESOINICIO').AsString      := PESOINICIO;
     ParamByName('PESOFIM').AsString         := PESOFIM;
     ParamByName('LOTEFAB').AsString         := LOTEFAB;
     ParamByName('IDUSUARIO').AsString       := IDUSUARIO;
     ParamByName('TIPOPREVISTO').AsString    := TIPOPREVISTO;
     try
       qryAux.ExecSQL;
     except
       on E: Exception do
       begin
        ShowMessage('Erro ao Inserir Fornecimento:'+E.Message);
       end;
     end;
   end;
 except
   on E: Exception do
   begin
    ShowMessage('Erro ao Inserir Fornecimento:'+E.Message);
   end;
 end;
end;

function Tudb.ReplicaPrevisto: string;
begin
  if not VerificaPrevistoDias then
  begin
    Result :='Ja existe previsto para o dia!';
    Exit;
  end;
  QReplyPrev.Close;
  QReplyPrev.Open;
  if QReplyPrev.IsEmpty then
   Result :='Sem previsto para Replicar!'
  else
  begin
    while not QReplyPrev.Eof do
    begin
      QReplyPrevI.Close;
      QReplyPrevI.Open;
      QReplyPrevI.Insert;
      QReplyPrevIIDCURRAL.AsString   := QReplyPrevIDCURRAL.AsString;
      QReplyPrevIIDRACAO.AsString    := QReplyPrevIDRACAO.AsString;
      QReplyPrevIDATA.AsDateTime     := date;
      QReplyPrevITRATO.AsString      := QReplyPrevTRATO.AsString;
      QReplyPrevIKGPREVISTO.AsString := QReplyPrevKGPREVISTO.AsString;
      QReplyPrevITIPO.AsInteger      := 2;
      try
       QReplyPrevI.ApplyUpdates(-1);
       QReplyPrev.Next;
      except
       on E: Exception do
       begin
        result:=('Erro ao Replicar Previsto:'+E.Message);
        Break;
       end;
      end;
    end;
    AlteraFlagPrevisto;
    Result:='OK';
  end;
end;

function Tudb.RetornaIdCarregamento: string;
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select max(id) maxId from Carregamento');
   Open;
   if FieldByName('maxId').AsString.Length=0 then
    Result := '1'
   else
    Result := intToStr(FieldByName('maxId').AsInteger+1)
 end;
 vQry.Free;
end;

function Tudb.RetornaLoteFab(vIdCarregamento: string): string;
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from Carregamento');
   Add('where id='+vIdCarregamento);
   Open;
   Result := vQry.FieldByName('LoteFabricacao').AsString;
 end;
 vQry.Free;
end;

function Tudb.RetornaTotalFabCarregamento(vIdCarregamento: string): string;
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from Carregamento');
   Add('where id='+vIdCarregamento);
   Open;
   Result := vQry.FieldByName('KGFabricado').AsString;
 end;
 vQry.Free;
end;


function Tudb.RetornaTempoMisturaRacao(idRacao: string): integer;
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from Racao');
   Add('where id='+idRacao);
   Open;
   Result := vQry.FieldByName('TempoMistura').AsInteger*60;
 end;
 vQry.Free;
end;

function Tudb.RetornaTotalFabricado(vIdFab: string):string;
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select sum(coalesce(RealizadoKG,0))total from FabricacaoAlimentos');
   Add('where IdFabricacao='+vIdFab);
   Open;
   Result :=FieldByName('total').AsString;
 end;
 vQry.Free;
end;

function Tudb.ReturnsIdByName(vTable, Nome: string): string;
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   if vTable='OPERADOR' then
   begin
     Clear;
     Add('SELECT * FROM usuario');
     Add('WHERE Operador=1 and NOME=:NOME');
     ParamByName('NOME').AsString  := Nome;
     try
      Open;
      Result := vQry.FieldByName('id').AsString
     except
      on E: Exception do
        ShowMessage('Erro ao retornar ID:'+E.Message);
     end;
   end
   else
   begin
     Clear;
     Add('SELECT * FROM '+vTable);
     Add('WHERE NOME=:NOME');
     ParamByName('NOME').AsString  := Nome;
     try
      Open;
      Result := vQry.FieldByName('id').AsString
     except
      on E: Exception do
        ShowMessage('Erro ao retornar ID:'+E.Message);
     end;
   end;
 end;
 vQry.Free;
end;


function Tudb.ValidaUsuario(login,senha:string): Boolean;
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('SELECT * FROM usuario');
   Add('WHERE login='+login.QuotedString);
   Add('and   senha='+senha.QuotedString);
   Open;
   vIdUsuario   := vQry.FieldByName('id').AsString;
   vNomeUsuario := vQry.FieldByName('nome').AsString;
   vTipoUsuario := vQry.FieldByName('tipo').AsString;
   Result       := vQry.IsEmpty;
 end;
 vQry.Free;
end;

function Tudb.VerificaCarregamentoAberto: Boolean;
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from carregamento');
   Add('where Status=1');
   Open;
   vIdCarregamento     := FieldByName('id').AsString;
   vIdReceitaCarregada := FieldByName('IDRacao').AsString;
   vIdLoteCarregado    := FieldByName('LoteFabricacao').AsString;
   Result       := vQry.IsEmpty;
 end;
 vQry.Free;
end;

function Tudb.VerificaCarregamentoCarregado: Boolean;
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from carregamento');
   Add('where Status=2');
   Open;
   vIdCarregamento     := FieldByName('id').AsString;
   vIdReceitaCarregada := FieldByName('IDRacao').AsString;
   vIdLoteCarregado    := FieldByName('LoteFabricacao').AsString;
   Result              := vQry.IsEmpty;
 end;
 vQry.Free;
end;

function Tudb.VerificaPrevistoDias: Boolean;
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select max(data) maxData from FornecimentoPrevisto');
   Add('where data=CURRENT_DATE');
   Add('and Status=1');
   Open;
   Result       := vQry.FieldByName('maxData').AsString.Length=0;
 end;
 vQry.Free;
end;

end.
