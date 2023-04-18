unit UWsField;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Horse,
  Horse.Jhonson,System.JSON, Horse.HandleException, FMX.ScrollBox, FMX.Memo,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.TabControl, FMX.TreeView, System.Rtti, FMX.Grid.Style, FMX.Grid,
  FMX.Effects, FMX.DateTimeCtrls, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.ListBox, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, FMX.dxGrid,
  Data.DB, FMX.dxControlUtils, FMX.dxControls, FMX.dxCustomization,
  FMX.dxLayoutControl, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid,
  Data.Bind.DBScope,Winapi.Windows, FMX.Menus,DateUtils;

type
  TfrmPrincipal = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    TreeMNU: TTreeView;
    TreeMnuLog: TTreeViewItem;
    TreeMnuForn: TTreeViewItem;
    TreeMnuFab: TTreeViewItem;
    tbPrincipal: TTabControl;
    tbiLog: TTabItem;
    tbiForn: TTabItem;
    tbiFab: TTabItem;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    lblVersao: TLabel;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    memoLog: TMemo;
    Layout5: TLayout;
    Layout9: TLayout;
    layloginCenter: TLayout;
    Rectangle4: TRectangle;
    Layout10: TLayout;
    Layout11: TLayout;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Layout12: TLayout;
    Rectangle8: TRectangle;
    edtFData: TDateEdit;
    Rectangle9: TRectangle;
    Rectangle23: TRectangle;
    cbxTratoF: TComboBox;
    Rectangle24: TRectangle;
    Layout13: TLayout;
    Layout14: TLayout;
    Rectangle25: TRectangle;
    Layout15: TLayout;
    Label20: TLabel;
    lblCoutFabricacao: TLabel;
    btnSyncForne: TRectangle;
    Image3: TImage;
    ShadowEffect2: TShadowEffect;
    Label9: TLabel;
    Rectangle26: TRectangle;
    Layout16: TLayout;
    Label21: TLabel;
    lblTotalReal: TLabel;
    Rectangle27: TRectangle;
    Layout35: TLayout;
    Label23: TLabel;
    lblTotalPrev: TLabel;
    Rectangle28: TRectangle;
    img_seta: TImage;
    Layout36: TLayout;
    layInf: TLayout;
    Rectangle11: TRectangle;
    recTop: TRectangle;
    Layout17: TLayout;
    lbl_titulo: TLabel;
    rect_update: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Image1: TImage;
    Layout8: TLayout;
    Rectangle5: TRectangle;
    Layout18: TLayout;
    Layout19: TLayout;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Layout20: TLayout;
    Rectangle6: TRectangle;
    edtDataFabricacao: TDateEdit;
    Rectangle7: TRectangle;
    Rectangle12: TRectangle;
    edtFTrato: TEdit;
    Rectangle13: TRectangle;
    Layout21: TLayout;
    Layout22: TLayout;
    Rectangle14: TRectangle;
    Layout23: TLayout;
    Label7: TLabel;
    lblTotalFabricacoes: TLabel;
    Rectangle15: TRectangle;
    Layout24: TLayout;
    Label11: TLabel;
    lblTotalRealizado: TLabel;
    Rectangle16: TRectangle;
    Layout25: TLayout;
    Label13: TLabel;
    lblTotalPrevisto: TLabel;
    Rectangle17: TRectangle;
    Layout26: TLayout;
    Rectangle18: TRectangle;
    Layout28: TLayout;
    Label16: TLabel;
    btnBuscar: TButton;
    EDTRacaoFiltro: TEdit;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    imgForn: TImage;
    ShadowEffect14: TShadowEffect;
    btnBuscaFab: TButton;
    edtRacaoF: TEdit;
    LayIngredientes: TLayout;
    recIngredientes: TRectangle;
    Rectangle29: TRectangle;
    Layout37: TLayout;
    Label25: TLabel;
    btnFechaIngrediente: TImage;
    Layout38: TLayout;
    Rectangle30: TRectangle;
    dsFornecimento: TDataSource;
    GridForneciento: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    GridFabricacao: TStringGrid;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    StyleBook1: TStyleBook;
    btnSyncFabricacao: TRectangle;
    Image2: TImage;
    ShadowEffect1: TShadowEffect;
    Label8: TLabel;
    Rectangle10: TRectangle;
    cbxSync: TComboBox;
    Label10: TLabel;
    StringGrid1: TStringGrid;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    Layout27: TLayout;
    Label12: TLabel;
    lblTotalFab: TLabel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    lblVersaoExe: TLabel;
    popMnuFab: TPopupMenu;
    popMnuFabInsumo: TPopupMenu;
    popMnuForne: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Label14: TLabel;
    Rectangle19: TRectangle;
    cbxStatus: TComboBox;
    layKeyTotal: TLayout;
    Rectangle20: TRectangle;
    layKey: TLayout;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    Image77: TImage;
    Layout102: TLayout;
    Layout103: TLayout;
    Rectangle31: TRectangle;
    Label15: TLabel;
    edtSerialHD: TEdit;
    Rectangle32: TRectangle;
    Label17: TLabel;
    edtKey: TEdit;
    Layout104: TLayout;
    Layout105: TLayout;
    btnValidaKey: TRectangle;
    Layout106: TLayout;
    Image78: TImage;
    Label18: TLabel;
    procedure FormShow(Sender: TObject);
    procedure TreeMnuFornClick(Sender: TObject);
    procedure TreeMnuFabClick(Sender: TObject);
    procedure TreeMnuLogClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnBuscaFabClick(Sender: TObject);
    procedure GridFornecientoEditingDone(Sender: TObject; const ACol,
      ARow: Integer);
    procedure btnSyncFabricacaoClick(Sender: TObject);
    procedure btnFechaIngredienteClick(Sender: TObject);
    procedure GridFabricacaoCellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure StringGrid1EditingDone(Sender: TObject; const ACol,
      ARow: Integer);
    procedure btnSyncForneClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure btnValidaKeyClick(Sender: TObject);
  private
    function GetVersaoArqWin: string;
  public
    vDataKey : string;
    DataKey  :TDate;
    procedure GeraLista(vFiltro: string);
    procedure FiltroLista;
    procedure GeraListaFabricacao(vFiltro: string);
    procedure SomarColunasGrid;
    function  ValidaKey(Serial,Chave: String): Boolean;
    function  ValidadeKey(Chave: String): Tdate;
    function  GetIdeDiskSerialNumber : String;
    Function  SerialNum(FDrive:String) :String;
    procedure ChangeByteOrder(var Data; Size: Integer);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses dmDB, UdmLeitura, UdmSqlite;

