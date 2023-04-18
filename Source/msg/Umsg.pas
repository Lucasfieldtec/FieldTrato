unit Umsg;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Effects;

type
  Tmsg = class(TForm)
    Layout1: TLayout;
    layloginCenter: TLayout;
    recMsg: TRectangle;
    Layout4: TLayout;
    Layout3: TLayout;
    lblMsgHeader: TLabel;
    Layout2: TLayout;
    btnCancelar: TRectangle;
    ShadowEffect5: TShadowEffect;
    Image5: TImage;
    ShadowEffect3: TShadowEffect;
    Label8: TLabel;
    btnConfirmar: TRectangle;
    ShadowEffect1: TShadowEffect;
    Image1: TImage;
    ShadowEffect2: TShadowEffect;
    Label1: TLabel;
    TmMsg: TTimer;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    lblMsgTxt: TLabel;
    img_seta: TImage;
    procedure btnCloseClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure TmMsgTimer(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    vTipoMsg,vTipoMsgBtn,vMsg:string;//var form msg;
    procedure ShowMsg(vTpMsg,vTpMsgBtn,vTpMsge: string);
  end;

var
  msg: Tmsg;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}

uses UDmDb, UPrincipal;

procedure Tmsg.btnCancelarClick(Sender: TObject);
begin
 udb.vMsgConfirm :=0;
 Close;
end;

procedure Tmsg.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tmsg.btnConfirmarClick(Sender: TObject);
begin
 udb.vMsgConfirm :=1;
 Close;
end;

procedure Tmsg.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
 if key=13 then
  Close;
end;

procedure Tmsg.ShowMsg(vTpMsg, vTpMsgBtn, vTpMsge: string);
begin
  vTipoMsg    :=vTpMsg;
  vTipoMsgBtn :=vTpMsgBtn;
  vMsg        :=vTpMsge;
  if vTipoMsg='0' then
  begin
   msg.lblMsgHeader.Text   :='Atenção';
   msg.recMsg.Stroke.Color :=  TAlphaColorRec.Yellow;
  end;
  if vTipoMsg='1' then
  begin
   msg.lblMsgHeader.Text   :='Erro';
   msg.recMsg.Stroke.Color :=TAlphaColorRec.Red;
  end;
  if vTipoMsg='2' then
  begin
   msg.lblMsgHeader.Text   :='Mensagem';
   msg.recMsg.Stroke.Color :=TAlphaColorRec.Green;
  end;
  msg.lblMsgTxt.Text       :=vMsg;
  msg.btnCancelar.Visible  :=vTipoMsgBtn='1';

  udb.vMsgConfirm :=0;
  recMsg.Opacity  :=0;
  TmMsg.Enabled := true;
  recMsg.AnimateFloatDelay('Opacity', 0.9, 0.2, 0.5);
end;

procedure Tmsg.TmMsgTimer(Sender: TObject);
begin
  if recMsg.Stroke.Color=TAlphaColorRec.Black then
  begin
   if vTipoMsg='0' then
    recMsg.Stroke.Color :=  TAlphaColorRec.Yellow;
   if vTipoMsg='1' then
    recMsg.Stroke.Color :=  TAlphaColorRec.Red;
   if vTipoMsg='2' then
    recMsg.Stroke.Color :=  TAlphaColorRec.Green;
  end
  else
  begin
   recMsg.Stroke.Color :=  TAlphaColorRec.Black;
  end;
end;

end.
