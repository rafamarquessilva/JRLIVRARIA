unit FPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Data.Win.ADODB, Utilitarios, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.jpeg, pngimage;

type
  TFormPreco = class(TForm)
    qryConsulta: TADOQuery;
    qryConsultaChave: TAutoIncField;
    qryConsultaCodigo: TStringField;
    qryConsultaValor: TBCDField;
    qryConsultaArquivo: TStringField;
    dsConsulta: TDataSource;
    Panel1: TPanel;
    lblCodigoBarras: TLabel;
    EdtCodigoBarras: TEdit;
    Panel2: TPanel;
    imgImagem: TImage;
    lblPreco: TLabel;
    lblValor: TLabel;
    SpeedButton1: TSpeedButton;
    btnLimpar: TSpeedButton;
    procedure btnLimparClick(Sender: TObject);
    procedure EdtCodigoBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure PesquisaValoProduto;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPreco: TFormPreco;

implementation

{$R *.dfm}

procedure TFormPreco.btnLimparClick(Sender: TObject);
begin
  if qryConsulta.Active then
    qryConsulta.Close;

  imgImagem.Picture := nil;
  EdtCodigoBarras.Clear;
  lblValor.Visible := False;
  lblPreco.Visible := False;
end;

procedure TFormPreco.EdtCodigoBarrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    PesquisaValoProduto;
  end;
end;

procedure TFormPreco.PesquisaValoProduto;
var
  sCodigoBarras: String;
begin
  sCodigoBarras := EmptyStr;
  try
    if not(Banco.ADOconnection.Connected) then
      Banco.ADOconnection.Connected := True;

      qryConsulta.Connection := Banco.ADOconnection;

      sCodigoBarras := Trim(EdtCodigoBarras.Text);

      if qryConsulta.Active then
        qryConsulta.Close;

      imgImagem.Picture := nil;

      qryConsulta.SQL.Clear;
      qryConsulta.SQL.Text := ' EXEC ProdutoS                      '+
                              '      @Obra = :Obra,                '+
                              '      @Autor = :Autor,              '+
                              '      @Editora = :Editora,          '+
                              '      @CodigoBarras = :CodigoBarras, '+
                              '      @AnoIBDA = :AnoIBDA            ';
      qryConsulta.Parameters.ParamByName('Obra').Value := '';
      qryConsulta.Parameters.ParamByName('Autor').Value := '';
      qryConsulta.Parameters.ParamByName('Editora').Value := 0;
      qryConsulta.Parameters.ParamByName('CodigoBarras').Value := sCodigoBarras;
      qryConsulta.Parameters.ParamByName('AnoIBDA').Value := 0;
      qryConsulta.Open;

      if not qryConsulta.Eof then
      begin
        if FileExists(qryConsultaArquivo.AsString) then
          imgImagem.Picture.LoadFromFile(qryConsultaArquivo.AsString)
        else
          imgImagem.Picture.LoadFromFile('C:\Imagens\ImagemNaoEncontrada.jpg');

        lblValor.Visible := True;
        lblPreco.Visible := True;
        lblValor.Caption := FormatFloat('#,##0.00', qryConsultaValor.Value);
      end
      else
      begin
        Application.MessageBox('Produto não encontrado. Utilize a busca Avançada.', '', MB_ICONINFORMATION);
      end;

  except
    on E: Exception do
      raise Exception.Create('ERROR: ' + E.Message);
  end;
end;

procedure TFormPreco.SpeedButton1Click(Sender: TObject);
begin
  if Trim(EdtCodigoBarras.Text) = EmptyStr then
  begin
    Application.MessageBox('Informe o código de barras.', '', MB_ICONINFORMATION);
    Exit;
  end;
  PesquisaValoProduto;
end;

end.
