program FieldTrato;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in '..\Principal\UPrincipal.pas' {frmPrincipal},
  UFabricacao in '..\Fabricacao\UFabricacao.pas' {frmFabricacao},
  UFabricar in '..\Fabricar\UFabricar.pas' {frmFabricar},
  UFornecimentoLista in '..\Fornecimento\Lista\UFornecimentoLista.pas' {frmFornLista},
  Umsg in '..\msg\Umsg.pas' {msg},
  FMX.Consts in '..\util\FMX.Consts.pas',
  uDecoderCentral in '..\util\uDecoderCentral.pas',
  UMyCustomThread in '..\util\UMyCustomThread.pas',
  UDmSync in '..\dmDM\UDmSync.pas' {dmSync: TDataModule},
  UDmDb in '..\dmDB\UDmDb.pas' {udb: TDataModule},
  UGravarTag in '..\GravarTag\UGravarTag.pas' {frmGravaTag};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tudb, udb);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tmsg, msg);
  Application.CreateForm(TdmSync, dmSync);
  Application.CreateForm(TfrmGravaTag, frmGravaTag);
  Application.Run;
end.
