unit UFabricacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.DateTimeCtrls, FMX.ListBox, FMX.Effects,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.TabControl,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.ActnList, System.Actions;

type
  TfrmFabricacao = class(TForm)
    TbPrincipal: TTabControl;
    tbiLista: TTabItem;
    rect_update: TRectangle;
    Layout2: TLayout;
    Layout1: TLayout;
    img_seta: TImage;
    layloginCenter: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    layInf: TLayout;
    recTop: TRectangle;
    Layout10: TLayout;
    lbl_titulo: TLabel;
    btnClose: TImage;
    tbiCad: TTabItem;
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
    Layout17: TLayout;
    btnFabricar: TRectangle;
    ShadowEffect6: TShadowEffect;
    Image6: TImage;
    ShadowEffect8: TShadowEffect;
    Label9: TLabel;
    layInfMnu: TLayout;
    Rectangle10: TRectangle;
    lblUsuarioLogado: TLabel;
    lblVersao: TLabel;
    recTopMnu: TRectangle;
    layTopmnu: TLayout;
    Label11: TLabel;
    btnFechaCad: TImage;
    Layout3: TLayout;
    Label1: TLabel;
    Layout5: TLayout;
    Rectangle2: TRectangle;
    edtFData: TDateEdit;
    Label2: TLabel;
    Rectangle3: TRectangle;
    Label3: TLabel;
    Rectangle23: TRectangle;
    edtFTrato: TEdit;
    Rectangle24: TRectangle;
    Layout6: TLayout;
    Layout8: TLayout;
    Rectangle25: TRectangle;
    Layout7: TLayout;
    Label20: TLabel;
    lblCoutFabricacao: TLabel;
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
    ListaFabricacao: TListView;
    btnExcluiItem: TRectangle;
    Image10: TImage;
    lblExcluir: TLabel;
    StyleBook1: TStyleBook;
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
    cbxRacaoF: TComboBox;
    Layout14: TLayout;
    Label6: TLabel;
    Rectangle31: TRectangle;
    cbxFabricaRacao: TComboBox;
    Rectangle32: TRectangle;
    Layout39: TLayout;
    Rectangle33: TRectangle;
    Layout40: TLayout;
    Label7: TLabel;
    Rectangle34: TRectangle;
    cbxFabricaTrato: TComboBox;
    Label8: TLabel;
    Rectangle35: TRectangle;
    B: TLayout;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    lblTextPromtRacao: TLabel;
    lblTextPromtTrato: TLabel;
    edtFabricaPrevistoKG: TEdit;
    Label12: TLabel;
    Rectangle37: TRectangle;
    cbxFabricaOperador: TComboBox;
    lblTextPromtOperador: TLabel;
    btnNovaFabricacao: TRectangle;
    Image1: TImage;
    ShadowEffect2: TShadowEffect;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ListaFabricacaoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnCloseClick(Sender: TObject);
    procedure ListaFabricacaoItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnFechaIngredienteClick(Sender: TObject);
    procedure edtFTratoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtFDataChange(Sender: TObject);
    procedure cbxRacaoFChange(Sender: TObject);
    procedure edtFTratoChangeTracking(Sender: TObject);
    procedure btnFabricarClick(Sender: TObject);
    procedure btnNovaFabricacaoClick(Sender: TObject);
    procedure btnFechaCadClick(Sender: TObject);
    procedure edtFabricaPrevistoKGKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure cbxFabricaRacaoChange(Sender: TObject);
    procedure cbxFabricaOperadorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cbxFabricaTratoChange(Sender: TObject);
  private
    vIdFabricacao,vIdRacao,
    vIdOperador:string;
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
  public
    procedure GeraListaFabricacao(vFiltro: string);
    procedure GeraListaIngrediente(idFabricacao:string);
    procedure CarregaComboFiltro;
    procedure FiltroLista;
    Procedure StyleComboBoxItems(ComboBox:TComboBox;Size:Single);
  end;

