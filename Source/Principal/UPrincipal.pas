unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ActnList, System.Actions, FMX.TabControl,FireDAC.DApt, FMX.ListBox,
  FMX.Ani, FMX.ScrollBox, FMX.Memo, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client
 {$IF DEFINED(iOS) or DEFINED(ANDROID)}
  ,AndroidApi.helpers,AndroidApi.JNI.JavaTypes,AndroidApi.JNI.GraphicsContentViewText
 {$ENDIF}
 {$IFDEF MSWINDOWS}
  ,Winapi.Windows, FMX.Memo.Types
 {$ENDIF}
  ;

type
  TfrmPrincipal = class(TForm)
    TbPrincipal: TTabControl;
    tbiLogin: TTabItem;
    tbiMnu: TTabItem;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    rect_update: TRectangle;
    Layout2: TLayout;
    Layout1: TLayout;
    img_seta: TImage;
    layInf: TLayout;
    Rectangle4: TRectangle;
    recTop: TRectangle;
    Layout10: TLayout;
    lbl_titulo: TLabel;
    btnClose: TImage;
    laymnu: TLayout;
    Layout11: TLayout;
    Rectangle5: TRectangle;
    Layout12: TLayout;
    Layout13: TLayout;
    imgMnu: TImage;
    layRecMnu: TLayout;
    Rectangle6: TRectangle;
    Layout15: TLayout;
    Layout16: TLayout;
    btnSincronizacao: TRectangle;
    Image2: TImage;
    ShadowEffect4: TShadowEffect;
    Label6: TLabel;
    bntConfiguracao: TRectangle;
    Image3: TImage;
    ShadowEffect7: TShadowEffect;
    Label7: TLabel;
    Layout14: TLayout;
    btnFabricacao: TRectangle;
    Image7: TImage;
    ShadowEffect9: TShadowEffect;
    Label12: TLabel;
    btnFornecimento: TRectangle;
    ShadowEffect5: TShadowEffect;
    Image5: TImage;
    ShadowEffect3: TShadowEffect;
    Label8: TLabel;
    Layout17: TLayout;
    btnGravaTag: TRectangle;
    ShadowEffect6: TShadowEffect;
    Image6: TImage;
    ShadowEffect8: TShadowEffect;
    Label9: TLabel;
    layInfMnu: TLayout;
    Rectangle10: TRectangle;
    recTopMnu: TRectangle;
    layTopmnu: TLayout;
    Label11: TLabel;
    Image4: TImage;
    lblVersao: TLabel;
    lblUsuarioLogado: TLabel;
    tbiConfig: TTabItem;
    Layout18: TLayout;
    Layout19: TLayout;
    Rectangle7: TRectangle;
    Layout20: TLayout;
    Layout21: TLayout;
    Image8: TImage;
    Layout22: TLayout;
    Rectangle8: TRectangle;
    Layout27: TLayout;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Layout28: TLayout;
    Label18: TLabel;
    Image14: TImage;
    StyleBook1: TStyleBook;
    imgAlimentos: TImage;
    imgRec: TImage;
    imgSilo: TImage;
    imgIngrediente: TImage;
    imgFabricacao: TImage;
    ShadowEffect2: TShadowEffect;
    VertScrollBox1: TVertScrollBox;
    Layout23: TLayout;
    Rectangle9: TRectangle;
    Layout24: TLayout;
    Layout25: TLayout;
    Label5: TLabel;
    Label10: TLabel;
    Rectangle11: TRectangle;
    edtIPCLP: TEdit;
    Rectangle12: TRectangle;
    edtPortaCLP: TEdit;
    Rectangle13: TRectangle;
    Layout26: TLayout;
    Layout29: TLayout;
    Label13: TLabel;
    Label17: TLabel;
    Rectangle14: TRectangle;
    cbxTipoOp: TComboBox;
    Rectangle20: TRectangle;
    edtTempoSegundos: TEdit;
    Rectangle17: TRectangle;
    Layout30: TLayout;
    Layout31: TLayout;
    Label14: TLabel;
    Label15: TLabel;
    Rectangle18: TRectangle;
    edtIpServidorDados: TEdit;
    Rectangle19: TRectangle;
    edtPortaServidorDados: TEdit;
    Layout32: TLayout;
    btnConfirmar: TRectangle;
    Image9: TImage;
    ShadowEffect1: TShadowEffect;
    Label16: TLabel;
    Rectangle21: TRectangle;
    Layout33: TLayout;
    Layout34: TLayout;
    Label19: TLabel;
    Rectangle22: TRectangle;
    edtIdVagao: TEdit;
    Rectangle23: TRectangle;
    edtPesoEstavel: TEdit;
    Label20: TLabel;
    tbiSync: TTabItem;
    Rectangle24: TRectangle;
    Layout35: TLayout;
    Label21: TLabel;
    btnFechaSync: TImage;
    laySelectSync: TLayout;
    imgSync: TImage;
    Animacao: TFloatAnimation;
    Rectangle25: TRectangle;
    Layout36: TLayout;
    Rectangle26: TRectangle;
    btnEnviar: TRectangle;
    Image12: TImage;
    ShadowEffect10: TShadowEffect;
    Label22: TLabel;
    btnBaixarDados: TRectangle;
    Image13: TImage;
    ShadowEffect11: TShadowEffect;
    Label23: TLabel;
    memoLog: TMemo;
    BindSourceDB1: TBindSourceDB;
    LinkFillControlToFieldId: TLinkFillControlToField;
    BindingsList1: TBindingsList;
    Layout37: TLayout;
    Rectangle27: TRectangle;
    Rectangle29: TRectangle;
    Image11: TImage;
    ShadowEffect13: TShadowEffect;
    lblFabPendente: TLabel;
    Rectangle28: TRectangle;
    Image10: TImage;
    ShadowEffect12: TShadowEffect;
    lblFornPendente: TLabel;
    imgForn: TImage;
    ShadowEffect14: TShadowEffect;
    llLoginCenterVert: TLayout;
    layloginCenter: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Layout5: TLayout;
    Label1: TLabel;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Rectangle2: TRectangle;
    cbxLogin: TComboBox;
    Layout8: TLayout;
    Layout9: TLayout;
    Label3: TLabel;
    Rectangle3: TRectangle;
    edtSenha: TEdit;
    PasswordEditButton1: TPasswordEditButton;
    Layout38: TLayout;
    btnEntrar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image1: TImage;
    VScroll: TScrollBox;
    ClearEditButton1: TClearEditButton;
    PasswordEditButton2: TPasswordEditButton;
    LinkFillControlToField1: TLinkFillControlToField;
    imgCarrega: TImage;
    ShadowEffect15: TShadowEffect;
    FDQuery1: TFDQuery;
    Label24: TLabel;
    Rectangle34: TRectangle;
    cbxSistema: TComboBox;
    Label25: TLabel;
    Rectangle30: TRectangle;
    cbxLeitor: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure bntConfiguracaoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure bntConfiguracaoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCloseClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure edtLoginKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtLoginExit(Sender: TObject);
    procedure bntConfiguracaoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFabricacaoClick(Sender: TObject);
    procedure edtTempoSegundosKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtPesoEstavelKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtTempoSegundosExit(Sender: TObject);
    procedure edtPesoEstavelExit(Sender: TObject);
    procedure btnBaixarDadosClick(Sender: TObject);
    procedure btnSincronizacaoClick(Sender: TObject);
    procedure btnFechaSyncClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnFornecimentoClick(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure btnGravaTagClick(Sender: TObject);
  private
    foco : TControl;
    procedure MostraMnu;
    {$IF DEFINED(iOS) or DEFINED(ANDROID)}
     function  GetVersaoArq: string;
    {$ENDIF}
    {$IFDEF MSWINDOWS}
     function  GetVersaoArqWin:string;
    {$ENDIF}
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
  public
    HostSrv,PortaSrv,
    HostClp,PortaClp,
    vIdVagao:string;
    vTipoUso,vClose,vLeitor:integer;
    vTipoMsg,vTipoMsgBtn,vMsg:string;//var form msg;
    procedure ShowMsg(vTpMsg,vTpMsgBtn,vTpMsge: string);
    procedure AjustarScroll();
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses UDmDb,UFabricacao, UDmSync, Umsg, UFornecimentoLista, UGravarTag;

procedure TfrmPrincipal.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmPrincipal.ShowMsg(vTpMsg, vTpMsgBtn, vTpMsge: string);
begin
  vClose:=0;
  msg := Tmsg.Create(Self);
  try
    msg.Width    := frmPrincipal.Width-100;
    if vTpMsg='0' then
    begin
     msg.lblMsgHeader.Text   :='Atenção';
     msg.recMsg.Stroke.Color :=  TAlphaColorRec.Yellow;
    end;
    if vTpMsg='1' then
    begin
     msg.lblMsgHeader.Text   :='Erro';
     msg.recMsg.Stroke.Color :=TAlphaColorRec.Red;
    end;
    if vTpMsg='2' then
    begin
     msg.lblMsgHeader.Text   :='Mensagem';
     msg.recMsg.Stroke.Color :=TAlphaColorRec.Green;
    end;
    msg.lblMsgTxt.Text       :=vTpMsge;
    msg.btnCancelar.Visible  :=vTpMsgBtn='1';
    msg.Position := TFormPosition.MainFormCenter;
    msg.ShowModal(procedure(ModalResult: TModalResult)
    begin

    end);
  finally
    msg.free;
  end;
end;

procedure TfrmPrincipal.AjustarScroll;
var
 x : integer;
begin
  with frmPrincipal do
  begin
    VScroll.Margins.Bottom := 250;
    VScroll.ViewportPosition := PointF(VScroll.ViewportPosition.X,
     TControl(foco).Position.Y - 90);
  end;
end;

procedure TfrmPrincipal.bntConfiguracaoClick(Sender: TObject);
begin
 if udb.vTipoUsuario<>'1' then
 begin
   ShowMsg('0','0','Usuário sem permissão!!');
   Exit;
 end
 else
 begin
   udb.Config.Close;
   udb.Config.Open;
   edtPesoEstavel.Text         := udb.ConfigPesoEstavelBalanca.AsString;
   edtPortaCLP.Text            := udb.ConfigPortaCLP.AsString;
   edtIPCLP.Text               := udb.ConfigIPClp.AsString;
   edtIpServidorDados.Text     := udb.ConfigIpServ.AsString;
   edtPortaServidorDados.Text  := udb.ConfigPortaServ.AsString;
   cbxTipoOp.ItemIndex         := udb.ConfigTipoOperacao.AsInteger;
   edtTempoSegundos.Text       := udb.ConfigTempoPularIngrediente.AsString;
   edtIdVagao.Text             := udb.ConfigidVagao.AsString;
   cbxSistema.ItemIndex        := udb.ConfigSistema.AsInteger;
   cbxLeitor.ItemIndex         := udb.Configleitor.AsInteger;
   MudarAba(tbiConfig,sender);
 end;
end;

procedure TfrmPrincipal.bntConfiguracaoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 (Sender as TRectangle).Opacity :=0.5;
end;

procedure TfrmPrincipal.bntConfiguracaoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  (Sender as TRectangle).Opacity :=1;
end;

procedure TfrmPrincipal.btnBaixarDadosClick(Sender: TObject);
begin
 memoLog.Lines.Clear;
 memoLog.Lines.Add('Iniciando Sincronismo: '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
 udb.Config.Close;
 udb.Config.Open;
 if dmSync.TestaServidorField='Erro' then
 begin
  ShowMsg('0','0','Servidor indisponível, confira se está conectado na rede!');
  Exit;
 end
 else
 Animacao.Start;
 TThread.CreateAnonymousThread(procedure
 begin
   if udb.ConfigSistema.AsInteger=1 then
   begin
    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Baixando Usuarios '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
    end);
    memoLog.Lines.Add(dmSync.GetUsuarios);

    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Baixando Insumos '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
    end);
    memoLog.Lines.Add(dmSync.GetAlimentos);

    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Baixando Currais '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
    end);
    memoLog.Lines.Add(dmSync.GetCurrais);

    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Baixando Rações '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
    end);
    memoLog.Lines.Add(dmSync.GetRacao);

    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Baixando Fornecimento Previsto '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
    end);
    memoLog.Lines.Add(dmSync.GetFornecimentoPrevisao);

    //fim
    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Dados Baixado com sucesso! '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
     Animacao.Stop;
    end);
   end;//Field Confinamento
   if udb.ConfigSistema.AsInteger=2 then
   begin
    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Testando Servidor '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
    end);
    memoLog.Lines.Add(dmSync.TestaServidorField);

    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Baixando Usuarios '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
    end);
    memoLog.Lines.Add(dmSync.GetUsuariosTGC);

    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Baixando Insumos '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
    end);
    memoLog.Lines.Add(dmSync.GetAlimentosTGC);

    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Baixando Currais '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
    end);
    memoLog.Lines.Add(dmSync.GetCurraisTGC);

    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Baixando Rações '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
    end);
    memoLog.Lines.Add(dmSync.GetRacaoTGC);

    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Baixando Fornecimento Previsto '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
    end);
    memoLog.Lines.Add(dmSync.GetFornecimentoPrevisaoTGC);

    //fim
    TThread.Synchronize(nil, procedure
    begin
     memoLog.Lines.Add('Dados Baixado com sucesso! '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
     Animacao.Stop;
     ShowMsg('0','0','Dados Baixados com Sucesso!!');
    end);
   end;//Field Confinamento
 end).start;
