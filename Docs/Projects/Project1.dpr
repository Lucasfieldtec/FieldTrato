program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Windows,
  SysUtils,
  Variants,
  Classes,
  Math,
  uDecoderCentral in 'uDecoderCentral.pas';

const Table3: Array[0..30] of byte =(
$02,$18,$62,$35,$64,$fa,$6f,$ca,
$80,$f3,$63,$35,$80,$f3,$63,$35,
$80,$a2,$f7,$35,$80,$f3,$63,$35,
$80,$f3,$f3,$80,$35,$63,$03);

var
  C: TDecoderCentral;
  result: Integer;
begin
  try
    C := TDecoderCentral.Create;
    result := c.DecodeFrame(Table3);
    if result = 1 then
    begin
        Writeln('decodificado com sucesso');
        if C.hasTag() = 1 then
        begin
          Writeln('Tag:'+C.tag);
        end;
        if C.balancaTimeout() = 1 then
        begin
          Writeln('Balanca Desconectada:');
        end;
        if C.leitorRFTimeout() = 1 then
        begin
          Writeln('Leitor Desconectado:');
        end;
        if C.balancaTimeout() = 0 then
        begin
          Writeln('Peso:'+IntToStr(C.peso));
        end;
    end
    else
    begin
       Writeln('problema decodificacao');
    end;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

