unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,Clipbrd,uMask,
  Vcl.Buttons,shellapi, Vcl.Menus,uInputText,uVersion,uIntroduction,jpeg;
const
  PIC_DIR:string='pic'; // ����ͼƬ����Ŀ¼��
type
  TfMain = class(TForm)
    Panel1: TPanel;
    stb1: TStatusBar;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    cb1: TColorBox;
    cmbShape: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbFine: TComboBox;
    Label3: TLabel;
    btnStart: TBitBtn;
    btnExec: TBitBtn;
    MMu: TMainMenu;
    muFile: TMenuItem;
    muSave: TMenuItem;
    muOtherSave: TMenuItem;
    muOpenFile: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    muClose: TMenuItem;
    muHelper: TMenuItem;
    muFuncSay: TMenuItem;
    muVersion: TMenuItem;
    popImage: TPopupMenu;
    poInputText: TMenuItem;
    Save1: TSaveDialog;
    open1: TOpenDialog;
    btnSave: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnExecClick(Sender: TObject);
    procedure poInputTextClick(Sender: TObject);
    procedure muSaveClick(Sender: TObject);
    procedure muOtherSaveClick(Sender: TObject);
    procedure muCloseClick(Sender: TObject);
    procedure muFuncSayClick(Sender: TObject);
    procedure muVersionClick(Sender: TObject);
    procedure muOpenFileClick(Sender: TObject);
  private
    { Private declarations }

     mRct,mOldRct:tRect;
     mIsPaint:boolean;
     mFilename:string;
     aatom:word;
    procedure hotkey(var msg:TMessage); message WM_HOTKEY;
    //function selectSharp
  public
    { Public declarations }
    mFont:tFont;
    mImagePos:tPoint;
    procedure showRct(rct:tRect;bShowCursor:boolean);
  end;

var
  fMain: TfMain;
  workdir:string;//����Ŀ¼
  picdir:string;// ����ͼƬ����Ŀ¼
function getDateFilename():string;
function captureScreen(x1:integer;y1:integer;x2:integer;y2:integer):tbitmap;
Function DrawCursor(Bit : TBitmap) : TBitmap;
function BMPsaveJPGfile(bmp: TBitmap;jpgFilename:string;ACQ:integer):boolean;
function BMP2JPG(bmp: TBitmap;ACQ:integer):TJpegImage;
procedure init();
implementation

{$R *.dfm}

procedure TfMain.btnCloseClick(Sender: TObject);
begin
 close;
end;

procedure TfMain.btnExecClick(Sender: TObject);
var
  cmdLine:ansiString;
begin
  cmdLine:='mspaint '+ansistring(mFilename);
  WinExec(pansiChar(cmdLine),SW_SHOWNORMAL);
end;

procedure TfMain.btnStartClick(Sender: TObject);
begin
  if(btnStart.Caption='��ͼ') then begin
    fMask.Show;
    btnStart.Caption:='ֹͣ';
  end else begin
    fMask.hide;
    btnStart.Caption:='��ͼ';
  end;

end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  UnregisterHotKey(Handle,aatom);
  GlobalDeleteAtom(aatom);

end;

procedure TfMain.FormShow(Sender: TObject);
var
  aatom1:word;
begin
  init();
if FindAtom('capscreen_hotKey')=0 then
  begin
    aatom:=GlobalAddAtom('capscreen_hotKey');
  end;
  if RegisterHotKey(Handle,aatom,MOD_CONTROL,$51) then  //MOD_CONTROL    VK_F12   Q
  begin
    //MessageBox(Handle,'��Ctrl+F12��ͼȫ��!','��ʾ',MB_OK);
  end else begin
    MessageBox(Handle,'ע��Ctrl+Qʧ��!','��ʾ',MB_OK);
  end;
  if RegisterHotKey(Handle,aatom,MOD_CONTROL,$57) then    //W
  begin
    //MessageBox(Handle,'��Ctrl+F11��ͼ��ǰ����!','��ʾ',MB_OK);
  end else begin
    MessageBox(Handle,'ע��Ctrl+Wʧ��!','��ʾ',MB_OK);
  end;
  //stb1.Panels[2].Text:='˵������Ctrl+F12��ͼȫ��!��Ctrl+F11��ͼ��ǰ����!';
  fmain.Caption:='���ֽ���С����v2.0(˵�����㡾��ͼ������ק����ͼ����Ctrl+Q��ͼȫ��!��Ctrl+W��ͼ��ǰ����!)';
  cb1.Selected:=clRed;