end;



procedure TfrmPrincipal.btnCloseClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TfrmPrincipal.btnConfirmarClick(Sender: TObject);
begin
 if cbxSistema.ItemIndex =-1 then
 begin
   ShowMsg('0','0','Informe o SISTEMA!!');
   Exit;
 end;
 if edtPortaCLP.Text.Length=0 then
 begin
   ShowMsg('0','0','Informe a Porta da CLP!!');
   Exit;
 end;
 if edtIPCLP.Text.Length=0 then
 begin
   ShowMsg('0','0','Informe o IP da CLP!!');
   Exit;
 end;
 if edtPortaServidorDados.Text.Length=0 then
 begin
   ShowMsg('0','0','Informe a Porta da Servido de Dados!!');
   Exit;
 end;
 if edtIpServidorDados.Text.Length=0 then
 begin
   ShowMsg('0','0','Informe o IP da Servido de Dados!!');
   Exit;
 end;
 vLeitor                                   := cbxLeitor.ItemIndex;
 vTipoUso                                  := cbxTipoOp.ItemIndex;
 udb.Config.Edit;
 udb.ConfigPortaCLP.AsString               := edtPortaCLP.Text;
 udb.ConfigIPClp.AsString                  := edtIPCLP.Text;
 udb.ConfigIpServ.AsString                 := edtIpServidorDados.Text;
 udb.ConfigPortaServ.AsString              := edtPortaServidorDados.Text;
 udb.ConfigTipoOperacao.AsInteger          := cbxTipoOp.ItemIndex;
 udb.ConfigTempoPularIngrediente.AsString  := edtTempoSegundos.Text;
 udb.ConfigidVagao.AsString                := edtIdVagao.Text;
 udb.ConfigPesoEstavelBalanca.AsString     := edtPesoEstavel.Text;
 udb.ConfigSistema.AsInteger               := cbxSistema.ItemIndex;
 udb.Configleitor.AsInteger                := cbxLeitor.ItemIndex;
 try
  udb.Config.ApplyUpdates(-1);
  vTipoUso := udb.ConfigTipoOperacao.AsInteger;
   case vTipoUso of
   0:begin//Rotormix
     btnFornecimento.Enabled := True;
     btnFabricacao.Enabled   := True;
    end;
   1:begin//Estacionario
     btnFornecimento.Enabled := false;
     btnFabricacao.Enabled   := True;
    end;
   2:begin//Distribuidor
     btnFornecimento.Enabled := true;
     btnFabricacao.Enabled   := false;
    end;
  end;
  MudarAba(tbiMnu,sender);
 except
  on E : Exception do
   ShowMsg('1','0','Erro ao salvar Configuração: '+e.Message);
 end;