function TfrmPrincipal.GetIdeDiskSerialNumber: String;
type
    TSrbIoControl = packed record
      HeaderLength: ULONG;
      Signature: Array[0..7] of Char;
      Timeout: ULONG;
      ControlCode: ULONG;
      ReturnCode: ULONG;
      Length: ULONG;
   end;
   SRB_IO_CONTROL = TSrbIoControl;
   PSrbIoControl = ^TSrbIoControl;

    TIDERegs = packed record
      bFeaturesReg : Byte;
      bSectorCountReg : Byte;
      bSectorNumberReg : Byte;
      bCylLowReg : Byte;
      bCylHighReg : Byte;
      bDriveHeadReg : Byte;
      bCommandReg : Byte;
      bReserved : Byte;
   end;
    IDEREGS = TIDERegs;
    PIDERegs = ^TIDERegs;

   TSendCmdInParams = packed record
      cBufferSize : DWORD;
      irDriveRegs : TIDERegs;
      bDriveNumber : Byte;
      bReserved : Array[0..2] of Byte;
      dwReserved : Array[0..3] of DWORD;
      bBuffer : Array[0..0] of Byte;
    end;
    SENDCMDINPARAMS = TSendCmdInParams;
    PSendCmdInParams = ^TSendCmdInParams;

    TIdSector = packed record
      wGenConfig : Word;
      wNumCyls : Word;
      wReserved : Word;
      wNumHeads : Word;
      wBytesPerTrack : Word;
      wBytesPerSector : Word;
      wSectorsPerTrack : Word;
      wVendorUnique : Array[0..2] of Word;
      sSerialNumber : Array[0..19] of Char;
      wBufferType : Word;
      wBufferSize : Word;
      wECCSize : Word;
      sFirmwareRev : Array[0..7] of Char;
      sModelNumber : Array[0..39] of Char;
      wMoreVendorUnique : Word;
      wDoubleWordIO : Word;
      wCapabilities : Word;
      wReserved1 : Word;
      wPIOTiming : Word;
      wDMATiming : Word;
      wBS : Word;
      wNumCurrentCyls : Word;
      wNumCurrentHeads : Word;
      wNumCurrentSectorsPerTrack : Word;
      ulCurrentSectorCapacity : ULONG;
      wMultSectorStuff : Word;
      ulTotalAddressableSectors : ULONG;
      wSingleWordDMA : Word;
      wMultiWordDMA : Word;
      bReserved : Array[0..127] of Byte;
    end;
    PIdSector = ^TIdSector;

  const
    IDE_ID_FUNCTION = $EC;
    IDENTIFY_BUFFER_SIZE = 512;
    DFP_RECEIVE_DRIVE_DATA = $0007c088;
    IOCTL_SCSI_MINIPORT = $0004d008;
    IOCTL_SCSI_MINIPORT_IDENTIFY = $001b0501;
    DataSize = sizeof(TSendCmdInParams)-1+IDENTIFY_BUFFER_SIZE;
    BufferSize = SizeOf(SRB_IO_CONTROL)+DataSize;
    W9xBufferSize = IDENTIFY_BUFFER_SIZE+16;
  var
    hDevice : THandle;
    cbBytesReturned : DWORD;
    pInData : PSendCmdInParams;
    pOutData : Pointer;
    Buffer : Array[0..BufferSize-1] of Byte;
    srbControl : TSrbIoControl absolute Buffer;

  begin
    Result := '';
    FillChar(Buffer,BufferSize,#0);
    if Win32Platform=VER_PLATFORM_WIN32_NT then
    begin
      hDevice := CreateFile('\\.\Scsi0:',
      GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE,  nil, OPEN_EXISTING, 0, 0);
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        srbControl.HeaderLength := SizeOf(SRB_IO_CONTROL);
        System.Move('SCSIDISK',srbControl.Signature,8);
        srbControl.Timeout := 2;
        srbControl.Length := DataSize;
        srbControl.ControlCode := IOCTL_SCSI_MINIPORT_IDENTIFY;
        pInData := PSendCmdInParams(PChar(@Buffer)
        +SizeOf(SRB_IO_CONTROL));
        pOutData := pInData;
       with pInData^ do
       begin
         cBufferSize := IDENTIFY_BUFFER_SIZE;
         bDriveNumber := 0;
         with irDriveRegs do
         begin
           bFeaturesReg := 0;
           bSectorCountReg := 1;
           bSectorNumberReg := 1;
           bCylLowReg := 0;
           bCylHighReg := 0;
           bDriveHeadReg := $A0;
           bCommandReg := IDE_ID_FUNCTION;
         end;
      end;
      if not DeviceIoControl( hDevice, IOCTL_SCSI_MINIPORT, @Buffer, BufferSize, @Buffer, BufferSize, cbBytesReturned, nil ) then Exit;
     finally
       CloseHandle(hDevice);
     end;
   end
   else
   begin
      hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        pInData := PSendCmdInParams(@Buffer);
        pOutData := @pInData^.bBuffer;
        with pInData^ do
        begin
           cBufferSize := IDENTIFY_BUFFER_SIZE;
           bDriveNumber := 0;
           with irDriveRegs do
           begin
             bFeaturesReg := 0;
             bSectorCountReg := 1;
             bSectorNumberReg := 1;
             bCylLowReg := 0;
             bCylHighReg := 0;
             bDriveHeadReg := $A0;
             bCommandReg := IDE_ID_FUNCTION;
           end;
         end;
         if not DeviceIoControl( hDevice, DFP_RECEIVE_DRIVE_DATA, pInData, SizeOf(TSendCmdInParams)-1, pOutData, W9xBufferSize, cbBytesReturned, nil ) then Exit;
        finally
          CloseHandle(hDevice);
        end;
     end;
     with PIdSector(PChar(pOutData)+16)^ do
     begin
        ChangeByteOrder(sSerialNumber,SizeOf(sSerialNumber));
        SetString(Result,sSerialNumber,SizeOf(sSerialNumber));
     end;
end;

procedure TfrmPrincipal.ChangeByteOrder(var Data; Size: Integer);
var
  ptr : PChar;
  i : Integer;
  c : Char;
begin
  ptr := @Data;
  for i := 0 to (Size shr 1)-1 do
  begin
    c := ptr^;
    ptr^ := (ptr+1)^;
    (ptr+1)^ := c;
    Inc(ptr,2);
  end;
end;

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


procedure TfrmPrincipal.btnBuscaFabClick(Sender: TObject);
begin
 FiltroLista;
end;

procedure TfrmPrincipal.FiltroLista;
var
 vFiltro:string;
begin
 vFiltro :='';
 vFiltro := vFiltro+' and data='+FormatDateTime('yyyy-mm-dd',edtDataFabricacao.DateTime).QuotedString;
 if edtRacaoF.Text.Length>0 then
  vFiltro := vFiltro+' and RACAO LIKE '+QuotedStr('%'+edtRacaoF.Text+'%');
 if edtFTrato.Text.Length>0 then
  vFiltro := vFiltro+' and trato='+edtFTrato.Text;
 if cbxSync.ItemIndex>0 then
 begin
   if cbxSync.ItemIndex=1 then
    vFiltro := vFiltro+' and sync=0';
   if cbxSync.ItemIndex=2 then
    vFiltro := vFiltro+' and sync=1';
 end;


 GeraListaFabricacao(vFiltro);
end;

procedure TfrmPrincipal.GeraListaFabricacao(vFiltro: string);
var
 item : TListViewItem;
 txt  : TListItemText;
 img  : TListItemImage;
 foto : TBitmap;
 vPrev,vReal:Double;
begin
  dmSqlite.AbreFabricacao(vFiltro);
  dmSqlite.Fabricacao.Aggregates.Clear;
  if dmSqlite.Fabricacao.RecordCount>0 then
  begin
    with dmSqlite.Fabricacao.Aggregates.Add do
    begin
      Name := 'PrevKG';
      Expression := 'sum(PrevKG)';
      Active := True;
    end;
    dmSqlite.Fabricacao.AggregatesActive := True;
    lblTotalPrevisto.Text :=FormatFloat('####,##0.00',dmSqlite.Fabricacao.Aggregates[0].Value);

    with dmSqlite.Fabricacao.Aggregates.Add do
    begin
      Name := 'RealizadoKG';
      Expression := 'sum(RealizadoKG)';
      Active := True;
    end;
    dmSqlite.Fabricacao.AggregatesActive := True;
    lblTotalRealizado.Text :=FormatFloat('####,##0.00',dmSqlite.Fabricacao.Aggregates[1].Value);
  end;
  lblTotalFabricacoes.Text := intToStr(gridFabricacao.RowCount);
end;

procedure TfrmPrincipal.GridFabricacaoCellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  dmSqlite.AbreFabricacaoAlimento(dmSqlite.FabricacaoId.AsString);
  SomarColunasGrid;
  LayIngredientes.Visible := true;
end;

procedure TfrmPrincipal.GridFornecientoEditingDone(Sender: TObject; const ACol,
  ARow: Integer);
begin
 dmSqlite.Fornecimento.Edit;
 dmSqlite.FornecimentoKGREALIZADO.AsString :=
  GridForneciento.Cells[GridForneciento.col,GridForneciento.Row];
 dmSqlite.Fornecimento.ApplyUpdates(-1);
end;

procedure TfrmPrincipal.MenuItem1Click(Sender: TObject);
begin
 dmSqlite.DeletaRegistro('Fabricacao',dmSqlite.FabricacaoId.AsString);
 btnBuscaFabClick(Sender);
end;

procedure TfrmPrincipal.MenuItem2Click(Sender: TObject);
begin
 dmSqlite.DeletaRegistro('Fornecimento',dmSqlite.FornecimentoID.AsString);
 btnBuscarClick(Sender);
end;

procedure TfrmPrincipal.MenuItem3Click(Sender: TObject);
begin
 dmSqlite.DeletaRegistro('FabricacaoAlimentos',dmSqlite.FabricacaoAlimentosID.AsString);
 dmSqlite.AbreFabricacaoAlimento(dmSqlite.FabricacaoId.AsString);
 SomarColunasGrid;
end;

procedure TfrmPrincipal.StringGrid1EditingDone(Sender: TObject; const ACol,
  ARow: Integer);
begin
  dmSqlite.FabricacaoAlimentos.Edit;
 dmSqlite.FabricacaoAlimentosKGMS_REAL.AsString :=
  GridForneciento.Cells[GridForneciento.col,GridForneciento.Row];
 dmSqlite.FabricacaoAlimentos.ApplyUpdates(-1);
 SomarColunasGrid;
end;

function TfrmPrincipal.SerialNum(FDrive: String): String;
var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
 Try
  GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
  Result := IntToHex(Serial,8);
 Except
  Result :='';
 end;
end;

procedure TfrmPrincipal.SomarColunasGrid;
var
  Sum : Double;
  Val : Double;
  I   : Integer;
begin
  Sum := 0;
  val := 0;
  I   := 0;
  for I := 0 to StringGrid1.RowCount-1 do
  begin
   if TryStrToFloat(StringGrid1.Cells[3,I],Val) then
    Sum := Sum + Val;
  end;
  if I>0 then
  begin
    lblTotalFab.Text          := FormatFloat('####,##.00',(Sum));
  end
  else
  begin
    lblTotalFab.Text          := '0,00';
  end;
end;

procedure TfrmPrincipal.btnBuscarClick(Sender: TObject);
var
 vFiltro:string;
begin
 vFiltro :='';
 vFiltro := vFiltro+' and DATA='+FormatDateTime('yyyy-mm-dd',edtFData.DateTime).QuotedString;
 if EDTRacaoFiltro.Text.Length>0 then
  vFiltro := vFiltro+' and RACAO='+EDTRacaoFiltro.Text.QuotedString;
 if cbxTratoF.ItemIndex>0 then
  vFiltro := vFiltro+' and trato='+cbxTratoF.Selected.Text;
 if cbxStatus.ItemIndex>0 then
 begin
   if cbxStatus.ItemIndex=1 then
    vFiltro := vFiltro+' and sync=0';
   if cbxStatus.ItemIndex=2 then
    vFiltro := vFiltro+' and sync=1';
 end;
 GeraLista(vFiltro);
end;

procedure TfrmPrincipal.btnFechaIngredienteClick(Sender: TObject);
begin
  dmSqlite.AtualizaTotalFabricado(
   dmSqlite.FabricacaoId.AsString,
   StringReplace(StringReplace(lblTotalFab.Text,'.','',[rfReplaceAll]),
    ',','.',[rfReplaceAll]));
   FiltroLista;
   LayIngredientes.Visible := false;
end;

procedure TfrmPrincipal.btnSyncFabricacaoClick(Sender: TObject);
begin
 dmSqlite.PostFabricacaoTGC;
end;

procedure TfrmPrincipal.btnSyncForneClick(Sender: TObject);
begin
 dmSqlite.PostFornecimentoTGC;
end;

procedure TfrmPrincipal.btnValidaKeyClick(Sender: TObject);
begin
if ValidaKey(edtSerialHD.Text,edtKey.Text) then
  begin
    ShowMessage('Chave Validada com Sucesso!');
    layKeyTotal.Visible    := false;
  end
  else
  begin
    ShowMessage('Chave Invalida!');
    Exit;
  end;
end;

procedure TfrmPrincipal.GeraLista(vFiltro: string);
var
 item : TListViewItem;
 txt  : TListItemText;
 img  : TListItemImage;
 foto : TBitmap;
 vPrev,vReal:Double;
begin
  dmSqlite.Fornecimento.Aggregates.Clear;
  dmSqlite.AbreFornecimento(vFiltro);
  lblCoutFabricacao.Text := intToStr(dmSqlite.Fornecimento.RecordCount);
  with dmSqlite.Fornecimento.Aggregates.Add do
  begin
    Name := 'KGPREVISTO';
    Expression := 'SUM(KGPREVISTO)';
    Active := True;
  end;
  dmSqlite.Fornecimento.AggregatesActive := True;
  if dmSqlite.Fornecimento.Aggregates[0].Value<>NULL then
   lblTotalPrev.Text      := FormatFloat('####,##0.00',dmSqlite.Fornecimento.Aggregates[0].Value)
  else
   lblTotalPrev.Text      :='0';

  with dmSqlite.Fornecimento.Aggregates.Add do
  begin
    Name := 'KGREALIZADO';
    Expression := 'SUM(KGREALIZADO)';
    Active := True;
  end;
  lblTotalReal.Text      := dmSqlite.RetornaTotalPrevisto(vFiltro);
//
//  if dmSqlite.Fornecimento.Aggregates[1].Value<>NULL then
//   lblTotalReal.Text      := FormatFloat('####,##0.00',dmSqlite.Fornecimento.Aggregates[1].Value)
//  else
//   lblTotalReal.Text      := '0';
end;

function TfrmPrincipal.ValidadeKey(Chave: String): Tdate;
var
 Data,
 Dias,
 Dia,Mes,Ano,vData,Sistema,vSerial:string;
begin
  if Chave.Length>10 then
  begin
    vSerial := copy(Chave,0,pos('SE',Chave)-1);
    Data   := copy(Chave,(pos('SE',Chave)+2),8);
    Dias   := copy(Chave,pos('SE',Chave)+10,4);
    Sistema:= copy(Chave,pos('SE',Chave)+14,1);
    Dia :=(copy(Data,7,2));
    Mes :=(copy(Data,5,2));
    Ano :=(copy(Data,0,4));
    Result :=strToDate(Dia+'/'+Mes+'/'+Ano);
  end;
end;

function TfrmPrincipal.ValidaKey(Serial,Chave: String): Boolean;
var
 Data,
 Dias,
 Dia,Mes,Ano,vData,Sistema,vSerial:string;
begin
  if Chave.Length>10 then
  begin
    vSerial := copy(Chave,0,pos('SE',Chave)-1);
    Data   := copy(Chave,(pos('SE',Chave)+2),8);
    Dias   := copy(Chave,pos('SE',Chave)+10,4);
    Sistema:= copy(Chave,pos('SE',Chave)+14,1);
  end;
  if not dmSqlite.ValidaLicencaJaUsada(Chave) then
  begin
   Result:= false;
   Exit;
  end;

  if UpperCase(Serial)<>UpperCase(vSerial) then
    Result := false
  else
   if Sistema<>'0' then
    Result := false
  else
   if(Dias.Length=0) or (Dias='0') then
    Result := false
  else
  begin
     Dia :=(copy(Data,7,2));
     Mes :=(copy(Data,5,2));
     Ano :=(copy(Data,0,4));
     vDataKey:=Dia+'/'+Mes+'/'+Ano;
     dmSqlite.InativaKey;
     dmSqlite.Tablekey.Insert;
     dmSqlite.TablekeyKEY.AsString      := Chave;
     try
       dmSqlite.Tablekey.ApplyUpdates(-1);
      except
       on E : Exception do
       begin
         ShowMessage('Exception message = '+E.Message);
       end;
     end;
     Result := true;
  end;
end;




procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  layKeyTotal.Visible          := false;
  LayIngredientes.Visible := false;
  udb.ConectaFB_TGC;
  dmSqlite.CreateTablesVersao('');
  dmSqlite.GetAlimentoTGCInterno;

  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLog;
  lblVersaoExe.text          := GetVersaoArqWin;

  //VALIDA LICENÇA
  dmSqlite.Tablekey.Close;
  dmSqlite.Tablekey.Open;
  dmSqlite.Tablekey.Filtered:= false;
  dmSqlite.Tablekey.Filter  := 'STATUS=1';
  dmSqlite.Tablekey.Filtered:= true;
  if dmSqlite.Tablekey.IsEmpty then
  begin
   ShowMessage('Informe a Licença de Uso do sistema!');
   edtSerialHD.Text := SerialNum('C');
   layKeyTotal.Visible := true;
   Exit;
  end
  else
  begin
    DataKey := ValidadeKey(dmSqlite.TablekeyKEY.AsString);
    if DataKey<date then
    begin
      ShowMessage('Licença Vencida em :'+DateToStr(DataKey)+' Dias');
      edtSerialHD.Text := SerialNum('C');
      layKeyTotal.Visible := true;
      Exit;
    end
    else
    begin
      if DaysBetween(date,DataKey)<=5 then
      begin
       if DaysBetween(date,DataKey)>0 then
        ShowMessage('Falta :'+intToStr(DaysBetween(date,DataKey))+' para vencer sua licença!')
       else
        ShowMessage('Sua Licença expira amanha, entre em contato com suporte.')
      end;
    end;
  end;
  //VALIDA LICENÇA END




  THorse.Listen(8092, procedure(Horse: THorse)
  begin
    lblVersao.Text:=('Servidor Integração Field Trato Porta: ' + Horse.Port.ToString+
     ' Versão : '+lblVersaoExe.text);
  end);

  THorse.Use(Jhonson);
  THorse.Use(HandleException);
  THorse.Get('/teste',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
    Res.Send('Servidor OK');
  end);

  THorse.Use(HandleException);
  THorse.Get('/GetTesteServidor',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
    Res.Send('Conectado com Sucesso!');
  end);
//  THorse.Use(Jhonson);
//  THorse.Use(HorseBasicAuthentication(
//  function(const AUsername, APassword: string): Boolean
//  begin
//    Result := AUsername.Equals('field') and APassword.Equals('12345');
//  end));

  THorse.Get('/conectafield',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conecta DB Field');
     try
      Res.Send<TJSONObject>(udb.ConectaFB_Local).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conectado Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao conectar db local '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);

  THorse.Get('/conectaTGC',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conecta DB TGC');
     try
      Res.Send<TJSONObject>(udb.ConectaFB_TGC).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conectado Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao conectar db local '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);

  THorse.Get('/teste',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Testando Servidor');
     try
      Res.Send<TJSONObject>(udb.GetTestaServidor).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Testado Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao testar Servidor '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);

  THorse.Get('/usuario',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Usuario');
     try
      Res.Send<TJSONObject>(udb.GetUsuario).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Usuarios Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Usuarios Field '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);

  THorse.Get('/alimento',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Insumos');
     try
      Res.Send<TJSONObject>(udb.GetAlimento).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Insumos Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Insumos Field '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);

  THorse.Get('/curral',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Currais');
     try
      Res.Send<TJSONObject>(udb.GetCurrais).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Currais Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Currais Field '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);

  THorse.Get('/racao',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Rações');
     try
      Res.Send<TJSONObject>(udb.GetRacao).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Rações Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Rações Field '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);

  THorse.Post('/racaoinsumo',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Baixando Rações Insumo');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=udb.AcceptInsumoRacao(LBody);
     Res.Send(LBodyRed).Status(200);
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Rações Insumo Baixados Com Sucesso!');
     except on ex:exception do
     begin
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Error ao Baixar Rações Insumo Field :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Erro :', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Get('/fornecimentoprevisao',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Fornecimento Previsao');
     try
      Res.Send<TJSONObject>(udb.GetPrevisao).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Fornecimento Previsao Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Fornecimento Previsao Field '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);


  THorse.Get('/usuarioTGC',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Usuario');
     try
      Res.Send<TJSONObject>(udb.GetUsuarioTGC).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Usuarios Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Usuarios Field '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);

  THorse.Get('/alimentoTGC',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Insumos');
     try
      Res.Send<TJSONObject>(udb.GetAlimentoTGC).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Insumos Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Insumos Field '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);

  THorse.Get('/curralTGC',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Currais');
     try
      Res.Send<TJSONObject>(udb.GetCurraisTGC).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Currais Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Currais Field '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);

  THorse.Get('/racaoTGC',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Rações');
     try
      Res.Send<TJSONObject>(udb.GetRacaoTGC).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Rações Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Rações Field '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);

  THorse.Post('/racaoinsumoTGC',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Baixando Rações Insumo');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=udb.AcceptInsumoRacaoTGC(LBody);
     Res.Send(LBodyRed).Status(200);
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Rações Insumo Baixados Com Sucesso!');
     except on ex:exception do
     begin
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Error ao Baixar Rações Insumo Field :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Erro :', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Get('/fornecimentoprevisaoTGC',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Fornecimento Previsao');
     try
      Res.Send<TJSONObject>(udb.GetPrevisaoTGC).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Fornecimento Previsao Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Fornecimento Previsao Field '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);
  //POST TGC
  THorse.Post('/fabricacaoTGC',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Baixando Rações Insumo');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=udb.AcceptFabricacaoTGC(LBody);
     Res.Send(LBodyRed).Status(200);
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Rações Insumo Baixados Com Sucesso!');
     except on ex:exception do
     begin
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Error ao Baixar Rações Insumo Field :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Erro :', ex.Message)).Status(500);
     end;
    end;
  end);


  THorse.Post('/FabricacaoInsumosTGC',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Baixando Rações Insumo');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=udb.AcceptFabricacaoInsumosTGC(LBody);
     Res.Send(LBodyRed).Status(200);
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Rações Insumo Baixados Com Sucesso!');
     except on ex:exception do
     begin
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Error ao Baixar Rações Insumo Field :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Erro :', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/FornecimentoTGC',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Baixando Rações Insumo');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=udb.AcceptFornecimentoTGC(LBody);
     Res.Send(LBodyRed).Status(200);
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Rações Insumo Baixados Com Sucesso!');
     except on ex:exception do
     begin
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Error ao Baixar Rações Insumo Field :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Erro :', ex.Message)).Status(500);
     end;
    end;
  end);

  //Leitura de cocho
  THorse.Get('/GetUsuarioLeitura',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Usuarios');
     try
      Res.Send<TJSONObject>(dmLeitura.GetUusarios).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Usuarios Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Usuarios '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);
  THorse.Get('/curralleitura',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Currais');
     try
      Res.Send<TJSONObject>(dmLeitura.GetCurrais).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Currais Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Currais Field '+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);
  //Leitura de cocho
  THorse.Get('/loteleitura',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Lotes');
     try
      Res.Send<TJSONObject>(dmLeitura.GetLotes).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Lotes Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Lotes TGC'+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);
  //Leitura de cocho
  THorse.Get('/notasleitura',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Notas');
     try
      Res.Send<TJSONObject>(dmLeitura.GetNotas).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Notas Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Notas TGC'+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);
  //Leitura de cocho
  THorse.Get('/histleitura',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Hist Leitura');
     try
      Res.Send<TJSONObject>(dmLeitura.GetHistLeitura).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Hist Leitura Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Hist Leitura TGC'+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);
  //Leitura de cocho
  THorse.Get('/histconsumo',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Hist Consumo');
     try
      Res.Send<TJSONObject>(dmLeitura.GetHistConsumo).Status(200);
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Hist Consumo Baixados Com Sucesso!');
      except
       on e:exception do
       begin
        memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao Baixar Hist Consumo TGC'+e.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro :', e.Message)).Status(500);
       end
     end;
  end);
  //leitura Post
  THorse.Post('/LeituraTGC',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Leituras');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=udb.AcceptLeituraTGC(LBody);
     Res.Send(LBodyRed).Status(200);
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Leituras Baixados Com Sucesso!');
     except on ex:exception do
     begin
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Error ao Baixar Leituras TGC:'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Erro :', ex.Message)).Status(500);
     end;
    end;
  end);
  //Fim Post TGC

  //Sync BD TMP
  THorse.Post('/SyncFabricacao',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Fabricacao');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmSqlite.AcceptFabricacaoSync(LBody);
     Res.Send(LBodyRed).Status(200);
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Fabricacao Recebido Com Sucesso!');
     except on ex:exception do
     begin
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Error ao Fabricacao:'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Erro :', ex.Message)).Status(500);
     end;
    end;
  end);
  //Fim Post TGC
  //Sync BD TMP
  THorse.Post('/SyncFabricacaoInsumos',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Fabricacao Insumos');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmSqlite.AcceptFabricacaoInsumos(LBody);
     Res.Send(LBodyRed).Status(200);
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Fabricacao Insumos Recebido Com Sucesso!');
     except on ex:exception do
     begin
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Error ao Fabricacao Insumos:'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Erro :', ex.Message)).Status(500);
     end;
    end;
  end);
  //Fim Post TGC
  //Sync BD TMP
  THorse.Post('/SyncFornecimento',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Fornecimento');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmSqlite.AcceptForneciemto(LBody);
     Res.Send(LBodyRed).Status(200);
     memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Fornecimento Insumos Recebido Com Sucesso!');
     except on ex:exception do
     begin
      memoLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Error ao Receber Fornecimento:'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Erro :', ex.Message)).Status(500);
     end;
    end;
  end);
  //Fim Post TGC
end;

procedure TfrmPrincipal.TreeMnuFabClick(Sender: TObject);
begin
 tbPrincipal.ActiveTab := tbiFab;
end;

procedure TfrmPrincipal.TreeMnuFornClick(Sender: TObject);
begin
 tbPrincipal.ActiveTab := tbiForn;
end;

procedure TfrmPrincipal.TreeMnuLogClick(Sender: TObject);
begin
 tbPrincipal.ActiveTab := tbiLog;
end;

end.