end;
procedure TfMain.hotkey(var msg: TMessage);
var
  bmp:tbitmap;
  filename:string;
  hForm:HWND;
  rct:tRect;
  h,w:integer;
begin
  if TWMHotKey(msg).HotKey=aatom then
  begin
    //ShowMessage('s');
  end;
  if (msg.LParamHi=$51) and (msg.LParamLo=MOD_CONTROL) then  //ȫ��    VK_F12
  begin
    rct.Left:=0;
    rct.Top:=0;
    rct.Right:=screen.Width;
    rct.Bottom:=screen.Height;
    showRct(rct,true);
  end;
  if (msg.LParamHi=$57) and (msg.LParamLo=MOD_CONTROL) then  //��ǰ�����  VK_F11
  begin
    hForm:=GetForegroundWindow();
    GetWindowRect(hForm,rct);
    showRct(rct,false);
  end;

end;
procedure TfMain.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mIsPaint:=true;
  mRct.Left:=x;
  mRct.Top:=y;
  mRct.Right:=x;
  mRct.Bottom:=y;
  mOldRct:=mRct;
  Image1.Canvas.Pen.Width:=strtoint(cmbFine.Items[cmbFine.ItemIndex]);
  Image1.Canvas.Pen.Style:=psDash;
  Image1.Canvas.Pen.Color:=cb1.Selected;
  //Image1.canvas.Pen.Mode:=pmcopy;
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.Brush.Style:=bsClear;
  image1.Canvas.Pen.Mode := pmXor; //�뱳�������
  //fMain.DoubleBuffered:=true;
  case cmbShape.ItemIndex of
    0:begin  //ֱ��
       Image1.canvas.MoveTo(x,y);
    end;
    1:begin  //����
      //Canvas.Rectangle(mRct);
    end;
  end;
end;

procedure TfMain.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  mImagePos.X:=x;
  mImagePos.Y:=y;
  fMain.stb1.Panels[2].Text:='���꣺'+inttostr(x)+','+inttostr(y);
  if(mIsPaint=false)then exit;
  mRct.Right:=x;
  mRct.Bottom:=y;

  case cmbShape.ItemIndex of
    0:begin  //ֱ��
      Image1.canvas.MoveTo(mOldRct.Left,mOldRct.Top);
      Image1.canvas.LineTo(mOldRct.Right,mOldRct.Bottom);//�����ɵģ�

      Image1.canvas.MoveTo(mRct.Left,mRct.Top);
      Image1.canvas.LineTo(mRct.Right,mRct.Bottom);//�����µģ�
    end;
    1:begin  //����
      Image1.Canvas.Rectangle(mOldRct); //������ǰ��
      Image1.Canvas.Rectangle(mRct);

    end;
  end;
  mOldRct:=mRct;
end;

procedure TfMain.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mIsPaint:=false;
  mRct.Right:=x;
  mRct.Bottom:=y;
  Image1.Canvas.Pen.Mode := pmCopy; //�ָ�Ǧ��ģʽ

  case cmbShape.ItemIndex of
    0:begin  //ֱ��
      Image1.canvas.MoveTo(mRct.Left,mRct.Top);
      Image1.canvas.LineTo(mRct.Right,mRct.Bottom);//�����µģ�
    end;
    1:begin  //����
        Image1.Canvas.Rectangle(mRct);
    end;
  end;
end;