end;

procedure TfrmPrincipal.btnEntrarClick(Sender: TObject);
begin
   if cbxLogin.ItemIndex=-1 then
   begin
     ShowMsg('0','0','Informe o login!!');
     Exit;
   end;
   if edtSenha.Text.Length =0 then
   begin
     ShowMsg('0','0','Informe a Senha!!');
     Exit;
   end;
   if udb.ValidaUsuario(cbxLogin.Selected.Text,edtSenha.Text)then
   begin
    ShowMsg('1','0','Usuario ou senha Invalidos!!');
    Exit;
   end
   else
   begin
    udb.Config.Close;
    udb.Config.Open();
    if udb.ConfigidVagao.AsString.Length>0 then
    begin
     vIdVagao := udb.ConfigidVagao.AsString;
    end;
    vTipoUso := udb.ConfigTipoOperacao.AsInteger;
    case vTipoUso of
    0:begin//Rotormix
      btnFornecimento.Enabled := True;
      btnFabricacao.Enabled   := True;
     end;
    1:begin//Estacionario
      btnFornecimento.Enabled := false;
      btnFabricacao.Enabled   := True;
     end;
    2:begin//Distribuidor
      btnFornecimento.Enabled := true;
      btnFabricacao.Enabled   := false;
     end;
    end;
    lblUsuarioLogado.Text := udb.vNomeUsuario;
    MostraMnu;
    MudarAba(tbiMnu,Sender);
   end;