var
  frmFabricacao: TfrmFabricacao;

implementation

{$R *.fmx}

uses UDmDb, UPrincipal, UFabricar, Umsg;

procedure TfrmFabricacao.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmFabricacao.btnConfirmarClick(Sender: TObject);
begin
 udb.vMsgConfirm :=1;
 Close;
end;

procedure TfrmFabricacao.btnFabricarClick(Sender: TObject);
begin
  if cbxFabricaRacao.ItemIndex=-1 then
  begin
    frmPrincipal.ShowMsg('0','0','Informe a Ração!!');
    Exit;
  end;
  if cbxFabricaTrato.ItemIndex=-1 then
  begin
    frmPrincipal.ShowMsg('0','0','Informe o Trato!!');
    Exit;
  end;
  if cbxFabricaOperador.ItemIndex=-1 then
  begin
    frmPrincipal.ShowMsg('0','0','Informe o Operador!!');
    Exit;
  end;
  if(edtFabricaPrevistoKG.Text.Length=0) or (edtFabricaPrevistoKG.Text='0') then
  begin
    frmPrincipal.ShowMsg('0','0','Informe o Previsto!!');
    Exit;
  end;
  udb.InsereFabricacao(
   vIdRacao,
   vIdOperador,
   cbxFabricaTrato.Selected.Text,
   StringReplace(edtFabricaPrevistoKG.Text,',','.',[rfReplaceAll]));
   frmFabricar := TfrmFabricar.Create(Self);
   try
     udb.vContinua :=0;
     frmFabricar.ShowModal(
     procedure(ModalResult: TModalResult)
     begin
       GeraListaFabricacao('');
       MudarAba(tbiLista,sender);
     end);
   finally
     frmFabricar.free;
   end;
end;

procedure TfrmFabricacao.btnFechaCadClick(Sender: TObject);
begin
 GeraListaFabricacao('');
 MudarAba(tbiLista,Sender);
end;

procedure TfrmFabricacao.btnFechaIngredienteClick(Sender: TObject);
begin
 recTop.Enabled          := true;
 LayIngredientes.Visible := false;
end;