procedure TfMain.muCloseClick(Sender: TObject);
begin
  close();
end;

procedure TfMain.muFuncSayClick(Sender: TObject);
begin
  fIntroduction.show;
end;

procedure TfMain.muOpenFileClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
  strFileName: string;
begin
  OpenDlg := TOpenDialog.Create(nil);
  try
    OpenDlg.InitialDir:=picdir;
    OpenDlg.Filter := 'BMP�ļ�(*.bmp)|*.bmp';
    OpenDlg.DefaultExt := '*.bmp';
    if OpenDlg.Execute then
    begin
      strFileName := Trim(OpenDlg.FileName);
      if strFileName <> '' then
      begin
        mFileName := strFileName;
        image1.Picture.LoadFromFile(mFilename);
        stb1.Panels[1].Text:='�ļ�����'+extractfilename(mFilename);
        stb1.Panels[0].Text:='ͼƬ��С��'+inttostr(image1.Picture.Width)+','+inttostr(image1.Picture.Height);
      end;
    end;
  finally
    FreeAndNil(OpenDlg);
  end;
end;


procedure TfMain.muOtherSaveClick(Sender: TObject);
var
  ext:string;
begin
  //save1.Filter:= 'BMP�ļ�(*.bmp)|*.bmp;JPG�ļ�(*.jpg)|*.jpg';  //���ñ����ļ�����չ��
  //save1.DefaultExt := '.bmp';              //Ϊ�����ļ����Զ������չ��
  //save1.Title:='����ͼƬ';
  save1.InitialDir:=extractfiledir(mFilename);
  if(save1.Execute())then begin
    if(save1.FilterIndex=2)then begin
      save1.DefaultExt := '.jpg';
      BMPsaveJPGfile(image1.Picture.Bitmap,save1.FileName,80);
      //Clipboard. //�ŵ���������
      Clipboard.Assign(BMP2JPG(image1.Picture.Bitmap,80));
      stb1.Panels[3].Text:='�ѱ��浽��'+extractfilename(mFilename);
      exit;
    end;
    mFilename:=save1.FileName;
    image1.Picture.SaveToFile(mFilename);
    stb1.Panels[1].Text:=extractfilename(mFilename);
    Clipboard.Assign(image1.Picture.Bitmap); //�ŵ���������
    stb1.Panels[3].Text:='�ѱ��浽��'+extractfilename(mFilename);
  end;
end;

procedure TfMain.muSaveClick(Sender: TObject);
begin
  image1.Picture.SaveToFile(mFilename);
  Clipboard.Assign(image1.Picture.Bitmap); //�ŵ���������
  stb1.Panels[3].Text:='�ѱ��浽��'+extractfilename(mFilename);
end;

procedure TfMain.muVersionClick(Sender: TObject);
begin
 fVersion.show;
end;

procedure TfMain.poInputTextClick(Sender: TObject);
var
  pos:tPoint;
begin
  getCursorPos(pos);
  fInputText.mTextPos:=mImagePos;
  fInputText.edtPos.Text:=inttostr(mImagePos.X)+','+inttostr(mImagePos.Y);
  fInputText.Left:=Pos.X;
  fInputText.Top:=Pos.Y;
  fInputText.ShowModal;

end;

procedure TfMain.showRct(rct:tRect;bShowCursor:boolean);
var
  bmp:tbitmap;
  filename,sTime:string;
begin
  bmp:=captureScreen(rct.Left,rct.Top,rct.Right,rct.Bottom);
  if(bShowCursor) then DrawCursor(bmp);
  sTime:=getDateFilename();
  filename:=picdir+'\'+sTime+'.bmp';
  mFilename:=filename;
  bmp.SaveToFile(filename);
  image1.Picture.Bitmap.Assign(bmp);
  stb1.Panels[0].Text:='ͼƬ��ߣ�'+inttostr(rct.Width)+','+inttostr(rct.Height);
  stb1.Panels[1].Text:='�ļ�����'+sTime+'.bmp';
  Clipboard.Assign(Bmp); //�ŵ���������
  bmp.Free;
