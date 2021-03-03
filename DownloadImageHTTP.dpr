program DownloadImageHTTP;

uses
  Forms,
  ufrmDownloadImageHTTP in 'ufrmDownloadImageHTTP.pas' {frmDownloadImageHTTP};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDownloadImageHTTP, frmDownloadImageHTTP);
  Application.Run;
end.
