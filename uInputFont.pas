unit uInputFont;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfInputFont = class(TForm)
    memInput: TMemo;
    btnFont: TButton;
    fd1: TFontDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fInputFont: TfInputFont;

implementation

{$R *.dfm}

end.