end;

//--------------------------------------------------------------------------------------------
 function getDateFilename():string;
  var
    s:string;
  begin
    DateTimeToString(s,'yyyymmddhhnnsss',now());
    result:=s;
  end;
//����
function captureScreen(x1:integer;y1:integer;x2:integer;y2:integer):tbitmap;
var
  dc:HDC;
  bmp:tbitmap;
  fullCanvas:TCanvas;
begin
  dc:=GetDC(0);
  fullCanvas:=TCanvas.Create;
  fullCanvas.Handle:=dc;
  bmp:=TBitmap.Create;
  try
    bmp.Width:=abs(x2-x1);
    bmp.Height:=abs(y2-y1);
    bmp.Canvas.CopyRect(Rect(0,0,bmp.Width,bmp.Height),fullCanvas,Rect(x1,y1,x2,y2));
    //bmp.SaveToFile('c:\tmp\1.bmp');
  finally
  end;
  result:=bmp;
end;


//*************** Draw Cursor on the bitmap ******************
Function DrawCursor(Bit : TBitmap) : TBitmap;
Var
Cur : TCursorInfo;
Icn : TIcon;
IcnInfo : TIconInfo;
Rec : TRect;
begin
Icn := TIcon.Create;
Rec := Bit.Canvas.ClipRect;
try
Cur.cbSize := SizeOf(Cur);
if GetCursorInfo(Cur) then
if Cur.flags = CURSOR_SHOWING then
begin
Icn.Handle := CopyIcon(Cur.hCursor);
if GetIconInfo(Icn.Handle, IcnInfo) then
Bit.Canvas.Draw(Cur.ptScreenPos.X - Integer(IcnInfo.XHotSpot) - Rec.Left,
Cur.ptScreenPos.Y - Integer(IcnInfo.YHotSpot) - Rec.Top,
Icn);
end;
finally
Icn.Free;
end;
Result := Bit;
end;
//************ End of cursor drawing *************************

procedure init();
var
    me:String;
begin
    me:=application.ExeName;
    workdir:=extractfiledir(me);
    picdir:=workdir+'\'+PIC_DIR;
    if(not DirectoryExists(picdir))then
      ForceDirectories(picdir);

end;
function BMPsaveJPGfile(bmp: TBitmap;jpgFilename:string;ACQ:integer):boolean;
Var
  jpg:TJpegImage;
  I:TBitmap;
  S,D:String;
begin
   result:=false;
  Jpg:=TJpegImage.Create;
  Jpg.Assign(bmp);
  Jpg.CompressionQuality := ACQ;
  Jpg.Compress;
  Jpg.SaveToFile(jpgFilename);
  Application.processmessages;
  Jpg.Free;
  if FileExists(jpgFilename) then
      result := True;
end;

function BMP2JPG(bmp: TBitmap;ACQ:integer):TJpegImage;
Var
  jpg:TJpegImage;
  I:TBitmap;
  S,D:String;
begin
  Jpg:=TJpegImage.Create;
  Jpg.Assign(bmp);
  Jpg.CompressionQuality := ACQ;
  Jpg.Compress;
  result:=jpg;
end;

//bmpͼƬת����jpgͼƬ
function fun_BmpToJpg(temp, path: String; ACQ: Integer): Boolean; stdcall;
var
  MyJpeg: TJpegImage;
  Bmp: TBitmap;
begin
  result := false;
  if FileExists(temp) then
  begin
    Bmp:= TBitmap.Create;
    MyJpeg:= TJpegImage.Create;
    Bmp.LoadFromFile(temp);
    MyJpeg.Assign(Bmp);
    MyJpeg.CompressionQuality := ACQ;
    MyJpeg.Compress;
    MyJpeg.SaveToFile(Path);
    MyJpeg.free;
    Bmp.free;
    if FileExists(path) then
      result := True;
  end;
end;
end.
