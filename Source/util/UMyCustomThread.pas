unit UMyCustomThread;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects,
  FMX.TabControl, FMX.Layouts, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, System.ImageList, FMX.ImgList,
  FMX.Effects, FMX.Grid.Style, FMX.ListBox, FMX.ScrollBox, FMX.Grid,
  Fmx.Bind.Grid, Data.Bind.Grid, FMX.Edit, FMX.DateTimeCtrls,System.Generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.Memo, System.Actions, FMX.ActnList,FMX.Surfaces,FMX.VirtualKeyboard,
  FMX.Platform;

type
  TProcedureExcept = reference to procedure(const AException:string);
   procedure CustomThread(
    AOnStart,
    AOnProcess,
    AOnComplete:TProc;
    AonError :TProcedureExcept;
    const ADoCompleteWithError:Boolean
   );
implementation

procedure CustomThread(AOnStart, AOnProcess, AOnComplete: TProc;
  AonError: TProcedureExcept; const ADoCompleteWithError: Boolean);
var
 MThread :TThread;
begin
  MThread:= TThread.CreateAnonymousThread(
   procedure()
   var
     MDoComplete:Boolean;
   begin
    try
     try
     {$Region 'Processo Concluido'}
       MDoComplete  := true;
       {$Region 'OnStart'}
        if Assigned(AOnStart) then
        begin
          TThread.Synchronize(
          TThread.CurrentThread,
          procedure ()
          begin
            AOnStart;
          end
          );
        end;
       {$EndRegion}
       {$Region 'Processo Principal'}
         if Assigned(AOnProcess)then
          AOnProcess;
       {$EndRegion}
     {$EndRegion}
     except on E:Exception do
      begin
       {$Region 'Erro'}
        MDoComplete := ADoCompleteWithError;
        ShowMessage(e.Message);
        if Assigned(AonError) then
        begin
          TThread.Synchronize(
           TThread.CurrentThread,
           procedure ()
           begin
             AonError(e.Message);
           end
           );
        end;
       {$EndRegion}
      end;
     end;
    finally
      {$Region 'Complete'}
       if Assigned(AOnComplete) then
       begin
          TThread.Synchronize(
          TThread.CurrentThread,
          procedure ()
          begin
            AOnComplete;
          end
          );
       end;
      {$EndRegion}
    end;
   end
  );
  MThread.FreeOnTerminate := true;
  MThread.Start;
end;

end.
