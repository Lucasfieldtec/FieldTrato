unit UFornecimentoLista;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Effects, FMX.StdCtrls, FMX.Edit, FMX.Objects,
  FMX.Controls.Presentation, FMX.Layouts, FMX.TabControl,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,System.Threading,
  FMX.ActnList, System.Actions, FMX.ListBox, FMX.DateTimeCtrls,IdContext,IdGlobal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.EditBox, FMX.NumberBox, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, ncSockets;
type
  TfrmFornLista = class(TForm)
    TbPrincipal: TTabControl;
    tbiLista: TTabItem;
    rect_update: TRectangle;
    Layout2: TLayout;
    Layout1: TLayout;
    img_seta: TImage;
    layloginCenter: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Layout5: TLayout;
    Rectangle2: TRectangle;
    edtFData: TDateEdit;
    Rectangle3: TRectangle;
    cbxRacaoF: TComboBox;
    Rectangle23: TRectangle;
    Rectangle24: TRectangle;
    Layout6: TLayout;
    Layout8: TLayout;
    Rectangle25: TRectangle;
    Layout7: TLayout;
    Label20: TLabel;
    lblCoutFabricacao: TLabel;
    btnNovoForn: TRectangle;
    Image1: TImage;
    ShadowEffect2: TShadowEffect;
    Label4: TLabel;
    Rectangle26: TRectangle;
    Layout9: TLayout;
    Label21: TLabel;
    lblTotalReal: TLabel;
    Rectangle27: TRectangle;
    Layout35: TLayout;
    Label23: TLabel;
    lblTotalPrev: TLabel;
    Rectangle28: TRectangle;
    Layout36: TLayout;
    ListaFornecimento: TListView;
    layInf: TLayout;
    Rectangle4: TRectangle;
    recTop: TRectangle;
    Layout10: TLayout;
    lbl_titulo: TLabel;
    btnClose: TImage;
    LayIngredientes: TLayout;
    recIngredientes: TRectangle;
    Rectangle29: TRectangle;
    Layout37: TLayout;
    Label25: TLabel;
    btnFechaIngrediente: TImage;
    Layout38: TLayout;
    Rectangle30: TRectangle;
    ListaFabricacaoIngrediente: TListView;
    Image13: TImage;
    Image15: TImage;
    Image16: TImage;
    tbiCad: TTabItem;
    laymnu: TLayout;
    Layout11: TLayout;
    Rectangle5: TRectangle;
    StyleBook1: TStyleBook;
    cbxTratoF: TComboBox;
    Label5: TLabel;
    Rectangle9: TRectangle;
    edtLinhaF: TEdit;
    layBase: TLayout;
    Rectangle10: TRectangle;
    Layout13: TLayout;
    Layout14: TLayout;
    Rectangle7: TRectangle;
    Layout15: TLayout;
    Layout16: TLayout;
    Rectangle8: TRectangle;
    lblRac: TLabel;
    lblRacaoCad: TLabel;
    Label7: TLabel;
    lblTratoCad: TLabel;
    Rectangle22: TRectangle;
    Label8: TLabel;
    Layout21: TLayout;
    btnDisconected: TImage;
    btnConneted: TImage;
    Layout17: TLayout;
    Rectangle11: TRectangle;
    lblCurralForn: TLabel;
    Layout18: TLayout;
    Layout19: TLayout;
    lblRealizado: TLabel;
    RecPrevisto: TRectangle;
    RecRealizado: TRectangle;
    ProgressBarField: TLayout;
    Rectangle12: TRectangle;
    Track: TRectangle;
    lblPercent: TLabel;
    tbiCarregamento: TTabItem;
    Layout20: TLayout;
    Layout22: TLayout;
    Rectangle14: TRectangle;
    Layout23: TLayout;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Layout24: TLayout;
    Label11: TLabel;
    Image3: TImage;
    Layout25: TLayout;
    Layout26: TLayout;
    Rectangle17: TRectangle;
    Layout27: TLayout;
    Layout30: TLayout;
    Rectangle20: TRectangle;
    Layout31: TLayout;
    Layout32: TLayout;
    lblTotalFab: TLabel;
    lblTotalCarr: TLabel;
    recTotalFabricado: TRectangle;
    recTotalCarregado: TRectangle;
    Layout34: TLayout;
    Rectangle34: TRectangle;
    Layout29: TLayout;
    Image4: TImage;
    Image6: TImage;
    Rectangle19: TRectangle;
    Label17: TLabel;
    Label12: TLabel;
    btnCarrFornecer: TRectangle;
    Image7: TImage;
    ShadowEffect1: TShadowEffect;
    Label14: TLabel;
    Rectangle32: TRectangle;
    cbxCarregamento: TComboBox;
    Layout28: TLayout;
    Rectangle33: TRectangle;
    Label15: TLabel;
    lblLoteFab: TLabel;
    layTratoSelect: TLayout;
    Rectangle35: TRectangle;
    Û: TLayout;
    Layout39: TLayout;
    Rectangle36: TRectangle;
    cbxTrato: TComboBox;
    Rectangle37: TRectangle;
    Image8: TImage;
    ShadowEffect3: TShadowEffect;
    Label18: TLabel;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    btnFechaForn: TImage;
    listaCadFornecimento: TListView;
    StyleBook2: TStyleBook;
    Rectangle38: TRectangle;
    Layout43: TLayout;
    Image9: TImage;
    RecControles: TRectangle;
    Layout40: TLayout;
    btnFinalizaCarregamento: TRectangle;
    Image5: TImage;
    ShadowEffect4: TShadowEffect;
    lblFinalizaCarregamengo: TLabel;
    btnIniciarLeitura: TRectangle;
    Image10: TImage;
    ShadowEffect5: TShadowEffect;
    lblIniciaLeitura: TLabel;
    TTag: TFDQuery;
    lblTextPromt: TLabel;
    btnReplicaPrev: TRectangle;
    Image2: TImage;
    ShadowEffect6: TShadowEffect;
    Label6: TLabel;
    Layout12: TLayout;
    Layout41: TLayout;
    Rectangle39: TRectangle;
    Layout42: TLayout;
    Label27: TLabel;
    lblRealizadoCad: TLabel;
    Rectangle40: TRectangle;
    Layout44: TLayout;
    Label29: TLabel;
    lblPrevistoCad: TLabel;
    edtPrevisto: TNumberBox;
    edtRealizado: TNumberBox;
    edtPesoBalanca: TNumberBox;
    Layout33: TLayout;
    Label16: TLabel;
    btnFechaSelectTrato: TImage;
    Rectangle6: TRectangle;
    Layout45: TLayout;
    Label9: TLabel;
    lblDiferecaCad: TLabel;
    btnCarrInicia: TRectangle;
    Image11: TImage;
    ShadowEffect7: TShadowEffect;
    Label10: TLabel;
    edtPesoCarregado: TNumberBox;
    edtPesoFabricado: TNumberBox;
    edtPesoCarregando: TNumberBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    Layout46: TLayout;
    Label13: TLabel;
    lblPrevisto: TLabel;
    lblTagLida: TLabel;
    ncTCPClient1: TncTCPClient;
    Label19: TLabel;
    lblPesoIni: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cbxRacaoFChange(Sender: TObject);
    procedure cbxTratoFChange(Sender: TObject);
    procedure edtFDataChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnNovoFornClick(Sender: TObject);
    procedure Rectangle37Click(Sender: TObject);
    procedure btnIniciarLeituraClick(Sender: TObject);
    procedure btnFechaFornClick(Sender: TObject);
    procedure btnDisconectedClick(Sender: TObject);
    procedure edtRealizadoChangeTracking(Sender: TObject);
    procedure edtPesoBalancaChangeTracking(Sender: TObject);
    procedure btnFinalizaCarregamentoClick(Sender: TObject);
    procedure edtLinhaFChangeTracking(Sender: TObject);
    procedure cbxTratoChange(Sender: TObject);
    procedure btnReplicaPrevClick(Sender: TObject);
    procedure btnFechaSelectTratoClick(Sender: TObject);
    procedure btnCarrIniciaClick(Sender: TObject);
    procedure btnCarrFornecerClick(Sender: TObject);
    procedure cbxCarregamentoChange(Sender: TObject);
    procedure edtPesoCarregandoChangeTracking(Sender: TObject);
    procedure btnCarrIniciaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCarrIniciaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCarrFornecerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCarrFornecerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnConnetedClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ncTCPClient1ReadData(Sender: TObject; aLine: TncLine;
      const aBuf: TArray<System.Byte>; aBufCount: Integer);
    procedure ncTCPClient1Connected(Sender: TObject; aLine: TncLine);
    procedure ncTCPClient1Disconnected(Sender: TObject; aLine: TncLine);
    procedure ncTCPClient1Reconnected(Sender: TObject; aLine: TncLine);
  private
    { Private declarations}
    vHoraIni,vHoraFim:TTime;
    TaskCLP : ITask;
    vBoolPesoIn,vIniForn:Boolean;
    vPesoInicio,
    vPesoRealizado,vPesoRealIni,vPesoIniCarregamento,vPesoFimCarregamento:Double;
    vCarregando,vIniciaLeitura,vIniciaCarrega:integer;
    vHost,vPorta,vTipoPrev,vIdCurralForn,vIdCurral,vIdCarregamento,
    vString,vTagInicio,vTagFim,vTagLida:string;
    vIniciaForn :integer;
    BTagIni,BTagFim:Boolean;
    vPesoCLP :Double;
    function  CarregaComboCarregamento:boolean;
    procedure Connectclp(host,port:string);//clp
    procedure AbreQryTag;
    function  Busca(texto: string; posicao: integer): string;
    function  ConsultaListaPrevisto(Atag: string): Boolean;
  public
    vStartStopTHreadCLP : Boolean;
    procedure GeraLista(vFiltro: string);
    procedure GeraListaCadFornecimento(vIdRacao,Trato: string);
    procedure CarregaComboFiltro;
    procedure FiltroLista;
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    function  ConsultaTag(vTag:string):Boolean;

  end;