procedure TfrmFabricacao.btnNovaFabricacaoClick(Sender: TObject);
begin
 if frmPrincipal.vTipoUso=0 then
 begin
   if not udb.VerificaCarregamentoAberto then
   begin
     frmPrincipal.ShowMsg('0','0','Existe Carregamento em aberto, Finalize antes de Continuar');
     Exit;
   end;
 end;
 udb.TRacaoFabricando.Close;
 udb.TRacaoFabricando.Open;
 if udb.TRacaoFabricando.IsEmpty then
 begin
   StyleComboBoxItems(cbxFabricaRacao,20);
   StyleComboBoxItems(cbxFabricaTrato,20);
   StyleComboBoxItems(cbxFabricaOperador,20);
   cbxFabricaRacao.ItemIndex    :=-1;
   cbxFabricaTrato.ItemIndex    :=-1;
   cbxFabricaOperador.ItemIndex :=-1;
   edtFabricaPrevistoKG.Text    :='0';
   MudarAba(tbiCad,Sender);
 end
 else
 begin
  {$IFDEF MSWINDOWS}
   frmPrincipal.ShowMsg('0','1','Existe fabricação em aberto, deseja continuar a fabricação?');
   case udb.vMsgConfirm of
   1:begin
      frmFabricar := TfrmFabricar.Create(Self);
      try
        udb.vContinua :=1;
        frmFabricar.ShowModal(
        procedure(ModalResult: TModalResult)
        begin
          GeraListaFabricacao('');
          MudarAba(tbiLista,sender);
        end);
      finally
         frmFabricar.Free;
      end;
    end;
   0:begin
       frmPrincipal.ShowMsg('0','0','Fabricação Cancelado!');
       udb.CancelaFabricacao(udb.TRacaoFabricandoId.AsString);
       StyleComboBoxItems(cbxFabricaRacao,20);
       StyleComboBoxItems(cbxFabricaTrato,20);
       StyleComboBoxItems(cbxFabricaOperador,20);
       cbxFabricaRacao.ItemIndex    :=-1;
       cbxFabricaTrato.ItemIndex    :=-1;
       cbxFabricaOperador.ItemIndex :=-1;
       edtFabricaPrevistoKG.Text    :='0';
       MudarAba(tbiCad,Sender);
     end;
   end;
  {$ENDIF}
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   MessageDlg('Existe fabricação em aberto, deseja continuar a fabricação?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
  procedure(const AResult: System.UITypes.TModalResult)
  begin
    case AResult of
     mrYES:
       begin
          frmFabricar := TfrmFabricar.Create(Self);
          try
            UDB.vContinua :=1;
            frmFabricar.ShowModal(
            procedure(ModalResult: TModalResult)
            begin
              GeraListaFabricacao('');
              MudarAba(tbiLista,sender);
            end);
          finally
             frmFabricar.Free;
          end;
       end;
     mrNo:
       begin
       frmPrincipal.ShowMsg('0','0','Fabricação Cancelado!');
       udb.CancelaFabricacao(udb.TRacaoFabricandoId.AsString);
       StyleComboBoxItems(cbxFabricaRacao,20);
       StyleComboBoxItems(cbxFabricaTrato,20);
       StyleComboBoxItems(cbxFabricaOperador,20);
       cbxFabricaRacao.ItemIndex    :=-1;
       cbxFabricaTrato.ItemIndex    :=-1;
       cbxFabricaOperador.ItemIndex :=-1;
       edtFabricaPrevistoKG.Text    :='0';
       MudarAba(tbiCad,Sender);
     end;
    end;
   end);
  {$ENDIF}
 end;
end;



procedure TfrmFabricacao.CarregaComboFiltro;
begin
 cbxRacaoF.Items.Clear;
 cbxFabricaRacao.Items.Clear;
 cbxRacaoF.Items.Add('Todas');
 udb.Racao.Close;
 udb.Racao.Open;
 udb.Racao.First;
 while not udb.Racao.Eof do
 begin
   cbxRacaoF.Items.Add(udb.RacaoNome.AsString);
   cbxFabricaRacao.Items.Add(udb.RacaoNome.AsString);
   udb.Racao.Next;
 end;
 cbxRacaoF.ItemIndex       :=0;
 cbxFabricaRacao.ItemIndex :=-1;

 cbxFabricaOperador.Items.Clear;
 udb.Operador.Close;
 udb.Operador.Open;
 udb.Operador.First;
 while not udb.Operador.eof do
 begin
  cbxFabricaOperador.Items.Add(udb.OperadorNome.AsString);
  udb.Operador.Next;
 end;
 cbxFabricaOperador.ItemIndex :=-1;
end;

procedure TfrmFabricacao.cbxFabricaOperadorChange(Sender: TObject);
begin
 lblTextPromtOperador.Visible := cbxFabricaOperador.ItemIndex=-1;
 if cbxFabricaOperador.ItemIndex>-1 then
   vIdOperador := udb.ReturnsIdByName('OPERADOR',cbxFabricaOperador.Selected.Text);
end;

procedure TfrmFabricacao.cbxFabricaRacaoChange(Sender: TObject);
begin
 if cbxFabricaRacao.ItemIndex>-1 then
 begin
   lblTextPromtRacao.Visible := false;
   vIdRacao := udb.ReturnsIdByName('RACAO',cbxFabricaRacao.Selected.Text);
 end
 else
   lblTextPromtRacao.Visible := false;
end;

procedure TfrmFabricacao.cbxFabricaTratoChange(Sender: TObject);
begin
  lblTextPromtTrato.Visible := cbxFabricaTrato.ItemIndex=-1;
  FiltroLista;
