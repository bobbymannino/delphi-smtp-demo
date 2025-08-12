object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'SMTP Demo'
  ClientHeight = 290
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object btnSend: TButton
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 408
    Height = 25
    Align = alTop
    Caption = 'Send'
    TabOrder = 0
    OnClick = btnSendClick
    ExplicitLeft = 4
    ExplicitTop = 4
    ExplicitWidth = 706
  end
  object btnClose: TButton
    AlignWithMargins = True
    Left = 3
    Top = 262
    Width = 408
    Height = 25
    Align = alBottom
    Caption = 'Close'
    TabOrder = 1
    OnClick = btnCloseClick
    ExplicitLeft = 6
    ExplicitTop = 11
    ExplicitWidth = 623
  end
end
