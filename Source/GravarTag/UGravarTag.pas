unit UGravarTag;

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
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.Grid.Style,
  Fmx.Bind.Grid, Data.Bind.Grid, FMX.ScrollBox, FMX.Grid;

type
  TfrmGravaTag = class(TForm)
    Layout1: TLayout;
    recTop: TRectangle;
    Layout10: TLayout;
    lbl_titulo: TLabel;
    btnClose: TImage;
    Layout2: TLayout;
    gridCurrais: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Label1: TLabel;
    lblCurral: TLabel;
    Rectangle20: TRectangle;
    edtTagInicio: TEdit;
    Label2: TLabel;
    Rectangle2: TRectangle;
    edtTagFim: TEdit;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    btnTagIni: TButton;
    btnTagFim: TButton;
    RecControles: TRectangle;
    Layout40: TLayout;
    btnIniciarLeitura: TRectangle;
    Image10: TImage;
    ShadowEffect5: TShadowEffect;
    lblIniciaLeitura: TLabel;
    ClearEditButton1: TClearEditButton;
    ClearEditButton2: TClearEditButton;
    btnSalvarTag: TButton;
    Rectangle3: TRectangle;
    IdTCPClient1: TIdTCPClient;
    procedure gridCurraisCellClick(const Column: TColumn; const Row: Integer);
    procedure gridCurraisSelChanged(Sender: TObject);
    procedure btnIniciarLeituraClick(Sender: TObject);
    procedure btnTagIniClick(Sender: TObject);
    procedure btnTagFimClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSalvarTagClick(Sender: TObject);
  private
    TaskCLP : ITask;
    vClose:integer;
    vIniciaLeitura,BTagIniFim:integer;
    procedure Connectclp(host,port:string);//clp
    procedure ShowMsg(vTpMsg,vTpMsgBtn,vTpMsge: string);
    function  Busca(texto: string; posicao: integer): string;
  public
    { Public declarations }
  end;

var
  frmGravaTag: TfrmGravaTag;

implementation

{$R *.fmx}

uses UPrincipal, UDmDb,Umsg;

procedure TfrmGravaTag.btnCloseClick(Sender: TObject);
begin
 if TaskCLP <> nil then
  if TaskCLP.Status <> TTaskStatus.Canceled then
    TaskCLP.Cancel;
  if IdTCPClient1.connected then
  begin
   IdTCPClient1.IOHandler.InputBuffer.clear;
   IdTCPClient1.Disconnect;
  end;
 CLOSE;
end;

procedure TfrmGravaTag.btnIniciarLeituraClick(Sender: TObject);
begin
 if lblIniciaLeitura.text='Inicia Leitura' then
 begin
  vIniciaLeitura:=1;
  lblIniciaLeitura.text:='Parar Leitura'
 end
 else
 begin
  vIniciaLeitura:=0;
  lblIniciaLeitura.text:='Inicia Leitura'
 end;
end;

procedure TfrmGravaTag.btnSalvarTagClick(Sender: TObject);
var
 vVerificaTag:string;
begin
 udb.Currais.Edit;
 vVerificaTag :='';
 if edtTagInicio.Text.Length>0 then
 begin
   if edtTagInicio.Text=edtTagFim.Text then
   begin
    ShowMsg('0','0','Tag Inicio nao pode igual Tag Fim!!');
    Exit;
   end;
 end;
 if BTagIniFim=1 then
 begin
   if edtTagInicio.Text.Length>0 then
   begin
    vVerificaTag := udb.VerificaTagEmUso(udb.CurraisID.AsString,'1',edtTagInicio.Text);
    if vVerificaTag<>'OK' then
    begin
     ShowMsg('0','0',vVerificaTag);
     Exit;
    end;
    udb.CurraisTAG_INICIO.AsString := edtTagInicio.Text;
   end
   else
    udb.CurraisTAG_INICIO.AsVariant := null;
   vVerificaTag :='';
 end;
 if BTagIniFim=2 then
 begin
   if edtTagFim.Text.Length>0 then
   begin
    vVerificaTag := udb.VerificaTagEmUso(udb.CurraisID.AsString,'2',edtTagFim.Text);
    if vVerificaTag<>'OK' then
    begin
     ShowMsg('0','0',vVerificaTag);
     Exit;
    end;
    udb.CurraisTAG_FIM.AsString := edtTagFim.Text;
   end
   else
    udb.CurraisTAG_FIM.AsVariant := null;
 end;
 try
   udb.Currais.ApplyUpdates(-1);
   ShowMsg('0','0','Tag Atualizada com sucesso!!');
   udb.Currais.Close;
   udb.Currais.Open;
   btnTagIni.Enabled := true;
   btnTagFim.Enabled := true;
  except
  on E : Exception do
   ShowMsg('1','0','Erro ao Gravar Tag: '+e.Message);
 end;
