program capscreen;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  uMask in 'uMask.pas' {fMask},
  uInputText in 'uInputText.pas' {fInputText},
  uIntroduction in 'uIntroduction.pas' {fIntroduction},
  uVersion in 'uVersion.pas' {fVersion};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfMask, fMask);
  Application.CreateForm(TfInputText, fInputText);
  Application.CreateForm(TfIntroduction, fIntroduction);
  Application.CreateForm(TfVersion, fVersion);
  Application.Run;
end.
