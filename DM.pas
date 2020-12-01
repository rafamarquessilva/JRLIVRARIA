unit DM;

interface

uses
  SysUtils, Classes, DB, Windows, Forms,
  {Data.DBXMSSQL,} Data.SqlExpr, Data.Win.ADODB;

type
  Tdb = class(TDataModule)
    ADOConnection: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InicializarParametros;
  end;

var
  db: Tdb;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ Tdb }

procedure Tdb.InicializarParametros;
var
  ArquivoConfig: TStringList;
  NomeArquivo: String;
begin
  ArquivoConfig := TStringList.Create;
  try
    try
      NomeArquivo := ExtractFilePath(Application.ExeName)+'config.ini';

      if not FileExists(NomeArquivo) then
        raise Exception.Create('Não encontrado arquivo de configuração. !!! ' + NomeArquivo);

        ArquivoConfig.LoadFromFile(NomeArquivo);

        if ADOconnection.Connected = false then
        begin
          ADOconnection.ConnectionString := 'Provider='+ArquivoConfig.Values['Provider']+';Persist Security Info=False;Password='+ArquivoConfig.Values['Password']+
                                            ';User ID='+ArquivoConfig.Values['Username']+';Initial Catalog='+ArquivoConfig.Values['Database']+';Data Source='+ArquivoConfig.Values['Server']+
                                            ';Use Procedure for Prepare=1;Auto Translate=True;Initial File Name=""';
          ADOconnection.Connected := True;
        end;

    except  on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    ArquivoConfig.Free;
  end;
end;

end.