end;

procedure TfrmFabricacao.cbxRacaoFChange(Sender: TObject);
begin
  lblTextPromtRacao.Visible := cbxRacaoF.ItemIndex=-1;
  FiltroLista;
end;

procedure TfrmFabricacao.edtFabricaPrevistoKGKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if not (keyChar in ['0'..'9',','])
 and (ord(keychar)<>8) and (keychar<>#0)then
 begin
  beep;
  KeyChar := #0;
 end;
end;

procedure TfrmFabricacao.edtFDataChange(Sender: TObject);
begin
 FiltroLista;
end;

procedure TfrmFabricacao.edtFTratoChangeTracking(Sender: TObject);
begin
 FiltroLista;
end;

procedure TfrmFabricacao.edtFTratoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if not (keyChar in ['0'..'9',','])
 and (ord(keychar)<>8) and (keychar<>#0)then
 begin
  beep;
  KeyChar := #0;
 end;
end;

procedure TfrmFabricacao.FiltroLista;
var
 vFiltro:string;
begin
 vFiltro :='';
 vFiltro := vFiltro+' and a.data='+FormatDateTime('yyyy-mm-dd',edtFData.DateTime).QuotedString;
 if cbxRacaoF.ItemIndex>0 then
  vFiltro := vFiltro+' and b.nome='+cbxRacaoF.Selected.Text.QuotedString;
 if edtFTrato.Text.Length>0 then
  vFiltro := vFiltro+' and a.trato='+edtFTrato.Text;
 GeraListaFabricacao(vFiltro);
end;

procedure TfrmFabricacao.FormCreate(Sender: TObject);
begin
 Position :=  TFormPosition.MainFormCenter;
end;

procedure TfrmFabricacao.FormShow(Sender: TObject);
begin
 LayIngredientes.Visible := false;
 TbPrincipal.TabPosition := TTabPosition.None;
 TbPrincipal.ActiveTab   := tbiLista;
 btnExcluiItem.Visible := false;
 CarregaComboFiltro;
 GeraListaFabricacao('');
end;

procedure TfrmFabricacao.GeraListaFabricacao(vFiltro: string);
var
 item : TListViewItem;
 txt  : TListItemText;
 img  : TListItemImage;
 foto : TBitmap;
 vPrev,vReal:Double;
begin
  udb.AbreFabricacao(vFiltro);
  udb.Fabricacao.First;
  ListaFabricacao.Items.Clear;
  vPrev :=0;
  vReal :=0;
  while not udb.Fabricacao.Eof do
  begin
    with ListaFabricacao do
    begin
     item := ListaFabricacao.Items.Add;
      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('Text19'));
        txt.Text := 'Codigo';
        LayIngredientes.Align := TAlignLayout.Center;
       {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
       {$ENDIF}


        txt := TListItemText(Objects.FindDrawable('Text1'));
        txt.Text := udb.FabricacaoId.AsString;
        txt.Font.Style := [TFontStyle.fsBold];
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text8'));
        txt.Text := 'Ração';
        txt.Font.Style := [TFontStyle.fsBold];
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text9'));
        txt.Text := udb.FabricacaoRacao.AsString;
        txt.Font.Style := [TFontStyle.fsBold];
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text4'));
        txt.Text := 'Hora Ini';
        txt.Font.Style := [TFontStyle.fsBold];
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}


        txt := TListItemText(Objects.FindDrawable('Text5'));
        if udb.FabricacaoHoraIni.AsString.Length>0 then
         txt.Text := FormatDateTime('hh:mm:ss',udb.FabricacaoHoraIni.AsDateTime)
        else
         txt.Text  :='';
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}


        txt := TListItemText(Objects.FindDrawable('Text6'));
        txt.Text := 'Hora Fim';
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}
        txt.Font.Style := [TFontStyle.fsBold];

        txt := TListItemText(Objects.FindDrawable('Text7'));
        if udb.FabricacaoHoraFim.AsString.Length>0 then
         txt.Text := FormatDateTime('hh:mm:ss',udb.FabricacaoHoraFim.AsDateTime)
        else
         txt.Text  :='';
        txt.Font.Style := [TFontStyle.fsBold];
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text10'));
        txt.Text := 'Previsto';
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}
        txt.Font.Style := [TFontStyle.fsBold];

        txt := TListItemText(Objects.FindDrawable('Text11'));
        txt.Text := udb.FabricacaoPrevKG.AsString;
        txt.Font.Style := [TFontStyle.fsBold];
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text12'));
        txt.Text := 'Realizado';
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}
        txt.Font.Style := [TFontStyle.fsBold];

        txt := TListItemText(Objects.FindDrawable('Text13'));
        txt.Text := udb.FabricacaoRealizadoKG.AsString;
        txt.Font.Style := [TFontStyle.fsBold];
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text15'));
        txt.Text := 'Status';
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}
        txt.Font.Style := [TFontStyle.fsBold];

        txt := TListItemText(Objects.FindDrawable('Text16'));
        if udb.FabricacaoFinalizada.AsInteger=0 then
         txt.Text :='Aberta';
        if udb.FabricacaoFinalizada.AsInteger=1 then
         txt.Text :='Finalizada';
        txt.Font.Style := [TFontStyle.fsBold];
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}

        txt := TListItemText(Objects.FindDrawable('Text14'));
        txt.Text := 'Ingredientes';
        {$IF DEFINED(iOS) or DEFINED(ANDROID)}
        txt.Font.Size := 13;
        {$ENDIF}
        img := TListItemImage(Objects.FindDrawable('Image18'));
        img.Bitmap := frmPrincipal.imgAlimentos.Bitmap;

        img := TListItemImage(Objects.FindDrawable('Image17'));
        img.Bitmap := frmPrincipal.imgFabricacao.Bitmap;

        if udb.FabricacaoFinalizada.AsInteger =1 then
        begin
         img := TListItemImage(Objects.FindDrawable('Image22'));
         img.Bitmap  := frmPrincipal.imgRec.Bitmap;
         img.Visible := true;
        end;
        vPrev := vPrev+udb.FabricacaoPrevKG.AsFloat;
        vReal := vReal+udb.FabricacaoRealizadoKG.AsFloat;
        udb.Fabricacao.Next;
      end;
    end;
  end;
  lblCoutFabricacao.Text := intToStr(ListaFabricacao.Items.Count);
  lblTotalPrev.Text      := FormatFloat('####,##0.00',vPrev);
  lblTotalReal.Text      := FormatFloat('####,##0.00',vReal);