var
  frmFornLista: TfrmFornLista;

implementation

{$R *.fmx}

uses UDmDb, UDmSync, Umsg, UPrincipal;

{ TfrmFornLista }

procedure TfrmFornLista.AbreQryTag;
begin
 if frmPrincipal.vLeitor=0 then
 begin
  with TTag,TTag.sql do
  begin
   Clear;
   Add('select ID,LINHA,NUMERO,NOME,ORDEM,STATUS,');
   Add('(replace(TAG_INICIO,''H'',''''))TAG_INICIO,');
   Add('(replace(TAG_FIM,''H'',''''))TAG_FIM');
   Add('from Currais A');
   Add('where STATUS=1 AND TAG_INICIO is not null and TAG_INICIO <>'+QuotedStr(''));
   TTag.sql.Text;
   Open;
  end;
 end
 else
 begin
  with TTag,TTag.sql do
  begin
   Clear;
   Add('select * from Currais');
   Add('where status=1 and TAG_INICIO is not null and TAG_INICIO<>''''');
   Open;
  end;
 end;
end;

procedure TfrmFornLista.btnCarrFornecerClick(Sender: TObject);
begin
 udb.AtualizaCarregamento(FloatToStr(vPesoIniCarregamento),edtPesoCarregando.Text,edtPesoCarregado.Text,
  vIdCarregamento);
 vIniciaCarrega           := 0;
 vCarregando              := 0;
 MudarAba(tbiCad,sender);
end;

procedure TfrmFornLista.btnCarrFornecerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
   (Sender as TRectangle).Opacity :=0.5;
end;

procedure TfrmFornLista.btnCarrFornecerMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
   (Sender as TRectangle).Opacity :=1;
end;

procedure TfrmFornLista.btnCarrIniciaClick(Sender: TObject);
begin
  vIniciaCarrega           := 1;
  vPesoIniCarregamento := edtPesoCarregando.Value;
end;

procedure TfrmFornLista.btnCarrIniciaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  (Sender as TRectangle).Opacity :=0.5;
end;

procedure TfrmFornLista.btnCarrIniciaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 (Sender as TRectangle).Opacity :=1;
end;

procedure TfrmFornLista.btnCloseClick(Sender: TObject);
begin
    if TbPrincipal.TabIndex=0 then
     Close
    else
    {$IFDEF MSWINDOWS}
      frmPrincipal.ShowMsg('0','1','Desja sair da tela de Fornecimento?');
      case udb.vMsgConfirm of
       1:begin
        vStartStopTHreadCLP    := false;
        if TaskCLP <> nil then
         if TaskCLP.Status <> TTaskStatus.Canceled then
          TaskCLP.Cancel;
          if ncTCPClient1.Active then
          begin
           ncTCPClient1.Active := false;
          end;
          close;
         end;
       0:begin
         end;
      end;
     {$ENDIF}
     {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        MessageDlg('Deseja Realmente Sair da tela de Fornecimento?', System.UITypes.TMsgDlgType.mtInformation,
        [System.UITypes.TMsgDlgBtn.mbYes,
        System.UITypes.TMsgDlgBtn.mbNo
        ], 0,
        procedure(const AResult: System.UITypes.TModalResult)
        begin
          case AResult of
           mrYES:
             begin
              vStartStopTHreadCLP    := false;
              if ncTCPClient1.Active then
               ncTCPClient1.Active:=false;
              close;
             end;
           mrNo:

           end;
         end);
     {$ENDIF}
end;

procedure TfrmFornLista.btnConnetedClick(Sender: TObject);
begin
  vStartStopTHreadCLP    := true;
  Connectclp(vHost,vPorta);
end;

procedure TfrmFornLista.btnDisconectedClick(Sender: TObject);
begin
  vStartStopTHreadCLP    := true;
  Connectclp(vHost,vPorta);
end;

procedure TfrmFornLista.btnFechaFornClick(Sender: TObject);
begin
 if (vIniciaForn=1) and (edtRealizado.Value>0) then
 begin
   vHoraFim    := now;
   udb.InsereFornecimento(
    udb.vIdCarregamento,
    FormatDateTime('yyyy-mm-dd',date),
    vIDCURRAL,
    lblTratoCad.Text,
    udb.vIdReceitaCarregada,
    udb.vIdReceitaCarregada,
    edtPrevisto.Text,
    intToStr(trunc(vPesoInicio-vPesoCLP)),
    TimeToStr(vHoraIni),
    TimeToStr(vHoraFim),
    FloatToStr(vPesoInicio),
    FloatToStr(vPesoCLP),
    udb.vIdLoteCarregado,
    udb.vIdUsuario,
    vTipoPrev);
 end;
   vIniciaLeitura   := 0;
   {$IFDEF MSWINDOWS}
    frmPrincipal.ShowMsg('0','1','Desja sair da tela de Fornecimento?');
    case udb.vMsgConfirm of
     1:begin
      vStartStopTHreadCLP    := false;
      if TaskCLP <> nil then
       if TaskCLP.Status <> TTaskStatus.Canceled then
        TaskCLP.Cancel;
        if ncTCPClient1.Active then
        begin
         ncTCPClient1.Active := false;
        end;
        close;
       end;
     0:begin

       end;
    end;
   {$ENDIF}
   {$IF DEFINED(iOS) or DEFINED(ANDROID)}
      MessageDlg('Deseja Realmente Sair da tela de Fornecimento?', System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbYes,
      System.UITypes.TMsgDlgBtn.mbNo
      ], 0,
      procedure(const AResult: System.UITypes.TModalResult)
      begin
        case AResult of
         mrYES:
           begin
            vStartStopTHreadCLP    := false;
            if ncTCPClient1.Active then
             ncTCPClient1.Active := false;
            close;
           end;
         mrNo:
        end;
       end);
   {$ENDIF}
end;

procedure TfrmFornLista.btnFechaSelectTratoClick(Sender: TObject);
begin
 layTratoSelect.Visible := false;
end;

procedure TfrmFornLista.btnFinalizaCarregamentoClick(Sender: TObject);
begin
 if (vIniciaForn=1) and (edtRealizado.Value>0) then
 begin
   vHoraFim    := now;
   udb.InsereFornecimento(
    udb.vIdCarregamento,
    FormatDateTime('yyyy-mm-dd',date),
    vIDCURRAL,
    lblTratoCad.Text,
    udb.vIdReceitaCarregada,
    udb.vIdReceitaCarregada,
    edtPrevisto.Text,
    intToStr(trunc(vPesoInicio-vPesoCLP)),
    TimeToStr(vHoraIni),
    TimeToStr(vHoraFim),
    FloatToStr(vPesoInicio),
    FloatToStr(vPesoCLP),
    udb.vIdLoteCarregado,
    udb.vIdUsuario,
    vTipoPrev);
 end;
  {$IFDEF MSWINDOWS}
   frmPrincipal.ShowMsg('0','1','Deseja Finalizar o Carregamento?');
   case udb.vMsgConfirm of
   1:begin
       vIniciaLeitura               := 0;
       if TaskCLP <> nil then
        if TaskCLP.Status <> TTaskStatus.Canceled then
          TaskCLP.Cancel;
       udb.FinalizaCarregamento(udb.vIdCarregamento);
       filtroLista;
       mudarAba(tbiLista,sender);
     end;
   0:begin

     end;
   end;
  {$ENDIF}
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   MessageDlg('Deseja Finalizar o Carregamento?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
  procedure(const AResult: System.UITypes.TModalResult)
  begin
    case AResult of
     mrYES:
       begin
         vIniciaLeitura               := 0;
         if TaskCLP <> nil then
          if TaskCLP.Status <> TTaskStatus.Canceled then
            TaskCLP.Cancel;
         udb.FinalizaCarregamento(udb.vIdCarregamento);
         filtroLista;
         mudarAba(tbiLista,sender);
       end;
     mrNo:

    end;
   end);
  {$ENDIF}
end;

procedure TfrmFornLista.btnIniciarLeituraClick(Sender: TObject);
begin
 if btnIniciarLeitura.Tag=0 then
 begin
   btnIniciarLeitura.Tag        :=1;
   btnIniciarLeitura.Fill.Color := TAlphaColorRec.Darkgreen;
   lblCurralForn.Text           := 'Leitura Iniciada';
   lblIniciaLeitura.Text        := 'Pausar Leitura';
   vIniciaLeitura               := 1;
 end
 else
 begin
   if (vIniciaForn=1) and (edtRealizado.Value>0) then
   begin
     vHoraFim    := now;
     udb.InsereFornecimento(
      udb.vIdCarregamento,
      FormatDateTime('yyyy-mm-dd',date),
      vIDCURRAL,
      lblTratoCad.Text,
      udb.vIdReceitaCarregada,
      udb.vIdReceitaCarregada,
      edtPrevisto.Text,
      intToStr(trunc(vPesoInicio-vPesoCLP)),
      TimeToStr(vHoraIni),
      TimeToStr(vHoraFim),
      FloatToStr(vPesoInicio),
      FloatToStr(vPesoCLP),
      udb.vIdLoteCarregado,
      udb.vIdUsuario,
      vTipoPrev);
   end;
   TThread.Synchronize(TThread.CurrentThread, procedure
   begin
     edtPrevisto.Value  := 0;
     edtRealizado.Value := 0;
     GeraListaCadFornecimento(udb.vIdReceitaCarregada,lblTratoCad.Text);
     btnIniciarLeitura.Tag        := 0;
     btnIniciarLeitura.Fill.Color := TAlphaColorRec.Darkred;
     lblIniciaLeitura.Text        := 'Iniciar Leitura';
     lblCurralForn.Text           := 'Leitura Pausada';
     vIniciaLeitura               := 0;
     vIniciaForn        := 0;
     BTagIni            := true;
     BTagFim            := false;
     Track.Fill.Color   := TAlphaColorRec.lime;
     Track.Width        := 0;
   end);
 end;
end;

procedure TfrmFornLista.btnNovoFornClick(Sender: TObject);
begin
 udb.Config.Close;
 udb.Config.Open;
 if(udb.ConfigIPClp.Text.Length>0) and (udb.ConfigPortaCLP.Text.Length>0)then
 begin
   vHost  :=udb.ConfigIPClp.Text;
   vPorta :=udb.ConfigPortaCLP.Text;
 end
 else
 begin
   frmPrincipal.ShowMsg('0','0','Informe os dados de conexão com a CLP nas configurações!');
   btnCloseClick(Sender);
 end;
 case frmPrincipal.vTipoUso of
 0:begin//rotormix
   if udb.VerificaCarregamentoAberto then
    begin
     frmPrincipal.ShowMsg('0','0','Nenhum Carregamento em aberto!');
     Exit;
    end
    else
    begin
     layTratoSelect.Visible := true;
     vCarregando:=0;
    end;
   end;
 2:begin //distribuidor
    if udb.VerificaCarregamentoCarregado then
    begin
     if CarregaComboCarregamento then
     begin
       vStartStopTHreadCLP    := true;
       Connectclp(vHost,vPorta);
       MudarAba(tbiCarregamento,sender);
       vCarregando:=1;
     end
    end
    else
    begin
      layTratoSelect.Visible := true;
    end;
   end;
 end;
end;

procedure TfrmFornLista.btnReplicaPrevClick(Sender: TObject);
var
 vResult:string;
begin
 {$IFDEF ANDROID}
  MessageDlg('Deseja replicar o ultimo previsto baixado?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
  procedure(const AResult: System.UITypes.TModalResult)
  begin
    case AResult of
     mrYES:
       begin
         vResult := udb.ReplicaPrevisto;
         if vResult<>'OK' then
         begin
           frmPrincipal.ShowMsg('1','0',vResult);
           FiltroLista;
           Exit;
         end
         else
         begin
           frmPrincipal.ShowMsg('1','0','Previsto Replicado com Sucesso!');
           FiltroLista;
           Exit;
         end;
       end;
     mrNo:
       begin

       end;
    end;
   end);
 {$ENDIF}
 {$IFDEF WIN32}
  frmPrincipal.ShowMsg('2','1','Deseja replicar o ultimo previsto baixado?');
  case  udb.vMsgConfirm  of
  1:begin
      vResult := udb.ReplicaPrevisto;
      if vResult<>'OK' then
      begin
        frmPrincipal.ShowMsg('1','0',vResult);
        FiltroLista;
        Exit;
      end
      else
      begin
        frmPrincipal.ShowMsg('1','0','Previsto Replicado com Sucesso!');
        FiltroLista;
        Exit;
      end;
    end;
  end;
 {$ENDIF}
end;

function TfrmFornLista.Busca(texto: string; posicao: integer): string;
var
 ret: string;
 aux, x, y: integer;
 achou: boolean;
begin
  y:=1;
  {$IFDEF ANDROID}
   x:=0;
  {$ENDIF}
  {$IFDEF WIN32}
    x:=1;
  {$ENDIF}
  ret:='';
  achou:=False;
  aux:=Length(texto);
  while not achou do
      begin
      while x <= aux do
          begin
          if texto[x] = ';' then
              begin
              if y = posicao then
                  begin
                  achou:=True;
                  x:=aux + 1;
                  end
              else
                  begin
                  Inc(x);
                  Inc(y);
                  ret:='';
                  end;
              end
          else
              begin
              ret:=ret + texto[x];
              Inc(x);
              end;
          if x = aux + 1 then
              achou:=True;
          end;
      end;
   Busca:=Trim(ret);
end;

function TfrmFornLista.CarregaComboCarregamento:boolean;
var
 vResult:string;
begin
// TThread.CreateAnonymousThread(procedure
// begin
  if dmSync.TestaServidor='Erro' THEN
  begin
    TThread.Synchronize(nil, procedure
    begin
     frmPrincipal.ShowMsg('1','0','Erro ao se conectar com servidor!!');
     Exit;
    end);
  end
  else
  begin
   vResult := dmSync.GetCarregamento(udb.Carregamento);
   if vResult<>'OK' THEN
   begin
     frmPrincipal.ShowMsg('1','0',vResult);
     Result:=false;
     Exit;
   end
   else
    Result:=true;
   udb.CarregamentoDistribuidor.Close;
   udb.CarregamentoDistribuidor.Open;
  end
// end).Start;
end;

procedure TfrmFornLista.CarregaComboFiltro;
begin
 cbxRacaoF.Items.Clear;
 cbxRacaoF.Items.Add('Todas');
 udb.Racao.Close;
 udb.Racao.Open;
 udb.Racao.First;
 while not udb.Racao.Eof do
 begin
   cbxRacaoF.Items.Add(udb.RacaoNome.AsString);
   udb.Racao.Next;
 end;
 cbxRacaoF.ItemIndex :=0;
end;

procedure TfrmFornLista.cbxCarregamentoChange(Sender: TObject);
begin
 if cbxCarregamento.ItemIndex>-1 then
 begin
   vIdCarregamento       := LinkFillControlToField1.BindList.GetSelectedValue.AsString;
   lblLoteFab.Text       := Udb.RetornaLoteFab(vIdCarregamento);
   edtPesoFabricado.Text := Udb.RetornaTotalFabCarregamento(vIdCarregamento);
   TThread.CreateAnonymousThread(procedure
   begin
    if dmSync.TestaServidor='Erro' THEN
    begin
      TThread.Synchronize(nil, procedure
      begin
       frmPrincipal.ShowMsg('1','0','Erro ao se conectar com servidor!!');
       Exit;
      end);
    end
    else
     dmSync.PostAlteraFlagCarregamentoFB(vIdCarregamento);
   end).Start;
 end;
end;

procedure TfrmFornLista.cbxRacaoFChange(Sender: TObject);
begin
 if cbxRacaoF.ItemIndex>0 then
  FiltroLista;
end;

procedure TfrmFornLista.cbxTratoChange(Sender: TObject);
begin
 lblTextPromt.Visible := cbxTrato.ItemIndex=-1;
end;

procedure TfrmFornLista.cbxTratoFChange(Sender: TObject);
begin
 if cbxTratoF.ItemIndex>0 then
  FiltroLista;
end;

function TfrmFornLista.ConsultaListaPrevisto(Atag: string): Boolean;
var
 I,Found:integer;
 vvTTAAGG:string;
 vPercent:Double;
begin
  Found :=0;
  for I := 0 to listaCadFornecimento.Items.Count-1 do
  begin
    vvTTAAGG := TAppearanceListViewItem(
     listaCadFornecimento.Items.Item[I]).Objects.FindObjectT<TListItemText>('Text10').Text;
    if vvTTAAGG=Atag then
    begin
      listaCadFornecimento.Selected := listaCadFornecimento.Items[I];
      Found :=1;

      TThread.Synchronize(nil, procedure
      begin
       edtPrevisto.value := strToFloat(TAppearanceListViewItem(
        listaCadFornecimento.Items.Item[I]).Objects.FindObjectT<TListItemText>('Text7').Text);
      end);

      TThread.Synchronize(nil, procedure
      begin
       edtRealizado.value := strToFloat(TAppearanceListViewItem(
        listaCadFornecimento.Items.Item[I]).Objects.FindObjectT<TListItemText>('Text16').Text);
      end);

      vPesoRealIni      := edtRealizado.Value;

      vTipoPrev         := TAppearanceListViewItem(
       listaCadFornecimento.Items.Item[I]).Objects.FindObjectT<TListItemText>('Text19').Text;
      result := true;
      TThread.Synchronize(nil, procedure
      begin
        if(edtPrevisto.Value>0) and(edtRealizado.Value>0) then
        begin
         vPercent    := trunc((edtRealizado.Value*100)/edtPrevisto.Value);
         if vPercent<70 then
         begin
           Track.Fill.Color  := TAlphaColorRec.Lime;
           Track.Width       := (vPercent/100)*ProgressBarField.Width;
         end;
         if(vPercent>70)and(vPercent<100) then
         begin
           Track.Fill.Color  := TAlphaColorRec.Yellow;
           Track.Width       := (vPercent/100)*ProgressBarField.Width;
         end;
         if(vPercent>100) then
           Track.Fill.Color  := TAlphaColorRec.Red;

         lblPercent.Text:= IntToStr(ROUND(vPercent)) +'%';
        end;
      end);
      Break;
    end;
  end;
  if Found=0 then
  begin
    listaCadFornecimento.Index := 0;
    lblCurralForn.Text  := lblCurralForn.Text+' Sem Previsto';
    edtPrevisto.value   := 0;
    edtRealizado.value  := 0;
    if(edtPrevisto.Value>0) and(edtRealizado.Value>0) then
    begin
     vPercent    := trunc((edtRealizado.Value*100)/edtPrevisto.Value);
     if vPercent<70 then
     begin
       Track.Fill.Color  := TAlphaColorRec.Lime;
       Track.Width       := (vPercent/100)*ProgressBarField.Width;
     end;
     if(vPercent>70)and(vPercent<100) then
     begin
       Track.Fill.Color  := TAlphaColorRec.Lime;
       Track.Width       := (vPercent/100)*ProgressBarField.Width;
     end;
     if(vPercent>100) then
       Track.Fill.Color  := TAlphaColorRec.Red;
     lblPercent.Text:= IntToStr(ROUND(vPercent)) +'%';
    end;
    result := false;
  end;
end;

procedure TfrmFornLista.Connectclp(host, port: string);
var
 vPeso:Integer;
 Buffer: TIdBytes;
begin
  ncTCPClient1.Active := false;
  ncTCPClient1.Port   := StrToInt(port);
  ncTCPClient1.Host   := host;
  try
   ncTCPClient1.Active := true;
  except
  on E: Exception do
   begin
    TThread.Synchronize(nil, procedure
    begin
     ShowMessage('Erro ao se conectar a clp:'+e.Message);
     btnConneted.Visible    := false;
     btnDisconected.Visible := true;
     btnIniciarLeitura.Fill.Color := TAlphaColorRec.Darkred;
     lblIniciaLeitura.Text        := 'Desconectado';
     vIniciaForn                  := 0;
     btnIniciarLeitura.Enabled    := false;
    end);
   end;
  end;
end;

function TfrmFornLista.ConsultaTag(vTag: string): Boolean;
var
 vResult:Boolean;
begin
 ttag.Filtered       := false;
 ttag.Filter         := 'TAG_INICIO='+vTag.QuotedString;
 ttag.Filtered       := True;
 lblCurralForn.Text  := Ttag.FieldByName('nome').AsString;
 vIdCurral           := Ttag.FieldByName('id').AsString;
 vResult             := Ttag.IsEmpty;
 if vResult then
 begin
  Ttag.Filtered       := false;
  Ttag.Filter         := 'TAG_FIM='+vTag.QuotedString;
  Ttag.Filtered       := True;
  lblCurralForn.Text  := Ttag.FieldByName('nome').AsString;
  vIdCurral           := Ttag.FieldByName('id').AsString;
  vResult             := Ttag.IsEmpty;
 end;
 TThread.Synchronize(nil, procedure
 begin
  lblTagLida.Text     := Ttag.FieldByName('nome').AsString+' : '+vTag;
 end);
 Result               := vResult;
end;

procedure TfrmFornLista.edtFDataChange(Sender: TObject);
begin
   FiltroLista;
end;

procedure TfrmFornLista.edtLinhaFChangeTracking(Sender: TObject);
begin
 FiltroLista;
end;

procedure TfrmFornLista.edtPesoBalancaChangeTracking(Sender: TObject);
begin
 if vIniciaForn=1 then
 begin
   if edtPesoBalanca.Value>-1 then
   begin
     vPesoRealizado     := StrToFloat(edtRealizado.Text);
     vPesoRealizado     := vPesoRealIni+(vPesoInicio-vPesoCLP);
     edtRealizado.Value := vPesoRealizado;
   end;
 end;
end;

procedure TfrmFornLista.edtPesoCarregandoChangeTracking(Sender: TObject);
begin
 if vIniciaCarrega=1  then
 begin
   if(edtPesoCarregando.Value>0)then
   begin
     edtPesoCarregado.Value  :=edtPesoCarregando.Value-vPesoIniCarregamento;
   end;
 end;
end;

procedure TfrmFornLista.edtRealizadoChangeTracking(Sender: TObject);
var
 vPercent:integer;
begin
 if(edtPrevisto.Value>0) and(edtRealizado.Value>0) then
 begin
   vPercent    := trunc((edtRealizado.Value*100)/edtPrevisto.Value);
   if vPercent<70 then
   begin
     Track.Fill.Color  := TAlphaColorRec.lime;
     Track.Width       := (vPercent/100)*ProgressBarField.Width;
   end;
   if(vPercent>70)and(vPercent<100) then
   begin
     Track.Fill.Color  := TAlphaColorRec.Yellow;
     Track.Width       := (vPercent/100)*ProgressBarField.Width;
   end;
   if vPercent>100 then
     Track.Fill.Color  := TAlphaColorRec.Red;
   lblPercent.Text:= IntToStr(ROUND(vPercent)) +'%';
 end;
end;

procedure TfrmFornLista.FiltroLista;
var
 vFiltro:string;
begin
 vFiltro :='';
 vFiltro := vFiltro+' and A.DATA='+FormatDateTime('yyyy-mm-dd',edtFData.DateTime).QuotedString;
 if cbxRacaoF.ItemIndex>0 then
  vFiltro := vFiltro+' and C.NOME='+cbxRacaoF.Selected.Text.QuotedString;
 if cbxTratoF.ItemIndex>0 then
  vFiltro := vFiltro+' and a.trato='+cbxTratoF.Selected.Text;
 if edtLinhaF.Text.Length>0 then
  vFiltro := vFiltro+' and b.LINHA='+edtLinhaF.Text.QuotedString;
 GeraLista(vFiltro);
end;

procedure TfrmFornLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if ncTCPClient1.Active then
  ncTCPClient1.Active := false;
end;

procedure TfrmFornLista.FormShow(Sender: TObject);
begin
 vStartStopTHreadCLP      := false;
 vIniciaCarrega           := 0;
 Track.Width              := 0;
 AbreQryTag;


 vIniciaLeitura           := 0;
 RecRealizado.Width       := (frmPrincipal.Width/2)-20;
 RecPrevisto.Width        := (frmPrincipal.Width/2)-20;
 lblRealizado.Width       := (frmPrincipal.Width/2)-20;
 lblPrevisto.Width        := (frmPrincipal.Width/2)-20;
 recTotalFabricado.Width  := (frmPrincipal.Width/2)-20;
 recTotalCarregado.Width  := (frmPrincipal.Width/2)-20;
 lblTotalCarr.Width       := (frmPrincipal.Width/2)-20;
 lblTotalFab.Width        := (frmPrincipal.Width/2)-20;
 layTratoSelect.Visible   := false;
 TbPrincipal.TabPosition  := TTabPosition.None;
 TbPrincipal.ActiveTab    := tbiLista;
 CarregaComboFiltro;
 FiltroLista;
end;

procedure TfrmFornLista.GeraLista(vFiltro: string);
var
 item : TListViewItem;
 txt  : TListItemText;
 img  : TListItemImage;
 foto : TBitmap;
 vPrev,vReal:Double;
begin
  udb.AbrePrevistoForn(vFiltro);
  udb.QPrevistoFor.First;
  ListaFornecimento.Items.Clear;
  vPrev :=0;
  vReal :=0;
  while not udb.QPrevistoFor.Eof do
  begin
    with ListaFornecimento do
    begin
     item := ListaFornecimento.Items.Add;
      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('Text19'));
        txt.Text := 'Curral';
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text1'));
        txt.Text := udb.QPrevistoForCURRAL.AsString;
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text2'));
        txt.Text := 'Ração';
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text3'));
        txt.Text := udb.QPrevistoForRACAO.AsString;
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text4'));
        txt.Text := 'Trato';
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}


        txt := TListItemText(Objects.FindDrawable('Text5'));
        txt.Text := udb.QPrevistoForTRATO.AsString;
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text6'));
        txt.Text := 'Hora Ini';
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text7'));
        txt.Text := udb.QPrevistoForHoraIni.AsString;
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text15'));
        txt.Text := 'Hora Fim';
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text16'));
        txt.Text := udb.QPrevistoForHoraFim.AsString;
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text10'));
        txt.Text := 'Previsto';
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text11'));
        txt.Text := udb.QPrevistoForKGPREVISTO.AsString;
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text12'));
        txt.Text := 'Realizado';
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text13'));
        txt.Text := udb.QPrevistoForRealizado.AsString;
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}

        img := TListItemImage(Objects.FindDrawable('Image17'));
        img.Bitmap := frmPrincipal.imgForn.Bitmap;

        vPrev := vPrev+udb.QPrevistoForKGPREVISTO.AsFloat;
        vReal := vReal+udb.QPrevistoForRealizado.AsFloat;
        udb.QPrevistoFor.Next;
      end;
    end;
  end;
  lblCoutFabricacao.Text := intToStr(ListaFornecimento.Items.Count);
  lblTotalPrev.Text      := FormatFloat('####,##0.00',vPrev);
  lblTotalReal.Text      := FormatFloat('####,##0.00',vReal);
end;

procedure TfrmFornLista.GeraListaCadFornecimento(vIdRacao,Trato: string);
var
 item : TListViewItem;
 txt  : TListItemText;
 img  : TListItemImage;
 foto : TBitmap;
 vPrev,vReal:Double;
 Count:integer;
begin
  udb.AbrePrevistoFornCad(vIdRacao,Trato);
  Count := udb.QPrevistoFor.RecordCount;
  udb.QPrevistoFor.First;
  listaCadFornecimento.Items.Clear;
  vPrev :=0;
  vReal :=0;
  while not udb.QPrevistoFor.Eof do
  begin
    with listaCadFornecimento do
    begin
     item := listaCadFornecimento.Items.Add;
      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('Text4'));
        txt.Text := 'Curral';
        txt := TListItemText(Objects.FindDrawable('Text1'));
        txt.Text := udb.QPrevistoForCURRAL.AsString;
//        txt := TListItemText(Objects.FindDrawable('Text5'));
//        txt.Text := udb.QPrevistoForRACAO.AsString;

//        txt := TListItemText(Objects.FindDrawable('Text2'));
//        txt.Text := 'Trato:';
//        txt := TListItemText(Objects.FindDrawable('Text3'));
//        txt.Text := udb.QPrevistoForTRATO.AsString;

        txt := TListItemText(Objects.FindDrawable('Text6'));
        txt.Text := 'Previsto';
        txt := TListItemText(Objects.FindDrawable('Text7'));
        txt.Text := udb.QPrevistoForKGPREVISTO.AsString;

        txt := TListItemText(Objects.FindDrawable('Text15'));
        txt.Text := 'Realizado';
        txt := TListItemText(Objects.FindDrawable('Text16'));
        txt.Text := udb.QPrevistoForRealizado.AsString;

        txt := TListItemText(Objects.FindDrawable('Text10'));
        if frmPrincipal.vLeitor=0 then
        begin
         txt.Text      := StringReplace(udb.QPrevistoForTAG_INICIO.AsString,'H','',[rfReplaceAll]);
         txt.TagString := StringReplace(udb.QPrevistoForTAG_FIM.AsString,'H','',[rfReplaceAll]);
        end
        else
        begin
         txt.Text      := udb.QPrevistoForTAG_INICIO.AsString;
         txt.TagString := udb.QPrevistoForTAG_FIM.AsString;
        end;

        txt := TListItemText(Objects.FindDrawable('Text19'));
        txt.Text      := udb.QPrevistoForTIPO.AsString;


        if udb.QPrevistoForRealizado.AsInteger>0 then
        begin
         img := TListItemImage(Objects.FindDrawable('Image22'));
         img.Bitmap := frmPrincipal.imgRec.Bitmap;
        end;


        img := TListItemImage(Objects.FindDrawable('Image17'));
        img.Bitmap := frmPrincipal.imgForn.Bitmap;

        vPrev := vPrev+udb.QPrevistoForKGPREVISTO.AsFloat;
        vReal := vReal+udb.QPrevistoForRealizado.AsFloat;
        udb.QPrevistoFor.Next;
      end;
    end;
  end;
  lblPrevistoCad.Text      := FormatFloat('####,##0.00',vPrev);
  lblRealizadoCad.Text     := FormatFloat('####,##0.00',vReal);
  lblDiferecaCad.Text      := FormatFloat('####,##0.00',(vPrev-vReal));
end;

procedure TfrmFornLista.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmFornLista.ncTCPClient1Connected(Sender: TObject; aLine: TncLine);
begin
 TThread.Synchronize(nil, procedure
 begin
   btnIniciarLeitura.Tag        :=1;
   btnIniciarLeitura.Fill.Color := TAlphaColorRec.DarkGreen;
   lblIniciaLeitura.Text        := 'Pausar Leitura';
   vIniciaLeitura               := 1;
   btnIniciarLeitura.Enabled    := true;
   btnConneted.Visible          := true;
   btnDisconected.Visible       := false;
 end);
end;

procedure TfrmFornLista.ncTCPClient1Disconnected(Sender: TObject;
  aLine: TncLine);
begin
  if (vIniciaForn=1) and (edtRealizado.Value>0) then
  begin
   vHoraFim    := now;
   udb.InsereFornecimento(
    udb.vIdCarregamento,
    FormatDateTime('yyyy-mm-dd',date),
    vIDCURRAL,
    lblTratoCad.Text,
    udb.vIdReceitaCarregada,
    udb.vIdReceitaCarregada,
    edtPrevisto.Text,
    intToStr(trunc(vPesoInicio-vPesoCLP)),
    TimeToStr(vHoraIni),
    TimeToStr(vHoraFim),
    FloatToStr(vPesoInicio),
    FloatToStr(vPesoCLP),
    udb.vIdLoteCarregado,
    udb.vIdUsuario,
    vTipoPrev);
  end;
  TThread.Synchronize(nil, procedure
  begin
   btnConneted.Visible    := false;
   btnDisconected.Visible := true;
   btnIniciarLeitura.Fill.Color := TAlphaColorRec.Darkred;
   lblIniciaLeitura.Text        := 'Desconectado';
   vIniciaForn                  := 0;
   btnIniciarLeitura.Enabled    := false;
  end);
end;

procedure TfrmFornLista.ncTCPClient1ReadData(Sender: TObject; aLine: TncLine;
  const aBuf: TArray<System.Byte>; aBufCount: Integer);
var
 BytesReceived: TBytes;
begin
  TThread.Sleep(100);
  BytesReceived := Copy(aBuf, 0, aBufCount);
  vString  := Stringof(BytesReceived);
  if vString.Length>0 then
  begin
   vPesoCLP := strtoInt(Busca(vString,1));
   vTagLida := Busca(vString,3);
   if vCarregando=0 then
   begin
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      edtPesoBalanca.Text:=FloatToStr(vPesoCLP);
    end);
   end
   else
   begin
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      edtPesoCarregando.Text:=FloatToStr(vPesoCLP);
    end);
   end;

   if vIniciaLeitura=1 then
   begin
    if vTagLida.Length>0 then
    begin
     if not BTagFim  then
     begin
      vTagInicio := vTagLida;
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       if not ConsultaTag(vTagInicio) then
       begin
        if ConsultaListaPrevisto(vTagInicio) then
        begin
         vIniciaForn     := 1;
         vHoraIni        := now;
         vPesoInicio     := vPesoCLP;
         lblPesoIni.Text := FloatToStr(vPesoInicio);
         BTagIni         := false;
         BTagFim         := true;
         vIdCurralForn   := vIdCurral;
        end
        else
        begin
         lblCurralForn.Text := 'Sem Previsto ou Fim de Linha';
         edtPrevisto.Text   := '0';
         edtRealizado.Text  := '0';
         vIniciaForn        := 0;
        end;
       end
       else
       begin
        lblCurralForn.Text := 'Tag Não Localizada!';
        edtPrevisto.Text   := '0';
        edtRealizado.Text  := '0';
        vIniciaForn        := 0;
       end;
      end);
     end//lendo inicial
     else
     begin
      vTagFim := vTagLida;
      if(vTagFim.Length>0)and(vTagFim<>vTagInicio) then
      begin
        if not ConsultaTag(vTagFim) then
        begin
         vIniciaForn := 1;
         vHoraFim    := now;

         if (vPesoInicio-vPesoCLP)>0 then
         begin
          udb.InsereFornecimento(
           udb.vIdCarregamento,
           FormatDateTime('yyyy-mm-dd',date),
           vIdCurralForn,
           lblTratoCad.Text,
           udb.vIdReceitaCarregada,
           udb.vIdReceitaCarregada,
           edtPrevisto.Text,
           intToStr(trunc(vPesoInicio-vPesoCLP)),
           TimeToStr(vHoraIni),
           TimeToStr(vHoraFim),
           FloatToStr(vPesoInicio),
           FloatToStr(vPesoCLP),
           udb.vIdLoteCarregado,
           udb.vIdUsuario,
           vTipoPrev
          );
          vIdCurralForn      := vIdCurral;
          edtPrevisto.Value  := 0;
          edtRealizado.Value := 0;
          TThread.Synchronize(TThread.CurrentThread, procedure
          begin
           GeraListaCadFornecimento(udb.vIdReceitaCarregada,lblTratoCad.Text);
          end);
         end;
         if ConsultaListaPrevisto(vTagFim) then
         begin
          //Inicia Novo Fornecimento
          vHoraIni        := vHoraFim;
          vPesoInicio     := vPesoCLP;
          lblPesoIni.Text := FloatToStr(vPesoInicio);
          vTagInicio      := vTagFim;
          vTagFim         := '';
          vIniciaForn     := 1;
         end
         else
         begin
          lblCurralForn.Text := 'Sem Previsto ou Fim de Linha';
          edtPrevisto.Text   := '0';
          edtRealizado.Text  := '0';
          vIniciaForn        := 0;
          BTagIni            := true;
          BTagFim            := false;
         end;
        end
        else
        begin
         if (vPesoInicio-vPesoCLP)>0 then
         begin
          udb.InsereFornecimento(
           udb.vIdCarregamento,
           FormatDateTime('yyyy-mm-dd',date),
           vIdCurralForn,
           lblTratoCad.Text,
           udb.vIdReceitaCarregada,
           udb.vIdReceitaCarregada,
           edtPrevisto.Text,
           intToStr(trunc(vPesoInicio-vPesoCLP)),
           TimeToStr(vHoraIni),
           TimeToStr(vHoraFim),
           FloatToStr(vPesoInicio),
           FloatToStr(vPesoCLP),
           udb.vIdLoteCarregado,
           udb.vIdUsuario,
           vTipoPrev
          );
          TThread.Synchronize(TThread.CurrentThread, procedure
          begin
           GeraListaCadFornecimento(udb.vIdReceitaCarregada,lblTratoCad.Text);
           lblCurralForn.Text := 'Tag Não Encontrada';
           edtPrevisto.Text   := '0';
           edtRealizado.Text  := '0';
           vIniciaForn        := 0;
           BTagIni            := true;
           BTagFim            := false;
          end);
         end;
        end;
        Track.Fill.Color  := TAlphaColorRec.lime;
        Track.Width       := 0;
      end;//if(vTagFim.Length>0)and(vTagFim<>vTagInicio)
     end;
    end;//Tag Lida
   end;//leitura Iniciada
  end;
end;

procedure TfrmFornLista.ncTCPClient1Reconnected(Sender: TObject;
  aLine: TncLine);
begin
  TThread.Synchronize(nil, procedure
  begin
   btnConneted.Visible    := false;
   btnDisconected.Visible := true;
   btnIniciarLeitura.Fill.Color := TAlphaColorRec.Yellow;
   lblIniciaLeitura.Text        := 'Reconectando';
   vIniciaForn                  := 0;
   btnIniciarLeitura.Enabled    := false;
  end);
end;

procedure TfrmFornLista.Rectangle37Click(Sender: TObject);
begin
 vIniciaLeitura         := 0;
 vStartStopTHreadCLP    := true;
 Connectclp(vHost,vPorta);
 GeraListaCadFornecimento(udb.vIdReceitaCarregada,cbxTrato.Selected.Text);
 MudarAba(tbiCad,sender);
 lblTratoCad.Text       := cbxTrato.Selected.Text;
 lblRacaoCad.Text       := udb.vNomeReceitaCarregada;
 layTratoSelect.Visible := false;
end;

end.