end;

procedure TfrmGravaTag.btnTagFimClick(Sender: TObject);
begin
 BTagIniFim:=2;
 btnTagIni.Enabled := false;
end;

procedure TfrmGravaTag.btnTagIniClick(Sender: TObject);
begin
 BTagIniFim:=1;
 btnTagFim.Enabled := false;
end;

function TfrmGravaTag.Busca(texto: string; posicao: integer): string;
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

procedure TfrmGravaTag.Connectclp(host, port: string);
var
 vPeso:Integer;
 Buffer: TIdBytes;
begin
 IdTCPClient1.Host := host;
 IdTCPClient1.Port := strToInt(port);
 try
  IdTCPClient1.Connect;
  btnIniciarLeitura.Fill.Color := TAlphaColorRec.darkGreen;
  lblIniciaLeitura.Text        := 'Inicia Leitura';
  btnIniciarLeitura.Enabled    := true;
  TaskClp := TTask.Create(
  procedure()
  var
   vTagInicio,vTagFim,vString:string;
  begin
   while TaskCLP.Status <> TTaskStatus.Canceled do
   begin
    try
      if vIniciaLeitura=1 then
      begin
        while vIniciaLeitura=1 do
        begin
          vString    := IdTCPClient1.IOHandler.ReadLn;
         if vString.Length>0 then
         begin
          vTagInicio := Busca(vString,3);

          if vTagInicio.Length>0 then
          begin
           TThread.Synchronize(nil, procedure
           begin
             if BTagIniFim=1 then
              edtTagInicio.Text := vTagInicio;
             if BTagIniFim=2then
              edtTagFim.Text := vTagInicio;
           end);
          end;
         end;
        end;
      end;
    except
     on E: Exception do
      frmPrincipal.ShowMsg('1','0','Erro ao comunicado com CLP!:'+e.Message);
    end;
   end;//while TaskCLP.Status
  end);
  TaskClp.Start;
 except
    on E: Exception do
    begin
      TThread.Synchronize(nil, procedure
      begin
       btnIniciarLeitura.Fill.Color := TAlphaColorRec.darkGreen;
       lblIniciaLeitura.Text        := 'Desconectado';
       btnIniciarLeitura.Enabled    := false;
      end);
      frmPrincipal.ShowMsg('1','0','Erro ao comunicado com CLP!:'+e.Message);
    end;
 end;
end;

procedure TfrmGravaTag.FormShow(Sender: TObject);
begin
 Connectclp(frmPrincipal.HostClp,frmPrincipal.PortaClp);
 udb.Currais.Close;
 udb.Currais.Open;
end;

procedure TfrmGravaTag.gridCurraisCellClick(const Column: TColumn;
  const Row: Integer);
begin
 if udb.CurraisNOME.AsString.Length>0 then
 begin
  lblCurral.Text     := udb.CurraisNOME.AsString;
  edtTagInicio.Text  := udb.CurraisTAG_INICIO.AsString;
  edtTagFim.Text     := udb.CurraisTAG_fim.AsString;
 end;
end;

procedure TfrmGravaTag.gridCurraisSelChanged(Sender: TObject);
begin
 if udb.CurraisNOME.AsString.Length>0 then
 begin
  lblCurral.Text := udb.CurraisNOME.AsString;
  edtTagInicio.Text  := udb.CurraisTAG_INICIO.AsString;
  edtTagFim.Text     := udb.CurraisTAG_fim.AsString;
 end;
end;

procedure TfrmGravaTag.ShowMsg(vTpMsg, vTpMsgBtn, vTpMsge: string);
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

end.
