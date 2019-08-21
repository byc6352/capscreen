object fInputFont: TfInputFont
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'fInputFont'
  ClientHeight = 126
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memInput: TMemo
    Left = 0
    Top = 0
    Width = 400
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btnFont: TButton
    Left = 0
    Top = 96
    Width = 75
    Height = 25
    Caption = #23383#20307
    TabOrder = 1
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
