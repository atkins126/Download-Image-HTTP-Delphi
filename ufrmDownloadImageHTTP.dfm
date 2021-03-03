object frmDownloadImageHTTP: TfrmDownloadImageHTTP
  Left = 0
  Top = 0
  Caption = 'Download Image HTTP'
  ClientHeight = 326
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    635
    326)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 272
    Width = 52
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'URL Image'
  end
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 8
    Width = 619
    Height = 249
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 105
      Height = 105
      AutoSize = True
    end
  end
  object Button1: TButton
    Left = 552
    Top = 296
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Download'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 66
    Top = 269
    Width = 561
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Text = 
      'http://rsud.trenggalekkab.go.id/wp-content/uploads/2019/08/1-DSC' +
      'F8815.jpg'
  end
end
