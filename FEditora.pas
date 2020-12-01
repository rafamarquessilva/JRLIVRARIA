unit FEditora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.DBCtrls, Vcl.ExtCtrls, Utilitarios;

type
  TFormEditora = class(TForm)
    ADOTableEditora: TADOTable;
    dsEditora: TDataSource;
    ADOTableEditoraChave: TAutoIncField;
    ADOTableEditoraDescricao: TStringField;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditora: TFormEditora;

implementation

{$R *.dfm}

procedure TFormEditora.FormShow(Sender: TObject);
begin
  if not(Banco.ADOconnection.Connected) then
    Banco.ADOconnection.Connected := True;

  ADOTableEditora.Connection := Banco.ADOconnection;
  ADOTableEditora.Open;
end;

end.