end;

procedure TfrmFabricacao.GeraListaIngrediente(idFabricacao: string);
var
 item : TListViewItem;
 txt  : TListItemText;
 img  : TListItemImage;
 foto : TBitmap;
begin
   udb.AbreFabricacaoIngredientes(idFabricacao);
   udb.FabricacaoAlimentos.First;
   ListaFabricacaoIngrediente.Items.Clear;
   while not udb.FabricacaoAlimentos.Eof do
   begin
      with ListaFabricacaoIngrediente do
      begin
        item := ListaFabricacaoIngrediente.Items.Add;
        with item do
        begin
          txt := TListItemText(Objects.FindDrawable('Text1'));
          txt.Text := udb.FabricacaoAlimentos.FieldByName('Alimento').AsString;
          txt.Font.Style := [TFontStyle.fsBold];
          txt.TagString  := udb.FabricacaoAlimentos.FieldByName('ID').AsString;

          txt := TListItemText(Objects.FindDrawable('Text10'));
          txt.Text := 'Previsto:';
          txt.Font.Style := [TFontStyle.fsBold];
          txt := TListItemText(Objects.FindDrawable('Text11'));
          txt.Text := udb.FabricacaoAlimentos.FieldByName('PrevKG').AsString;
          txt.Font.Style := [TFontStyle.fsBold];

          txt := TListItemText(Objects.FindDrawable('Text6'));
          txt.Visible := true;
          txt.Text := 'Ordem:';
          txt.Font.Style := [TFontStyle.fsBold];

          txt := TListItemText(Objects.FindDrawable('Text7'));
          txt.Visible := true;
          txt.Text := udb.FabricacaoAlimentos.FieldByName('Ordem').AsString;
          txt.Font.Style := [TFontStyle.fsBold];


          txt := TListItemText(Objects.FindDrawable('Text8'));
          txt.Visible := true;
          txt.Text := 'Dif.(kg):';
          txt.Font.Style := [TFontStyle.fsBold];
          txt := TListItemText(Objects.FindDrawable('Text9'));
          txt.Visible := true;
          txt.Text := StringReplace(udb.FabricacaoAlimentos.FieldByName('difKG').AsString,'-','+',[rfReplaceAll]);
          txt.Font.Style := [TFontStyle.fsBold];

          txt := TListItemText(Objects.FindDrawable('Text12'));
          txt.Text := 'Realizado:';
          txt.Font.Style := [TFontStyle.fsBold];
          txt := TListItemText(Objects.FindDrawable('Text13'));
          txt.Text := udb.FabricacaoAlimentos.FieldByName('RealizadoKG').AsString;
          txt.Font.Style := [TFontStyle.fsBold];

          img := TListItemImage(Objects.FindDrawable('Image17'));
          img.Bitmap := frmPrincipal.imgCarrega.Bitmap;
          udb.FabricacaoAlimentos.Next;
        end;
      end;
   end;
