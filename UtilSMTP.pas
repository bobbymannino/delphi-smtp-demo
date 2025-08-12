unit UtilSMTP;

interface   

type
  TContact = record
    Name: string;
    Email: string;
  end;

  TEmail = class
  public
    Subject: string;
    Body: string;
    From: TContact;
    CCRecipients: TArray<TContact>;
    Recipients: TArray<TContact>;

    procedure Send;
  end;

implementation

uses IdSMTP, IdMessage;

const
  SMTP_HOST = '<replace with your host>';

procedure SendEmail(const AEmail: TEmail);
var
  FSMTP: TIdSMTP;
  FEmail: TIdMessage;
begin
  FSMTP := TIdSMTP.Create(nil);
  FEmail := TIdMessage.Create(nil);

  try
    with FSMTP do
    begin
      Host := SMTP_HOST;
      Connect;

      with FEmail do
      begin      
        Encoding := TIdMessageEncoding.meMIME;
        ContentType := 'text/html';  

        Subject := AEmail.Subject;
        Body.Text := AEmail.Body;
        
        From.Name := AEmail.From.Name;
        From.Address := AEmail.From.Email;

        for var Recipient in AEmail.Recipients do
        begin
          var
          tmp := Recipients.Add;
          tmp.Name := Recipient.Name;
          tmp.Address := Recipient.Email;
        end;

        for var CCRecipient in AEmail.CCRecipients do
        begin
          var
          tmp := CCList.Add;
          tmp.Name := CCRecipient.Name;
          tmp.Address := CCRecipient.Email;
        end;
      end;
      
      Send(FEmail);
    end;
  finally
    FEmail.Free;
    FSMTP.Free;
  end;
end;

{ TEmail }

procedure TEmail.Send;
begin
  SendEmail(Self);
end;

end.
