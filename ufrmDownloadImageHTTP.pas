unit ufrmDownloadImageHTTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, jpeg, GIFImg, PngImage;

type
  TfrmDownloadImageHTTP = class(TForm)
    ScrollBox1: TScrollBox;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    function DownloadImage(const Url: string ; ImageType : TGraphicClass = NIL) : TBitMap;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDownloadImageHTTP: TfrmDownloadImageHTTP;

implementation

{$R *.dfm}

function TfrmDownloadImageHTTP.DownloadImage(const Url: string ; ImageType : TGraphicClass = NIL) : TBitMap;
var
  Http: TIdHttp;
  S: TStream;
  Img: TGraphic;
  Str: AnsiString;
  Buff: string;
begin
  Http := TIdHTTP.Create(NIL);
  try
    S := TMemoryStream.Create;
    Buff := StringReplace(Url,'\','',[rfReplaceAll,rfIgnoreCase]);
    try
      Http.Get(Buff,S);
      if not Assigned(ImageType) then begin
        S.Position:=0;
        SetLength(STR,5);
        S.Read(STR[1],LENGTH(STR));
        if Copy(STR,1,2)='BM' then
          ImageType:=TBitMap
        else if COPY(STR,1,3)='GIF' then
          ImageType:= TGIFImage
        else if COPY(STR,2,3)='PNG' then
          ImageType:= TPNGObject
        else if (ORD(STR[1])=$FF) AND (ORD(STR[2])=$D8) then
          ImageType:=TJPEGImage
      end;
      if not Assigned(ImageType) then raise EInvalidImage.Create('Unrecognized file format!');
      IMG:=ImageType.Create;
      try
        S.Position:=0;
        IMG.LoadFromStream(S);
        Result:=TBitMap.Create;
        try
          Result.Assign(IMG)
        except
          Result.Free;
          raise;
        end;
      finally
        IMG.Free
      end;
    finally
      S.Free
    end;
  finally
    HTTP.Free
  end;
end;

procedure TfrmDownloadImageHTTP.Button1Click(Sender: TObject);
begin
  Image1.Picture.Bitmap := DownloadImage(Edit1.Text);
end;

end.
