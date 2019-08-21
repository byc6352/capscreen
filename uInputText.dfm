object fInputText: TfInputText
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'fInputText'
  ClientHeight = 154
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 54
    Top = 100
    Width = 36
    Height = 13
    Caption = #22352#26631#65306
  end
  object memInput: TMemo
    Left = 0
    Top = 0
    Width = 400
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btnFont: TBitBtn
    Left = 8
    Top = 95
    Width = 40
    Height = 25
    Caption = #23383#20307
    TabOrder = 1
    OnClick = btnFontClick
  end
  object edtPos: TEdit
    Left = 93
    Top = 97
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnOK: TBitBtn
    Left = 343
    Top = 97
    Width = 40
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = btnOKClick
  end
  object fd1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 302
    Top = 42
  end
end
