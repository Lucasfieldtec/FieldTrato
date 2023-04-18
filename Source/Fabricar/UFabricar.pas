unit UFabricar;

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
  FireDAC.Comp.Client,
  uDecoderCentral, ncSockets;

type
  TfrmFabricar = class(TForm)
    StyleBook1: TStyleBook;
    tbPrincipal: TTabControl;
    tbiFab: TTabItem;
    tbiTimer: TTabItem;
    layBase: TLayout;
    Rectangle10: TRectangle;
    recTop: TRectangle;
    Layout10: TLayout;
    lbl_titulo: TLabel;
    btnClose: TImage;
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    lblRac: TLabel;
    lblRacaoFabricando: TLabel;
    Label2: TLabel;
    lblTotalBatida: TLabel;
    Layout5: TLayout;
    Rectangle4: TRectangle;
    lblIngredienteFabricando: TLabel;
    Layout6: TLayout;
    Layout7: TLayout;
    lblPrevisto: TLabel;
    lblRealizado: TLabel;
    RecPrevisto: TRectangle;
    edtPrevisto: TEdit;
    RecRealizado: TRectangle;
    edtRealizado: TEdit;
    lyaBtn: TLayout;
    Layout11: TLayout;
    Rectangle1: TRectangle;
    Layout12: TLayout;
    Rectangle11: TRectangle;
    Layout13: TLayout;
    Label9: TLabel;
    Layout14: TLayout;
    Rectangle12: TRectangle;
    Layout15: TLayout;
    Layout16: TLayout;
    Rectangle13: TRectangle;
    Label10: TLabel;
    lblRacaoFabricandoTimer: TLabel;
    Label14: TLabel;
    lblTotalFab: TLabel;
    Layout17: TLayout;
    Layout18: TLayout;
    Rectangle14: TRectangle;
    Layout19: TLayout;
    Layout20: TLayout;
    Rectangle15: TRectangle;
    btnFinalizarTimer: TRectangle;
    Image5: TImage;
    ShadowEffect4: TShadowEffect;
    Label17: TLabel;
    Rectangle22: TRectangle;
    edtPesoBalanca: TEdit;
    Label1: TLabel;
    Layout21: TLayout;
    btnDisconected: TImage;
    btnConneted: TImage;
    Lista: TListView;
    Image4: TImage;
    ProgressBarField: TLayout;
    Track: TRectangle;
    trackTol: TRectangle;
    Rectangle5: TRectangle;
    lblTolPercent: TLabel;
    layTempoPula: TLayout;
    Rectangle6: TRectangle;
    lblTempoPula: TLabel;
    Layout9: TLayout;
    Label4: TLabel;
    Layout8: TLayout;
    btnNovaFabricacao: TRectangle;
    Image1: TImage;
    ShadowEffect2: TShadowEffect;
    Label6: TLabel;
    btnProximoIngrediente: TRectangle;
    Image2: TImage;
    ShadowEffect1: TShadowEffect;
    Label7: TLabel;
    lblTimer: TEdit;
    btnFinalizaFab: TRectangle;
    Image3: TImage;
    ShadowEffect3: TShadowEffect;
    Label8: TLabel;
    lblPercent: TEdit;
    lblIndex: TLabel;
    Timer1: TTimer;
    ncTCPClient1: TncTCPClient;
    procedure FormShow(Sender: TObject);
    procedure edtRealizadoChangeTracking(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnDisconectedClick(Sender: TObject);
    procedure edtPesoBalancaChangeTracking(Sender: TObject);
    procedure btnProximoIngredienteClick(Sender: TObject);
    procedure ListaUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnFinalizaFabClick(Sender: TObject);
    procedure btnFinalizarTimerClick(Sender: TObject);
    procedure btnNovaFabricacaoClick(Sender: TObject);
    procedure layTempoPulaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConnetedClick(Sender: TObject);
    procedure lblPercentChangeTracking(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ncTCPClient1ReadData(Sender: TObject; aLine: TncLine;
      const aBuf: TArray<System.Byte>; aBufCount: Integer);
    procedure ncTCPClient1Disconnected(Sender: TObject; aLine: TncLine);
    procedure ncTCPClient1Connected(Sender: TObject; aLine: TncLine);
  private
    vIdRacao,
    vIdFabricacao,
    vIdIngrediente,
    vIdDetFab:string;
    vOrdem,
    vTempoMistura,
    vPeso,vTempo,vTempoEstabilidade,vPesoEstavel,vListaIndex :integer;
    TaskCLP : ITask;
    vHost,vPorta,vTotalFabricado:string;
    vPesoInicio,
    vPesoFim,
    vPesoIndicador,
    vPesoRealizado,vPesoRealIni,vPesoTolerancia,vPesoInicioPula :Double;
    vBoolPesoIn:Boolean;
    vHoraIni,vHoraFim:TTime;
    vCoutTempo:integer;
    vPercent:integer;
    vBool,vIniciaTempo,vBoolPula:Boolean;
    procedure GeraLista(idFab:string);
    procedure AbreIngredienteFabricando(id:string);
    procedure Connectclp(host,port:string);//clp
    function  Busca(texto: string; posicao: integer): string;
    procedure TempoMistura(vTempo:integer);
    function  SegundosToTime(Segundos: Cardinal): String;
//    procedure PulaIngrediente(vInicia: boolean);
    procedure NextIngrediente;
    procedure ComebackIngrediente;
    function  RetornaIndexListaContinua(vIdTag:string):string;
  public

  end;

var
  frmFabricar: TfrmFabricar;

implementation

{$R *.fmx}

uses UDmDb, UFabricacao, UPrincipal, UMyCustomThread, Umsg, FMX.Consts, UDmSync;



procedure TfrmFabricar.AbreIngredienteFabricando(id: string);
var
 vOrd:integer;
 trackTolWidth:integer;
 vIndexContinua:string;
begin
 with udb.TIngredienteFabricando,udb.TIngredienteFabricando.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Alimento from FabricacaoAlimentos a');
   Add('join Alimentos b on a.IdAlimento=b.Id');
   Add('where a.Id='+id);
   Open;
   if udb.vContinua=0 then
    TThread.Synchronize(nil, procedure
    begin
      Lista.Selected := Lista.Items[vListaIndex+1];
      Lista.SetFocus;
    end)
    else
    begin
     vIndexContinua:=RetornaIndexListaContinua(id);
     vListaIndex    := strToInt(vIndexContinua);
     Lista.Selected := Lista.Items[vListaIndex];
     Lista.SetFocus;
    end;


   if not udb.TIngredienteFabricando.IsEmpty then
   begin
     vPesoTolerancia               := 0;
     vBoolPesoIn                   := true;
     vIdIngrediente                := udb.TIngredienteFabricandoIdAlimento.AsString;
     vIdDetFab                     := udb.TIngredienteFabricandoId.AsString;
     vOrdem                        := udb.TIngredienteFabricandoOrdem.AsInteger;
     lblIngredienteFabricando.Text := udb.TIngredienteFabricandoAlimento.AsString;
     edtPrevisto.Text              := udb.TIngredienteFabricandoPrevKG.AsString;
     edtRealizado.Text             :='0';
     edtRealizado.Text             := udb.TIngredienteFabricandoRealizadoKG.AsString;
     vPesoRealIni                  := udb.TIngredienteFabricandoRealizadoKG.AsFloat;
     vPesoTolerancia               := udb.TIngredienteFabricandoPrevKG.AsFloat-(udb.TIngredienteFabricandoPrevKG.AsFloat *
      (udb.TIngredienteFabricandoPercentToleracia.AsFloat/100));
     if (length(edtPrevisto.Text)>0) and(length(edtRealizado.Text)>0) then
     begin
       vPercent    := trunc((strToInt(edtRealizado.Text) *100)/StrToFloat(edtPrevisto.Text));
       lblTolPercent.Text := intToStr(Trunc(udb.TIngredienteFabricandoPercentToleracia.AsFloat))+'%';

       if vPercent<=0 then
       begin
        Track.Width       := 0;
        Track.Fill.Color  := TAlphaColorRec.Black;
       end;
       if (vPercent>0) and (vPercent<70) then
       begin
        Track.Width       := ProgressBarField.Width;
        Track.Fill.Color  := TAlphaColorRec.Lime;
       end;
       if(vPercent>70)and(vPercent<100) then
       begin
        Track.Width       := ProgressBarField.Width;
        Track.Fill.Color  := TAlphaColorRec.Yellow;
       end;
       if vPercent>100 then
       begin
        Track.Width       := ProgressBarField.Width;
        Track.Fill.Color  := TAlphaColorRec.red;
       end;
       trackTolWidth      :=trunc((udb.TIngredienteFabricandoPercentToleracia.AsFloat/100)*ProgressBarField.Width);
       trackTol.Width     := trackTolWidth;
       lblPercent.Text:= IntToStr(ROUND(vPercent)) +'%';
     end;
   end
   else
   begin
     vPesoTolerancia               := 0;
     vIdIngrediente                := '';
     vIdDetFab                     := '';
     vOrdem                        := 0;
     lblIngredienteFabricando.Text := '';
     edtPrevisto.Text              := '0';
     edtRealizado.Text             := '0';
     Track.Width                   := 0;
     lblPercent.Text               :='0%';
   end;
 end;
 udb.vContinua:=0;
end;

procedure TfrmFabricar.btnCloseClick(Sender: TObject);
begin
 if TaskCLP <> nil then
  if TaskCLP.status <> TTaskStatus.Canceled then
    TaskCLP.Cancel;
  {$IFDEF MSWINDOWS}
  frmPrincipal.ShowMsg('0','1','Desja sair da tela de Fabricação?');
  case udb.vMsgConfirm of
   1:begin
     if ncTCPClient1.Active then
      begin
       ncTCPClient1.Active := false;
      end;
      close;
     end;
   0:begin
       Connectclp(vHost,vPorta);
     end;
  end;
  {$ENDIF}
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   MessageDlg('Desja Realmente Sair da tela de Fabricação?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
  procedure(const AResult: System.UITypes.TModalResult)
  begin
    case AResult of
     mrYES:
       begin
        if ncTCPClient1.Active then
        begin
         ncTCPClient1.Active := false;
        end;
        close;
       end;
     mrNo:
       Connectclp(vHost,vPorta);
    end;
   end);
  {$ENDIF}
end;

procedure TfrmFabricar.btnConnetedClick(Sender: TObject);
begin
 Connectclp(vHost,vPorta);
end;

procedure TfrmFabricar.btnDisconectedClick(Sender: TObject);
begin
 Connectclp(vHost,vPorta);
end;

function TfrmFabricar.Busca(texto: string; posicao: integer): string;
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

procedure TfrmFabricar.ComebackIngrediente;
begin
  vBool := false;
  lblIndex.Text := intToSTR(vListaIndex);
  if vListaIndex>0 then
   vListaIndex    := vListaIndex-1;
  lblIndex.Text := intToSTR(vListaIndex);
  vPesoFim        := strToFloat(edtPesoBalanca.Text);
  vHoraFim        := Now;
  vPesoRealizado  := vPesoFim-vPesoInicio;
  if vPesoRealizado>0 then
    udb.AtualizaIngredienteFabricacao(
     vIdDetFab,
     FormatDateTime('hh:mm:ss',vHoraIni),
     FormatDateTime('hh:mm:ss',vHoraFim),
     FloatToStr(vPesoInicio),
     FloatToStr(vPesoFim),
     FloatToStr((vPesoRealizado)+vPesoRealIni));
  GeraLista(vIdFabricacao);
  Lista.Selected := Lista.Items[vListaIndex];
  AbreIngredienteFabricando(Lista.Selected.TagString);
  lyaBtn.Visible        := vListaIndex=(Lista.Items.Count-1);
end;

procedure TfrmFabricar.Connectclp(host, port: string);
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
      end);
     end;
  end;
end;



procedure TfrmFabricar.edtPesoBalancaChangeTracking(Sender: TObject);
begin
 if(edtPesoBalanca.Text.Length>0)and(edtPesoBalanca.Text<>' ') then
 begin
    vPesoIndicador  := strToFloat(edtPesoBalanca.Text);
//    if vPesoIndicador<0 then
//     vPesoIndicador:=0;

    vPesoRealizado  := StrToFloat(edtRealizado.Text);

    vPesoRealizado   := (vPesoIndicador-vPesoInicio)+vPesoRealIni;
    edtRealizado.Text:= FloatToStr(vPesoRealizado);
 end;
end;

procedure TfrmFabricar.edtRealizadoChangeTracking(Sender: TObject);
begin
 if (length(edtPrevisto.Text)>0) and(length(edtRealizado.Text)>0) then
 begin
   vPercent    := trunc((strToInt(edtRealizado.Text) *100)/StrToFloat(edtPrevisto.Text));
   if vPercent>=100 then
   begin
    Track.Width       := ProgressBarField.Width;
    Track.Fill.Color  := TAlphaColorRec.red;
   end
   else
   begin
     if vPercent<=0  then
     begin
       Track.Fill.Color  := TAlphaColorRec.Black;
       Track.Width       := 0;
//       PulaIngrediente(false);
     end
     else
     begin
      if strToFloat(edtRealizado.Text)>=vPesoTolerancia then
      begin
       Track.Fill.Color  := TAlphaColorRec.Yellow;
       Track.Width       := (vPercent/100)*ProgressBarField.Width;
      end
      else
      begin
        Track.Fill.Color  := TAlphaColorRec.lime;
        Track.Width       := (vPercent/100)*ProgressBarField.Width;
//        PulaIngrediente(false);
      end;
     end;
   end;
   lblPercent.Text:= IntToStr(ROUND(vPercent)) +'%';
   if vPercent>=100 then
    if vListaIndex<(Lista.Items.Count-1) then
     if vBool then
//      PulaIngrediente(true)
 end;
end;

procedure TfrmFabricar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if ncTCPClient1.Active then
  ncTCPClient1.Active := false;
end;

procedure TfrmFabricar.FormCreate(Sender: TObject);
begin
 Position :=  TFormPosition.MainFormCenter;
end;

procedure TfrmFabricar.FormShow(Sender: TObject);
begin
 RecRealizado.Width := (frmPrincipal.Width/2)-20;
 RecPrevisto.Width  := (frmPrincipal.Width/2)-20;
 lblPrevisto.Width  := (frmPrincipal.Width/2)-20;
 lblRealizado.Width := (frmPrincipal.Width/2)-20;
 lyaBtn.Visible            := false;
 btnFinalizarTimer.Visible := false;
 vBoolPesoIn := true;
 udb.Config.Close;
 udb.Config.Open;
 vTempoEstabilidade := udb.ConfigTempoPularIngrediente.AsInteger;
 Timer1.Interval    := udb.ConfigTempoPularIngrediente.AsInteger*1000;
 Timer1.Enabled     := false;
 vPesoEstavel       := udb.ConfigPesoEstavelBalanca.AsInteger;
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
 vOrdem:=1;
 tbPrincipal.TabPosition := TTabPosition.None;
 tbPrincipal.ActiveTab   := tbiFab;
 RecPrevisto.Width   := (frmFabricar.Width/2)-20;
 udb.TRacaoFabricando.Close;
 udb.TRacaoFabricando.Open;
 if udb.TRacaoFabricando.IsEmpty then
 begin
  frmPrincipal.ShowMsg('0','0','Não existe fabricação em aberto!');
  btnCloseClick(Sender);
 end;
 lblRacaoFabricando.Text :=udb.TRacaoFabricandoRacaoFab.AsString;
 lblTotalBatida.Text     :=udb.TRacaoFabricandoPrevKG.AsString;
 vIdRacao                :=udb.TRacaoFabricandoIdReceita.AsString;
 vIdFabricacao           :=udb.TRacaoFabricandoId.AsString;
 try
  Connectclp(vHost,vPorta);
  GeraLista(vIdFabricacao);
  vListaIndex :=0;
  lblIndex.Text := IntToStr(vListaIndex);
  Lista.Selected  := Lista.Items[0];
  if udb.vContinua>0 then
   AbreIngredienteFabricando(udb.RetornaMaxIdFabricando(vIdFabricacao))
  else
   AbreIngredienteFabricando(Lista.Selected.TagString);
 except
 end;
end;

procedure TfrmFabricar.GeraLista(idFab: string);
var
 item : TListViewItem;
 txt  : TListItemText;
 img  : TListItemImage;
 foto : TBitmap;
begin
  udb.AbreRacaoAlimentosFabricando(idFab);
  udb.TRacaoFabricandoAlimentos.First;
  Lista.Items.Clear;
  while not udb.TRacaoFabricandoAlimentos.Eof do
  begin
    with Lista do
    begin
      item := Lista.Items.Add;
      with item do
      begin
        TagString := udb.TRacaoFabricandoAlimentosId.AsString;

        txt := TListItemText(Objects.FindDrawable('Text2'));
        txt.Text := udb.TRacaoFabricandoAlimentosAlimento.AsString;
        txt.Font.Style := [TFontStyle.fsBold];
        txt.TagString  := udb.TRacaoFabricandoAlimentosIdAlimento.AsString;

        txt := TListItemText(Objects.FindDrawable('Text3'));
        txt.Text := 'Ordem:';
        txt.Font.Style := [TFontStyle.fsBold];
        txt := TListItemText(Objects.FindDrawable('Text4'));
        txt.Text := udb.TRacaoFabricandoAlimentosOrdem.AsString;
        txt.Font.Style := [TFontStyle.fsBold];

        txt := TListItemText(Objects.FindDrawable('Text5'));
        txt.Text := 'Previsto:';
        txt.Font.Style := [TFontStyle.fsBold];
        txt := TListItemText(Objects.FindDrawable('Text6'));
        txt.Text := udb.TRacaoFabricandoAlimentosPrevKG.AsString;
        txt.Font.Style := [TFontStyle.fsBold];

        txt := TListItemText(Objects.FindDrawable('Text8'));
        txt.Text := 'Realizado:';
        txt.Font.Style := [TFontStyle.fsBold];
        txt := TListItemText(Objects.FindDrawable('Text7'));
        txt.Text := udb.TRacaoFabricandoAlimentosRealizadoKG.AsString;
        txt.Font.Style := [TFontStyle.fsBold];

        img := TListItemImage(Objects.FindDrawable('Image9'));
        img.Bitmap := frmPrincipal.imgFabricacao.Bitmap;

        if udb.TRacaoFabricandoAlimentosRealizadoKG.AsInteger>0 then
        begin
         img := TListItemImage(Objects.FindDrawable('Image1'));
         img.Bitmap := frmPrincipal.imgRec.Bitmap;
        end;
      end;
    end;
   udb.TRacaoFabricandoAlimentos.Next;
  end;
end;

procedure TfrmFabricar.layTempoPulaClick(Sender: TObject);
begin
// layTempoPula.Visible := false;
end;

procedure TfrmFabricar.lblPercentChangeTracking(Sender: TObject);
begin
 if vPercent>=100 then
 begin
   if Timer1.Enabled=false then
    Timer1.Enabled     := true;
 end;
end;

procedure TfrmFabricar.ListaUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
 img: TListItemImage;
 txt : TListItemText;
begin
 with AItem do
 begin
  img               := TListItemImage(Objects.FindDrawable('Image1'));
  img.Width         := frmPrincipal.Width+20;
 end;
end;

procedure TfrmFabricar.ncTCPClient1Connected(Sender: TObject; aLine: TncLine);
begin
  TThread.Synchronize(nil, procedure
  begin
    btnConneted.Visible    := true;
    btnDisconected.Visible := false;
  end);
end;

procedure TfrmFabricar.ncTCPClient1Disconnected(Sender: TObject;
  aLine: TncLine);
begin
 if vPesoRealizado>0 then
  udb.AtualizaIngredienteFabricacao(
   vIdDetFab,
   FormatDateTime('hh:mm:ss',vHoraIni),
   FormatDateTime('hh:mm:ss',vHoraFim),
   FloatToStr(vPesoInicio),
   FloatToStr(vPesoFim),
   FloatToStr(vPesoRealizado+vPesoRealIni)
  );
  TThread.Synchronize(nil, procedure
  begin
    btnConneted.Visible    := false;
    btnDisconected.Visible := true;
  end);
end;

procedure TfrmFabricar.ncTCPClient1ReadData(Sender: TObject; aLine: TncLine;
  const aBuf: TArray<System.Byte>; aBufCount: Integer);
var
 BytesReceived: TBytes;
 vString      :string;
begin
  BytesReceived := Copy(aBuf, 0, aBufCount);
  vString  := Stringof(BytesReceived);
  if vString.Length>0 then
  begin
   vPeso := strtoInt(Busca(vString,1));
   if vBoolPesoIn then
   begin
    vHoraIni    := now;
    vPesoInicio := vPeso;
    vBoolPesoIn := false;
   end;
   TThread.Synchronize(nil, procedure
   begin
    edtPesoBalanca.Text:=intToStr(vPeso);
   end);
  end;
end;

procedure TfrmFabricar.NextIngrediente;
begin
  lblIndex.Text := IntToStr(vListaIndex);
  if vListaIndex<(lista.Items.Count-1) then
   vListaIndex    := vListaIndex+1;
  lblIndex.Text        := IntToStr(vListaIndex);

  vPesoFim       := strToFloat(edtPesoBalanca.Text);
  vHoraFim       := Now;
  vPesoRealizado := vPesoFim-vPesoInicio;
  if vPesoRealizado>0 then
    udb.AtualizaIngredienteFabricacao(
     vIdDetFab,
     FormatDateTime('hh:mm:ss',vHoraIni),
     FormatDateTime('hh:mm:ss',vHoraFim),
     FloatToStr(vPesoInicio),
     FloatToStr(vPesoFim),
     FloatToStr(vPesoRealizado+vPesoRealIni));

  GeraLista(vIdFabricacao);
  Lista.Selected := Lista.Items[vListaIndex];
  AbreIngredienteFabricando(Lista.Selected.TagString);
  lyaBtn.Visible        := vListaIndex=(Lista.Items.Count-1);
end;

//procedure TfrmFabricar.PulaIngrediente(vInicia: boolean);
//begin
// TThread.CreateAnonymousThread(procedure
// var
//  vPesoOCila:integer;
// begin
//   vTempo :=0;
//   vCoutTempo:=0;
//   vBool        := true;
//   vIniciaTempo := vInicia;
//   vBoolPula    :=true;
//   vPesoInicioPula:= vPesoIndicador;
//   while vInicia do
//   begin
//     while(vIniciaTempo) do
//     begin
//      if vPercent>=100 then
//      begin
////       layTempoPula.Visible := true;
//       vPesoOCila := trunc(vPesoIndicador-vPesoInicioPula);
//       if(vPesoOCila<vPesoEstavel)  then
//        begin
//            vTempo :=vTempoEstabilidade-vCoutTempo;
//            if(intToStr(vTempo).Length=1)then
//             lbltempopula.Text := '00:0'+intToStr(vTempo);
//            if(intToStr(vTempo).Length=2)then
//             lbltempopula.Text := '00:'+intToStr(vTempo);
//            if(vCoutTempo>=(vTempoEstabilidade+1))then
//            begin
//              TThread.Synchronize(
//              TThread.CurrentThread,
//              procedure ()
//              begin
//                vCoutTempo:=0;
//                vIniciaTempo   := false;
//                vInicia        := false;
//                vCoutTempo:=0;
////                vBool          := false;
////                layTempoPula.Visible := false;
//                NextIngrediente;
//              end);
//            end
//            else
//            begin
//             sleep(1000);
//             inc(vCoutTempo);
//            end;
//        end
//        else
//        begin
//          vTempo           :=vTempoEstabilidade;
//          vPesoInicioPula  :=vPesoIndicador;
//          vCoutTempo       :=0;
//          vPesoOCila       :=0;
//        end;
//        vIniciaTempo := vInicia;
//      end
//      else
//      begin
//        vCoutTempo:=0;
//        vIniciaTempo   := false;
//        vInicia        := false;
//        vCoutTempo:=0;
////        vBool          := false;
////        layTempoPula.Visible := false;
//      end;
//     end;//while(vIniciaTempo)
//   end;//while vInicia
// end).Start;
//end;


function TfrmFabricar.RetornaIndexListaContinua(vIdTag: string): string;
var
 I: Integer;
begin
 for I:= 0 to Lista.Items.count-1 do
 begin
   if vIdTag=Lista.Items[I].TagString then
    Break
 end;
 Result:=IntToStr(I);
end;

procedure TfrmFabricar.btnFinalizaFabClick(Sender: TObject);
var
 vCarregamento:string;
begin
 vPesoFim       := strToFloat(edtPesoBalanca.Text);
 vHoraFim       := Now;
 vPesoRealizado := vPesoFim-vPesoInicio;
 if vPesoRealizado>0 then
   udb.AtualizaIngredienteFabricacao(
    vIdDetFab,
    FormatDateTime('hh:mm:ss',vHoraIni),
    FormatDateTime('hh:mm:ss',vHoraFim),
    FloatToStr(vPesoInicio),
    FloatToStr(vPesoFim),
    FloatToStr(vPesoRealizado+vPesoRealIni));
    vTotalFabricado := udb.RetornaTotalFabricado(vIdFabricacao);
    {$IFDEF MSWINDOWS}
    frmPrincipal.ShowMsg('0','1','Desja Realmente Finalizar essa Fabricação?');
    case udb.vMsgConfirm of
     1:begin
      if TaskCLP <> nil then
       if TaskCLP.Status = TTaskStatus.Running then
        TaskCLP.Cancel;

      udb.FinalizaFabricacao(vIdFabricacao,TimeToStr(vHoraFim),vTotalFabricado);
      lblRacaoFabricandoTimer.Text := lblRacaoFabricando.Text;
      lblRacaoFabricando.Text      := lblTotalBatida.Text;
      lblTotalFab.Text             := vTotalFabricado;
      tbPrincipal.ActiveTab := tbiTimer;
      vCarregamento := udb.InsereCarregamento(vIdFabricacao);
      if vCarregamento<>'OK' then
      begin
        msg.ShowMsg('1','0',vCarregamento);
      end;
      if frmPrincipal.vTipoUso=1 then
        dmSync.PostCarregamentoFB;
      TempoMistura(udb.RetornaTempoMisturaRacao(vIdRacao));
     end;
    0:begin
       Connectclp(vHost,vPorta);
      end;
    end;
   {$ENDIF}
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   MessageDlg('Desja Realmente Finalizar essa Fabricação?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
  procedure(const AResult: System.UITypes.TModalResult)
  begin
    case AResult of
     mrYES:
       begin
        if TaskCLP <> nil then
       if TaskCLP.Status = TTaskStatus.Running then
        TaskCLP.Cancel;
        udb.FinalizaFabricacao(vIdFabricacao,TimeToStr(vHoraFim),vTotalFabricado);
        lblRacaoFabricandoTimer.Text := lblRacaoFabricando.Text;
        lblRacaoFabricando.Text      := lblTotalBatida.Text;
        lblTotalFab.Text             := vTotalFabricado;
        tbPrincipal.ActiveTab := tbiTimer;
        vCarregamento := udb.InsereCarregamento(vIdFabricacao);
        if vCarregamento<>'OK' then
        begin
          msg.ShowMsg('1','0',vCarregamento);
        end;
        if frmPrincipal.vTipoUso=1 then
          dmSync.PostCarregamentoFB;
        TempoMistura(udb.RetornaTempoMisturaRacao(vIdRacao));
       end;
     mrNo:
       Connectclp(vHost,vPorta);
    end;
   end);
  {$ENDIF}
end;

procedure TfrmFabricar.btnFinalizarTimerClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFabricar.btnNovaFabricacaoClick(Sender: TObject);
begin
  Timer1.Enabled:=false;
  ComebackIngrediente;
end;

procedure TfrmFabricar.TempoMistura(vTempo: integer);
begin
 TThread.CreateAnonymousThread(procedure()
 begin
   if vTempo>0 then
    vTempo:=trunc(vTempo/60);
   while vTempo > 0 do
   begin
     vTempo := vTempo-1;
     TThread.Synchronize(TThread.CurrentThread,
     procedure ()
     begin
       lblTimer.text:=SegundosToTime(vTempo);
     end);
     sleep(1000);
   end;
   btnFinalizarTimer.Visible := true;
 end).Start;
end;
procedure TfrmFabricar.Timer1Timer(Sender: TObject);
begin
  NextIngrediente;
  Timer1.Enabled     := false;
end;

function TfrmFabricar.SegundosToTime(Segundos: Cardinal): String;
var
  Seg, Min, Hora: Cardinal;
begin
  Hora := Segundos div 3600;
  Seg := Segundos mod 3600;
  Min := Seg div 60;
  Seg := Seg mod 60;
  Result := FormatFloat(',00', Hora) + ':' +
  FormatFloat('00', Min) + ':' +
  FormatFloat('00', Seg);
end;
procedure TfrmFabricar.btnProximoIngredienteClick(Sender: TObject);
begin
  Timer1.Enabled:=false;
  NextIngrediente;
end;

end.
