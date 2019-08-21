unit uIntroduction;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfIntroduction = class(TForm)
    memSay: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fIntroduction: TfIntroduction;

implementation

{$R *.dfm}

end.
