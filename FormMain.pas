unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    btnSend: TButton;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses UtilSMTP;

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnSendClick(Sender: TObject);
var
  FBob: TContact;
  FBobFake: TContact;
  FJamie: TContact;
  FBody: string;
  FEmail: TEmail;
begin
  FBob.Name := 'Bob';
  FBob.Email := 'manninobobby@icloud.com';

  FBody := '''<div
  style="
    max-width: 640px;
    background-color: #efefef;
    padding: 32px;
    margin-left: auto;
    margin-right: auto;
  "
>
  <h1>Hello there</h1>
  <br />
  <p>here i am with some<b>bold</b> and <i>italic</i> Text.</p>
</div>

<img
  src="https://www.ashgrovecycles.co.uk/wp-content/uploads/2022/09/Fuji-E-Nevada-2.1.jpg"
  alt="image here"
  style="width: 100%; max-height: 400px; object-fit: cover"
/>

<div
  style="
    max-width: 640px;
    background-color: #efefef;
    padding: 32px;
    margin-left: auto;
    margin-right: auto;
  "
>
  <a href="https://bobman.dev#about">About Me</a>
</div>
''';

    FEmail := TEmail.Create;
    FEmail.Subject := 'Look at my bike';
    FEmail.Body := FBody;
    FEmail.Recipients := [FBob];
    FEmail.From := FBob;
    FEmail.Send;
end;

end.
