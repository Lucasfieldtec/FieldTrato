unit uDecoderCentral;

interface
 uses
  Windows,
  SysUtils,
  Variants,
  Classes,
  Math;
type
  FrameCentral = record
    case Integer of
    0:
      (
        op: ShortInt;
        peso: SmallInt;
        tagSz: ShortInt;
        tag: array[0..12] of byte;
        status: SmallInt;
      );
    1:
      (dados: array[0..35] of byte);
    2:
      (dadosint32: array[0..5] of Integer);
  end;
type
  CheckSumInt32 = record
    case Integer of
    0:
      (
        checksum: Integer;
      );
    1:
      (dados: array[0..3] of byte);
  end;
type
  TDecoderCentral = class
  private
    tagConverted: string;
    ppeso: SmallInt;
    pstatus: SmallInt;
    chechksum: Integer;
    ChkSumRecord: CheckSumInt32;
    fCentral: FrameCentral;
  protected
    { protected declarations }
  public
     property tag :String read tagConverted;
     property peso :SmallInt read ppeso;
     property status :SmallInt read pstatus;
  published
    { published declarations }
    Function DecodeFrame(dataArr: array of byte): Integer;
    Function leitorRFTimeout(): Integer;
    Function balancaTimeout(): Integer;
    Function hasTag(): Integer;
  end;

implementation
{ TDecoderCentral }
Function  TDecoderCentral.hasTag(): Integer;
begin
  Result := 1;
end;
Function  TDecoderCentral.leitorRFTimeout(): Integer;
begin
  Result := 0;
end;
Function  TDecoderCentral.balancaTimeout(): Integer;
begin
  Result := 0;
end;
//#define BALANCA_RECEBENDO 1
//#define BALANCA_TIMEOUT 2
//#define RFID_TAG 4
//#define RFID_TIMEOUT 8
Function  TDecoderCentral.DecodeFrame(dataArr: array of byte): Integer;
var I : integer;
  aLen : integer;
begin
    aLen := Length(dataArr);

    TDecoderCentral.Create();
    //Popula 4 bytes para obter um int32
    for I := 0 to 3 do
    begin
      ChkSumRecord.dados[I] := dataArr[29-I];
    end;
    //Popula o dataframe
    for I := 2 to 37 do
    begin
      fCentral.dados[I-2] := dataArr[I];
    end;
    //xorza dataframe com checksum
    for I := 0 to 5 do
    begin
      fCentral.dadosint32[I] := fCentral.dadosint32[I] xor ChkSumRecord.checksum;
    end;
    for I := 0 to fCentral.tagSz-1 do
    begin
        tagConverted := tagConverted + IntToHex(fCentral.tag[I]);
    end;
    ppeso := fCentral.peso;
    pstatus := fCentral.status;
    //Falta Comparar para validar CRC32
    Result := 1;
end;
end.
