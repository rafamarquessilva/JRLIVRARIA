unit FProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Utilitarios,
  Vcl.Buttons, Vcl.ExtDlgs, System.UITypes;

type
  TFormProduto = class(TForm)
    DBNavigator1: TDBNavigator;
    ADOTableProduto: TADOTable;
    dsProduto: TDataSource;
    ADOTableProdutoChave: TAutoIncField;
    ADOTableProdutoEditora: TIntegerField;
    ADOTableProdutoCodigo: TStringField;
    ADOTableProdutoValor: TBCDField;
    ADOTableProdutoDescricao: TStringField;
    ADOTableProdutoEdicao: TStringField;
    ADOTableProdutoAutor: TStringField;
    ADOTableProdutoArquivo: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Panel1: TPanel;
    OpenDialog: TOpenPictureDialog;
    Image1: TImage;
    DBEdit7: TDBEdit;
    btnDiretorioArquivos: TSpeedButton;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    qryEditora: TADOQuery;
    qryEditoraChave: TAutoIncField;
    qryEditoraDescricao: TStringField;
    dsEditora: TDataSource;
    ADOTableProdutoEstoqueInicial: TIntegerField;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    ADOTableProdutoQuantidadeDev: TIntegerField;
    ADOTableProdutoAnoIBDA: TIntegerField;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnDiretorioArquivosClick(Sender: TObject);
    procedure ADOTableProdutoAfterScroll(DataSet: TDataSet);
    procedure ADOTableProdutoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADOTableProdutoBeforePost(DataSet: TDataSet);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProduto: TFormProduto;

implementation

{$R *.dfm}

procedure TFormProduto.ADOTableProdutoAfterScroll(DataSet: TDataSet);
begin
  // carrega a imagem do produto
  if FileExists(ADOTableProdutoArquivo.AsString) then
    Image1.Picture.LoadFromFile(ADOTableProdutoArquivo.AsString)
  else
    Image1.Picture.LoadFromFile('C:\Imagens\ImagemNaoEncontrada.jpg');
end;

procedure TFormProduto.ADOTableProdutoBeforePost(DataSet: TDataSet);
begin
  if Trim(ADOTableProdutoCodigo.AsString) = EmptyStr then
    raise Exception.Create('Preencha o campo Código de barras');

  if ADOTableProdutoAnoIBDA.IsNull then
    raise Exception.Create('Preencha o campo Ano IBDA');

  if ADOTableProdutoValor.IsNull then
    raise Exception.Create('Preencha o campo Valor');

  if Trim(ADOTableProdutoDescricao.AsString) = EmptyStr then
    raise Exception.Create('Preencha o campo Descrição');
end;

procedure TFormProduto.ADOTableProdutoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
//
  if POS('chave duplicada', E.Message) > 0 then
    raise Exception.Create('Produto já cadastrado para esse código de barras');

end;

procedure TFormProduto.btnDiretorioArquivosClick(Sender: TObject);
var
  Origem,
  Destino :array[0..512] of Char;
  Sobrescreve :Boolean;
  Diretorio : String;
begin
  Sobrescreve := False;
  if OpenDialog.Execute then
  begin
    Diretorio := 'C:\Imagens\'+ ExtractFileName(OpenDialog.FileName);
    if FileExists(Diretorio) then
      Sobrescreve := MessageDlg('O arquivo já existe no destino. Deseja sobrescrevê-lo?', mtConfirmation, [mbNo, mbYes], 0) = mrYes;

    StrPCopy(Origem, OpenDialog.FileName);
    StrPCopy(Destino, Diretorio);
    CopyFile(Origem, Destino, Sobrescreve);

    Image1.Picture.LoadFromFile(Diretorio);
    ADOTableProduto.Edit;
    ADOTableProdutoArquivo.AsString := Diretorio;
  end;
end;

procedure TFormProduto.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key =#32 then
    DBLookupComboBox1.DropDown;
end;

procedure TFormProduto.FormCreate(Sender: TObject);
begin
  if not(Banco.ADOconnection.Connected) then
    Banco.ADOconnection.Connected := True;

    ADOTableProduto.Connection := Banco.ADOconnection;
    ADOTableProduto.TableName := 'Produto';
    ADOTableProduto.Active := True;

  // CARREGA A COMBO DE EDITORAS
  qryEditora.Connection := Banco.ADOconnection;
  qryEditora.Open;
end;

end.