end;

procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
begin
 memoLog.Lines.Clear;
 memoLog.Lines.Add('Iniciando Sincronismo: '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
 udb.Config.Close;
 udb.Config.Open;
 if udb.ConfigPortaServ.Text.Length=0 then
 begin
   ShowMsg('0','0','Informe a Porta da Servido de Dados!!');
   Exit;
 end;
 PortaSrv := udb.ConfigPortaServ.Text;
 if udb.ConfigIpServ.Text.Length=0 then
 begin
   ShowMsg('0','0','Informe o IP da Servido de Dados!!');
   Exit;
 end;
 HostSrv :=udb.ConfigIpServ.Text;
 if dmSync.TestaServidorField='Erro' THEN
 begin
    TThread.Synchronize(nil, procedure
    begin
     ShowMsg('1','0','Erro ao se conectar com servidor!!');
     Animacao.Stop;
     Exit;
    end);
 end
 else
  dmSync.SyncFabricacao;
  dmSync.SyncFabricacaoInsumos;
  dmSync.SyncFornecimento;
//  TThread.Synchronize(nil, procedure
//  begin
//   memoLog.Lines.Add('Conectando com Sucesso '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
//  end);
//  Animacao.Start;
//  TThread.CreateAnonymousThread(procedure
//  begin
//   TThread.Synchronize(nil, procedure
//   begin
//    memoLog.Lines.Add('Conectando com Servidor '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
//   end);
//    //Post TGC
//     TThread.Synchronize(nil, procedure
//     begin
//      memoLog.Lines.Add('Enviando Fabricação '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
//     end);
//     memoLog.Lines.Add(dmSync.PostFabricacaoTGC);
//
//     TThread.Synchronize(nil, procedure
//     begin
//      memoLog.Lines.Add('Enviando Fornecimento '+FormatDateTime('dd/mm/yyyy hh:mm:ss',now));
//     end);
//     memoLog.Lines.Add(dmSync.PostFornecimentoTGC);
//   //Post TGC Fim
     TThread.Synchronize(nil, procedure
     begin
      ShowMsg('2','0','Dados Enviados com Sucesso!');
      dmSync.Fabricacao.Close;
      dmSync.Fabricacao.Open;
      lblFabPendente.Text := intToStr(dmSync.Fabricacao.RecordCount);

      dmSync.Fornecimento.Close;
      dmSync.Fornecimento.Open;
      lblFornPendente.Text := intToStr(dmSync.Fornecimento.RecordCount);
      Animacao.Stop;
     end);
//  end).Start;
end;

procedure TfrmPrincipal.btnFabricacaoClick(Sender: TObject);
begin
 udb.Config.Close;
 udb.Config.Open;
  if udb.ConfigPortaServ.Text.Length=0 then
  begin
    ShowMsg('0','0','Informe a Porta da Servido de Dados!!');
    Exit;
  end;
  PortaSrv := udb.ConfigPortaServ.Text;
  if udb.ConfigIpServ.Text.Length=0 then
  begin
    ShowMsg('0','0','Informe o IP da Servido de Dados!!');
    Exit;
  end;
  HostSrv :=udb.ConfigIpServ.Text;
  frmFabricacao := TfrmFabricacao.Create(Self);
  try
    frmFabricacao.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmFabricacao.free;
  end;
end;

procedure TfrmPrincipal.btnFechaSyncClick(Sender: TObject);
begin
 MudarAba(tbiMnu,Sender);
end;

procedure TfrmPrincipal.btnFornecimentoClick(Sender: TObject);
begin
  udb.Config.Close;
  udb.Config.Open;
  if udb.ConfigPortaServ.Text.Length=0 then
  begin
    ShowMsg('0','0','Informe a Porta da Servido de Dados!!');
    Exit;
  end;
  PortaSrv := udb.ConfigPortaServ.Text;
  if udb.ConfigIpServ.Text.Length=0 then
  begin
    ShowMsg('0','0','Informe o IP da Servido de Dados!!');
    Exit;
  end;
  HostSrv :=udb.ConfigIpServ.Text;
  frmFornLista := TfrmFornLista.Create(Self);
  try
    frmFornLista.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmFornLista.free;
  end;
end;

procedure TfrmPrincipal.btnGravaTagClick(Sender: TObject);
begin
 udb.Config.Close;
 udb.Config.Open;
  if udb.ConfigPortaCLP.Text.Length=0 then
  begin
    ShowMsg('0','0','Informe a Porta da CLP!!');
    Exit;
  end;
  PortaClp := udb.ConfigPortaCLP.AsString;
  if udb.ConfigIpServ.Text.Length=0 then
  begin
    ShowMsg('0','0','Informe o IP do CLP!!');
    Exit;
  end;
  HostClp :=udb.ConfigIPClp.AsString;
  frmGravaTag := TfrmGravaTag.Create(Self);
  try
    frmGravaTag.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
   frmGravaTag.free;
end;
end;

procedure TfrmPrincipal.btnSincronizacaoClick(Sender: TObject);
begin
 memoLog.Lines.Clear;
 if udb.ConfigIpServ.AsString.Length=0 then
  begin
    ShowMsg('0','0','Informe o ip do servidor nas configurações');
    Exit;
  end
  else
    dmSync.Host := udb.ConfigIpServ.AsString;
  if udb.ConfigPortaServ.AsString.Length=0 then
  begin
    ShowMsg('0','0','Informe a porta do servidor nas configurações');
    Exit;
  end
  else
    dmSync.Porta := udb.ConfigPortaServ.AsString;

 dmSync.Fabricacao.Close;
 dmSync.Fabricacao.Open;
 lblFabPendente.Text := intToStr(dmSync.Fabricacao.RecordCount);

 dmSync.Fornecimento.Close;
 dmSync.Fornecimento.Open;
 lblFornPendente.Text := intToStr(dmSync.Fornecimento.RecordCount);
 MudarAba(tbiSync,sender);
end;

procedure TfrmPrincipal.edtLoginExit(Sender: TObject);
begin
   TThread.CreateAnonymousThread(procedure
   begin
     TThread.Synchronize(nil, procedure
     begin
       edtSenha.SetFocus;
     end);
   end).Start;
end;

procedure TfrmPrincipal.edtLoginKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  btnEntrarClick(sender);
end;

procedure TfrmPrincipal.edtPesoEstavelExit(Sender: TObject);
begin
 if (edtPesoEstavel.Text.Length>0) then
  if StrToInt(edtPesoEstavel.Text)<10 then
  begin
    ShowMsg('1','0','Peso minimo aceitavel é 10kg');
    edtPesoEstavel.Text :='10';
  end
end;

procedure TfrmPrincipal.edtPesoEstavelKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if not (keyChar in ['0'..'9',','])
 and (ord(keychar)<>8) and (keychar<>#0)then
 begin
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   Beep;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
   Beep(1,100);
  {$ENDIF}
  KeyChar := #0;
 end;
end;

{$IF DEFINED(iOS) or DEFINED(ANDROID)}
function TfrmPrincipal.GetVersaoArq: string;
var
 PKGInfo:JPackageInfo;
begin
 PKGInfo := SharedActivity.getPackageManager.getPackageInfo(
   SharedActivity.getPackageName,0);
 result := JStringToString(PKGInfo.VersionName)
end;
{$ENDIF}

procedure TfrmPrincipal.edtSenhaEnter(Sender: TObject);
begin
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
    foco := TControl(TEdit(sender).Parent);
    AjustarScroll();
  {$ENDIF}
end;

procedure TfrmPrincipal.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  btnEntrarClick(sender);
end;

procedure TfrmPrincipal.edtTempoSegundosExit(Sender: TObject);
begin
 if edtTempoSegundos.Text.Length=0 then
  edtTempoSegundos.Text:='0';
end;

procedure TfrmPrincipal.edtTempoSegundosKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if not (keyChar in ['0'..'9',','])
 and (ord(keychar)<>8) and (keychar<>#0)then
 begin
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   Beep;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
   Beep(1,100);
  {$ENDIF}
  KeyChar := #0;
 end;
end;



procedure TfrmPrincipal.MostraMnu;
begin
  imgMnu.Position.Y            := 0;
  imgMnu.Opacity               := 0;
  layInfMnu.Opacity            := 0;
  recTopMnu.Opacity            := 0;
  layRecMnu.Opacity            := 0;
  btnSincronizacao.Opacity     := 0;
  btnFabricacao.Opacity        := 0;
  btnFornecimento.Opacity      := 0;
  btnGravaTag.Opacity          := 0;

  layloginCenter.Opacity := 0;
  layRecMnu.BringToFront;
  layRecMnu.AnimateFloat('Margins.Top', 10, 0.8, TAnimationType.InOut, TInterpolationType.Circular);
  imgMnu.AnimateFloatDelay('Position.Y', 50, 0.5, 1, TAnimationType.Out, TInterpolationType.Back);
  imgMnu.AnimateFloatDelay('Opacity', 1, 0.4, 0.9);
  recTopMnu.AnimateFloatDelay('Opacity', 1, 0.7, 1);
  layInfMnu.AnimateFloatDelay('Opacity', 1, 0.7, 1.3);
  layRecMnu.AnimateFloatDelay('Opacity', 1,0.7, 1.5);

  btnSincronizacao.AnimateFloatDelay('Opacity', 1,0.7,1.7);
  btnFabricacao.AnimateFloatDelay('Opacity', 1,0.7,2.3);
  btnFornecimento.AnimateFloatDelay('Opacity', 1,0.7,2.7);
  btnGravaTag.AnimateFloatDelay('Opacity', 1,0.7, 3.10);

end;


procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Position := TFormPosition.DesktopCenter;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 udb.Usuario.Close;
 udb.Usuario.Open;
 udb.Config.Close;
 udb.Config.Open;
 vLeitor   := udb.Configleitor.AsInteger;
 TThread.CreateAnonymousThread(procedure
 begin
   TThread.Synchronize(nil,procedure
   begin
      {$IFDEF MSWINDOWS}
        lblversao.text                 := GetVersaoArqWin;
        btnSincronizacao.Width         := (frmPrincipal.Width/2)-40;
        btnFabricacao.Width            := (frmPrincipal.Width/2)-40;
        btnFornecimento.Width          := (frmPrincipal.Width/2)-40;
        bntConfiguracao.Width          := (frmPrincipal.Width/2)-40;
        layloginCenter.Width           :=  frmPrincipal.Width - 400;
      {$ENDIF}
      {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        lblversao.text                 := GetVersaoArq;
        btnSincronizacao.Width         := (frmPrincipal.Width/2)-40;
        btnFabricacao.Width            := (frmPrincipal.Width/2)-40;
        btnFornecimento.Width          := (frmPrincipal.Width/2)-40;
        bntConfiguracao.Width          := (frmPrincipal.Width/2)-40;
      {$ENDIF}
      udb.CreateTablesVersao(lblversao.text);
      TbPrincipal.TabPosition := TTabPosition.None;
      TbPrincipal.ActiveTab   := tbiLogin;
      rect_update.Visible := true;
      img_seta.Position.Y := 0;
      img_seta.Opacity := 0;
      layInf.Opacity := 0;
      recTop.Opacity := 0;

      layloginCenter.Opacity := 0;
      rect_update.BringToFront;
      rect_update.AnimateFloat('Margins.Top', 0, 0.8, TAnimationType.InOut, TInterpolationType.Circular);
      img_seta.AnimateFloatDelay('Position.Y', 50, 0.5, 1, TAnimationType.Out, TInterpolationType.Back);
      img_seta.AnimateFloatDelay('Opacity', 1, 0.4, 0.9);
      recTop.AnimateFloatDelay('Opacity', 1, 0.7, 1);
      layInf.AnimateFloatDelay('Opacity', 1, 0.7, 1.3);
      layloginCenter.AnimateFloatDelay('Opacity', 1,0.7, 2);
   end);
 end).Start;
end;
procedure TfrmPrincipal.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
 VScroll.Margins.Bottom := 0;
end;




{$IFDEF MSWINDOWS}
function TfrmPrincipal.GetVersaoArqWin: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(
  ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,
  VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),
  VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;
{$ENDIF}
procedure TfrmPrincipal.Image4Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
