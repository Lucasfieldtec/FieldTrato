program WsField;

uses
  System.StartUpCopy,
  FMX.Forms,
  UWsField in 'UWsField.pas' {frmPrincipal},
  dmDB in 'dmDB.pas' {udb: TDataModule},
  UdmLeitura in 'UdmLeitura.pas' {dmLeitura: TDataModule},
  UdmSqlite in 'UdmSqlite.pas' {dmSqlite: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tudb, udb);
  Application.CreateForm(TdmLeitura, dmLeitura);
  Application.CreateForm(TdmSqlite, dmSqlite);
  Application.Run;
end.
