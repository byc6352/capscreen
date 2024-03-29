unit uMask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfMask = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    rct:tRect;
    mIsRct:boolean;
  public
    { Public declarations }
  end;

var
  fMask: TfMask;

implementation
uses
  uMain;
{$R *.dfm}

procedure TfMask.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  rct.Left:=x;
  rct.Top:=y;
  mIsRct:=true;
end;

procedure TfMask.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if(mIsRct)then begin
    rct.Right:=x;
    rct.Bottom:=y;
    Canvas.Rectangle(rct);

  end;
  fMain.stb1.Panels[2].Text:='坐标：'+inttostr(x)+','+inttostr(y);
end;

procedure TfMask.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  rct.Right:=x;
  rct.Bottom:=y;
  fMain.btnStartClick(sender);
  fMain.showRct(rct,false);
  mIsRct:=false;
end;

procedure TfMask.FormShow(Sender: TObject);
begin
  fMask.AlphaBlend :=true; //透明
  fMask.AlphaBlendValue :=50; //透明度
  fMask.TransparentColor :=true; //透明颜色
  fMask.Top:=0;
  fMask.Left:=0;
  fMask.Width:=screen.Width;
  fMask.Height:=screen.Height;

  //fMask.TransparentColorValue:=clBlack;
  //Brush.Style:=bsclear;
  Canvas.Pen.Width:=2;
  Canvas.Pen.Style:=psDash;
  Canvas.Pen.Color:=clred;
  canvas.Pen.Mode:=pmcopy;
end;

end.
