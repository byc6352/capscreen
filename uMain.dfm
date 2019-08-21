object fMain: TfMain
  Left = 0
  Top = 0
  ClientHeight = 762
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MMu
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 27
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 100
      Top = 4
      Width = 36
      Height = 13
      Caption = #24418#29366#65306
    end
    object Label2: TLabel
      Left = 247
      Top = 4
      Width = 39
      Height = 13
      Caption = ' '#39068#33394#65306
    end
    object Label3: TLabel
      Left = 407
      Top = 2
      Width = 36
      Height = 13
      Caption = #31895#32454#65306
    end
    object cb1: TColorBox
      Left = 282
      Top = 0
      Width = 119
      Height = 22
      TabOrder = 0
    end
    object cmbShape: TComboBox
      Left = 141
      Top = 2
      Width = 98
      Height = 21
      ItemIndex = 0
      TabOrder = 1
      Text = #30452#32447
      Items.Strings = (
        #30452#32447
        #30697#24418#26694)
    end
    object cmbFine: TComboBox
      Left = 448
      Top = 0
      Width = 98
      Height = 21
      ItemIndex = 1
      TabOrder = 2
      Text = '2'
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12')
    end
    object btnStart: TBitBtn
      Left = 4
      Top = 0
      Width = 40
      Height = 25
      Caption = #25130#22270
      TabOrder = 3
      OnClick = btnStartClick
    end
    object btnExec: TBitBtn
      Left = 44
      Top = 0
      Width = 40
      Height = 25
      Caption = #30011#22270
      TabOrder = 4
      OnClick = btnExecClick
    end
    object btnSave: TBitBtn
      Left = 563
      Top = 0
      Width = 40
      Height = 25
      Caption = #20445#23384
      TabOrder = 5
      OnClick = muSaveClick
    end
  end
  object stb1: TStatusBar
    Left = 0
    Top = 743
    Width = 784
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 120
      end
      item
        Width = 50
      end>
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 27
    Width = 784
    Height = 716
    Align = alClient
    TabOrder = 2
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 105
      Height = 105
      AutoSize = True
      PopupMenu = popImage
      OnMouseDown = Image1MouseDown
      OnMouseMove = Image1MouseMove
      OnMouseUp = Image1MouseUp
    end
  end
  object MMu: TMainMenu
    Left = 384
    Top = 384
    object muFile: TMenuItem
      Caption = #25991#20214
      object muOpenFile: TMenuItem
        Caption = #25171#24320'...'
        OnClick = muOpenFileClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object muSave: TMenuItem
        Caption = #20445#23384
        OnClick = muSaveClick
      end
      object muOtherSave: TMenuItem
        Caption = #21478#23384#20026'...'
        OnClick = muOtherSaveClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object muClose: TMenuItem
        Caption = #36864#20986
        OnClick = muCloseClick
      end
    end
    object muHelper: TMenuItem
      Caption = #24110#21161
      object muFuncSay: TMenuItem
        Caption = #21151#33021#35828#26126'...'
        OnClick = muFuncSayClick
      end
      object muVersion: TMenuItem
        Caption = #29256#26412#20449#24687'...'
        OnClick = muVersionClick
      end
    end
  end
  object popImage: TPopupMenu
    Left = 320
    Top = 384
    object poInputText: TMenuItem
      Caption = #36755#20837#25991#26412'...'
      OnClick = poInputTextClick
    end
  end
  object Save1: TSaveDialog
    DefaultExt = '.bmp'
    Filter = 'BMP'#25991#20214'(*.bmp)|*.bmp|JPG'#25991#20214'(*.jpg)|*.jpg|PNG'#25991#20214'(*.png)|*.png'
    Title = #20445#23384#25991#20214
    Left = 440
    Top = 384
  end
  object open1: TOpenDialog
    Left = 256
    Top = 384
  end
end
