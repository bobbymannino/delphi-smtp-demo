program SMTPDemo;

uses
  Vcl.Forms,
  FormMain in 'FormMain.pas' {frmMain},
  UtilSMTP in 'UtilSMTP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
