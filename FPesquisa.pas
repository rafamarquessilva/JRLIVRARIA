unit FPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.jpeg, pngimage, Vcl.DBCtrls, Data.Win.ADODB, Utilitarios,
  Vcl.ExtDlgs, Vcl.Mask, System.DateUtils, FProduto;

type
  TFormPesquisa = class(TForm)
    Panel1: TPanel;
    btnPesquisar: TSpeedButton;
    lblObra: TLabel;
    lblAutor: TLabel;
    btnLimpar: TSpeedButton;
    edtObra: TEdit;
    edtAutor: TEdit;
    lblEditora: TLabel;
    cmbEditora: TDBComboBox;
    qryProdutos: TADOQuery;
    dsProdutos: TDataSource;
    qryProdutosChave: TAutoIncField;
    qryProdutosCodigo: TStringField;
    qryProdutosValor: TBCDField;
    qryProdutosEdicao: TStringField;
    qryEditora: TADOQuery;
    dsEditora: TDataSource;
    qryEditoraChave: TAutoIncField;
    qryEditoraDescricao: TStringField;
    qryProdutosObra: TStringField;
    qryProdutosEditora: TStringField;
    qryProdutosArquivo: TStringField;
    Panel2: TPanel;
    grdProdutos: TDBGrid;
    Panel3: TPanel;
    imgImagem: TImage;
    qryProdutosAnoIBDA: TIntegerField;
    Label1: TLabel;
    edtIAnoIBDA: TEdit;
    Label2: TLabel;
    edtCodigo: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure grdProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnLimparClick(Sender: TObject);
    procedure qryProdutosAfterScroll(DataSet: TDataSet);
    procedure grdProdutosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisa: TFormPesquisa;

implementation

{$R *.dfm}

procedure TFormPesquisa.btnLimparClick(Sender: TObject);
begin
  if qryProdutos.Active then
    qryProdutos.Close;

  edtCodigo.Clear;
  edtObra.Clear;
  edtAutor.Clear;
  edtIAnoIBDA.Clear;
  cmbEditora.ItemIndex := -1;
  imgImagem.Picture := nil;
end;

procedure TFormPesquisa.btnPesquisarClick(Sender: TObject);
var
  sCodigo, sObra, sAutor: String;
  iEditora, iAnoIBDA: Integer;
begin
  iEditora := 0;
  iAnoIBDA := 0;
  try
    if not(Banco.ADOconnection.Connected) then
      Banco.ADOconnection.Connected := True;

      qryProdutos.Connection := Banco.ADOconnection;

      sCodigo  := Trim(edtCodigo.Text);
      sObra  := Trim(edtObra.Text);
      sAutor := Trim(edtAutor.Text);

      if trim(edtIAnoIBDA.Text) <> '' then
        iAnoIBDA := StrToIntDef(edtIAnoIBDA.Text, 0);
      if cmbEditora.ItemIndex <> -1 then
        iEditora := Integer(cmbEditora.Items.Objects[cmbEditora.ItemIndex]);

      imgImagem.Picture := nil;

      qryProdutos.SQL.Clear;
      qryProdutos.SQL.Text := ' EXEC ProdutoS                       '+
                              '      @Obra = :Obra,                 '+
                              '      @Autor = :Autor,               '+
                              '      @Editora = :Editora,           '+
                              '      @CodigoBarras = :CodigoBarras, '+
                              '      @AnoIBDA = :AnoIBDA            ';
      qryProdutos.Parameters.ParamByName('Obra').Value    := UpperCase(Trim(edtObra.Text));
      qryProdutos.Parameters.ParamByName('Autor').Value   := UpperCase(Trim(edtAutor.Text));
      qryProdutos.Parameters.ParamByName('Editora').Value := iEditora;
      qryProdutos.Parameters.ParamByName('CodigoBarras').Value := UpperCase(Trim(edtCodigo.Text));
      qryProdutos.Parameters.ParamByName('AnoIBDA').Value := iAnoIBDA;
      qryProdutos.Open;
  except
    on E: Exception do
      raise Exception.Create('ERROR: ' + E.Message);
  end;
end;

procedure TFormPesquisa.FormShow(Sender: TObject);
begin
  // CARREGA A COMBO DE EDITORAS

  if not(Banco.ADOconnection.Connected) then
    Banco.ADOconnection.Connected := True;

  qryEditora.Connection := Banco.ADOconnection;
  qryEditora.Open;

  while not qryEditora.Eof do
  begin
    cmbEditora.Items.AddObject(qryEditoraDescricao.AsString, TObject(qryEditoraChave.AsInteger));
    qryEditora.Next;
  end;
  cmbEditora.Text := ' ';
  cmbEditora.ItemIndex := -1;
  edtIAnoIBDA.Text := IntToStr(YearOf(Now));
end;

procedure TFormPesquisa.grdProdutosDblClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFormProduto, FormProduto);
    if FormProduto.ADOTableProduto.Active then
      FormProduto.ADOTableProduto.Locate('Codigo', qryProdutosCodigo.AsString, []);
    FormProduto.ShowModal;
  finally
    if Assigned(FormProduto) then
      FreeAndNil(FormProduto);
  end;
end;

procedure TFormPesquisa.grdProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if qryProdutos.Active then
  begin
    if qryProdutos.RecNo mod 2 = 0 then
      grdProdutos.Canvas.Brush.Color := clGradientInactiveCaption;
  end;
  grdProdutos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormPesquisa.qryProdutosAfterScroll(DataSet: TDataSet);
begin
  // carrega a imagem do produto
  if FileExists(qryProdutosArquivo.AsString) then
    imgImagem.Picture.LoadFromFile(qryProdutosArquivo.AsString)
  else
    imgImagem.Picture.LoadFromFile('C:\Imagens\ImagemNaoEncontrada.jpg');
end;

end.