end;

procedure TfrmFabricacao.ListaFabricacaoItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
   vIdFabricacao :=
   TAppearanceListViewItem(ListaFabricacao.Selected).Objects.FindObjectT<TListItemText>
   ('Text1').Text;
   if ItemObject is TListItemImage then
   begin
    if TListItemImage(ItemObject).Name='Image18' then
    begin
     {$IF DEFINED(iOS) or DEFINED(ANDROID)}
       LayIngredientes.Width  := frmPrincipal.Width;
       LayIngredientes.Height := frmPrincipal.Height;
       LayIngredientes.Align  := TAlignLayout.Client;
     {$ENDIF}
     {$IFDEF MSWINDOWS}
       LayIngredientes.Align := TAlignLayout.Center;
     {$ENDIF}
     recTop.Enabled          := false;
     GeraListaIngrediente(vIdFabricacao);
     LayIngredientes.Visible := true;
     LayIngredientes.Opacity := 0;
     LayIngredientes.AnimateFloatDelay('Opacity', 0.95, 0.2, 0.5);
     Exit;
    end;
   end;
end;

procedure TfrmFabricacao.ListaFabricacaoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
 img: TListItemImage;
 txt : TListItemText;
begin
 with AItem do
 begin
   img               := TListItemImage(Objects.FindDrawable('Image18'));
   img.PlaceOffset.X := trunc(ListaFabricacao.Width-(img.Width+10));

   txt := TListItemText(Objects.FindDrawable('Text14'));
   txt.PlaceOffset.X := trunc(ListaFabricacao.Width-(img.Width+10));

 end;
end;

procedure TfrmFabricacao.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(sender);
end;



procedure TfrmFabricacao.StyleComboBoxItems(ComboBox: TComboBox; Size: Single);
var
  Item : TListBoxItem;
  i : Integer;
begin
  for i := 0 to ComboBox.Count-1 do begin
    Item := ComboBox.ListItems[i];
    Item.Font.Size := Size;
//    Item.Font.Family := Family; //'Arial';
    // Item.FontColor := TAlphaColorRec.Red;
    Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Family,TStyledSetting.Size,TStyledSetting.FontColor];
  end;
end;

end.
