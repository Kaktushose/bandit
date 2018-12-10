program bandit;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, ubandit, uspiel
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
	Application.CreateForm(TFBandit, FBandit);
  Application.Run;
end.

