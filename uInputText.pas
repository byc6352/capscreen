unit uInputText;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfInputText = class(TForm)
    memInput: TMemo;
    fd1: TFontDialog;
    btnFont: TBitBtn;
    Label1: TLabel;
    edtPos: TEdit;
    btnOK: TBitBtn;
    procedure btnFontClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mTextPos:tPoint;
  end;

var
  fInputText: TfInputText;

implementation

{$R *.dfm}
uses
  uMain;
procedure TfInputText.btnFontClick(Sender: TObject);
begin
  if(fd1.Execute())then begin
    memInput.Font:=fd1.Font;
  end;
end;

procedure TfInputText.btnOKClick(Sender: TObject);
begin
  fMain.Image1.Canvas.Font:=memInput.Font;
  fMain.Image1.Canvas.TextOut(mTextPos.x,mTextPos.y,memInput.Text);
  close;
end;

end.
