unit FFechamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Data.Win.ADODB, Utilitarios, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.jpeg, pngimage,
  Vcl.ButtonGroup;

type
  TFormFechamento = class(TForm)
    qryConsulta: TADOQuery;
    qryConsultaChave: TAutoIncField;
    qryConsultaCodigo: TStringField;
    qryConsultaValor: TBCDField;
    qryConsultaArquivo: TStringField;
    Panel1: TPanel;
    lblCodigoBarras: TLabel;
    EdtCodigoBarras: TEdit;
    EdtQtdeDevolvido: TEdit;
    Label1: TLabel;
    btnLimpar: TSpeedButton;
    btnConfirmar: TSpeedButton;
    qryConsultaEstoqueInicial: TIntegerField;
    qryConsultaQuantidadeDevolvida: TIntegerField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    dsConsulta: TDataSource;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    imgImagem: TImage;
    GroupBox1: TGroupBox;
    chkAjute: TCheckBox;
    EdtAjuste: TEdit;
    btnAjuste: TBitBtn;
    procedure btnLimparClick(Sender: TObject);
    procedure EdtCodigoBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAjusteClick(Sender: TObject);
    procedure chkAjuteClick(Sender: TObject);
  private
    procedure PesquisaValoProduto;
    procedure HabilitaAjuste;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFechamento: TFormFechamento;

implementation

{$R *.dfm}

procedure TFormFechamento.btnLimparClick(Sender: TObject);
begin
  if qryConsulta.Active then
    qryConsulta.Close;

  imgImagem.Picture := nil;
  EdtCodigoBarras.Clear;
  EdtQtdeDevolvido.Clear;
  EdtAjuste.Clear;
  btnConfirmar.Enabled := False;
  chkAjute.Checked := False;

  HabilitaAjuste;
  chkAjute.Enabled := False;
  EdtCodigoBarras.SetFocus;
end;

procedure TFormFechamento.chkAjuteClick(Sender: TObject);
begin
  EdtAjuste.Clear;
  HabilitaAjuste;
end;

procedure TFormFechamento.EdtCodigoBarrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_RETURN] then
  begin
    PesquisaValoProduto;
  end;
end;

procedure TFormFechamento.FormShow(Sender: TObject);
begin
  btnConfirmar.Enabled := False;
  chkAjute.Enabled := False;
  HabilitaAjuste;
end;

procedure TFormFechamento.HabilitaAjuste;
begin
  if chkAjute.Checked then
  begin
    EdtAjuste.Enabled := True;
    btnAjuste.Enabled := True;
  end
  else
  begin
    EdtAjuste.Enabled := False;
    btnAjuste.Enabled := False;
  end;
end;

procedure TFormFechamento.PesquisaValoProduto;
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

        EdtQtdeDevolvido.Text := '1';
        btnConfirmar.Enabled := True;
        chkAjute.Enabled := True;

        chkAjute.Checked := False;
        HabilitaAjuste;
      end
      else
      begin
        btnConfirmar.Enabled := False;
        chkAjute.Enabled := False;
        HabilitaAjuste;
        Application.MessageBox('Produto não encontrado.', '', MB_ICONERROR);
      end;

  except
    on E: Exception do
      raise Exception.Create('ERROR: ' + E.Message);
  end;
end;

procedure TFormFechamento.btnAjusteClick(Sender: TObject);
var
  qryAjuste: TADOQuery;
begin

  if (Trim(EdtCodigoBarras.Text) = '') OR (qryConsultaChave.AsInteger = 0) then
  begin
    Application.MessageBox('Informe o código de barras do produto e pressione ENTER!', '', MB_ICONERROR);
    Exit;
  end;

  if StrToIntDef(EdtAjuste.Text, -1) <= -1 then
  begin
    Application.MessageBox('Informe uma quantidade válida!', '', MB_ICONERROR);
    Exit;
  end;

  if StrToIntDef(EdtAjuste.Text, 0) > qryConsultaEstoqueInicial.AsInteger then
  begin
    Application.MessageBox(PChar('Quantidade "a devolver" deve ser menor ou igual à "Estoque Inicial"'), '', MB_ICONERROR);
    Exit;
  end;

  if Trim(EdtCodigoBarras.Text) <> qryConsultaCodigo.AsString then
  begin
    Application.MessageBox('Limpe e pesquise novamente o produto!', '', MB_ICONERROR);
    Exit;
  end;

  try
    qryAjuste := TADOQuery.Create(nil);

    qryAjuste.Connection := qryConsulta.Connection;

    qryAjuste.SQL.Clear;
    qryAjuste.SQL.Text := ' UPDATE  Produto '+
                          ' SET     QuantidadeDev = :QuantidadeDev '+
                          ' WHERE   Chave = :Chave ';
    qryAjuste.Parameters.ParamByName('QuantidadeDev').Value := StrToInt(EdtAjuste.Text);
    qryAjuste.Parameters.ParamByName('Chave').Value := qryConsultaChave.AsInteger;

    qryAjuste.ExecSQL;

    Application.MessageBox('Processo realizado com Sucesso!', '', MB_ICONINFORMATION);
    PesquisaValoProduto;

  finally
    if Assigned(qryAjuste) then
      FreeAndNil(qryAjuste);
  end;
end;

procedure TFormFechamento.btnConfirmarClick(Sender: TObject);
var
  qryEstoque: TADOQuery;
  Saldo: Integer;
begin

  if (Trim(EdtCodigoBarras.Text) = '') OR (qryConsultaChave.AsInteger = 0) then
  begin
    Application.MessageBox('Informe o código de barras do produto e pressione ENTER!', '', MB_ICONERROR);
    Exit;
  end;

  if StrToIntDef(EdtQtdeDevolvido.Text, 0) <= 0 then
  begin
    Application.MessageBox('Informe uma quantidade válida!', '', MB_ICONERROR);
    Exit;
  end;

  Saldo := (qryConsultaEstoqueInicial.AsInteger -  qryConsultaQuantidadeDevolvida.AsInteger);

  if Saldo <= 0 then
  begin
    Application.MessageBox('Não há quantidade para ser devolvida!', '', MB_ICONERROR);
    Exit;
  end;

  if StrToIntDef(EdtQtdeDevolvido.Text, 0) > Saldo then
  begin
    Application.MessageBox(PChar('Quantidade "a devolver" deve ser menor ou igual à '+IntToStr(Saldo)+' unidade(s).'), '', MB_ICONERROR);
    Exit;
  end;

  if Trim(EdtCodigoBarras.Text) <> qryConsultaCodigo.AsString then
  begin
    Application.MessageBox('Limpe e pesquise novamente o produto!', '', MB_ICONERROR);
    Exit;
  end;

  try
    qryEstoque := TADOQuery.Create(nil);

    qryEstoque.Connection := qryConsulta.Connection;

    qryEstoque.SQL.Clear;
    qryEstoque.SQL.Text := ' EXEC BaixaEstoque               '+
                            '      @Chave = :Chave,          '+
                            '      @Quantidade = :Quantidade ';
    qryEstoque.Parameters.ParamByName('Chave').Value := qryConsultaChave.AsInteger;
    qryEstoque.Parameters.ParamByName('Quantidade').Value := StrToInt(EdtQtdeDevolvido.Text);
    qryEstoque.ExecSQL;

    Application.MessageBox('Processo realizado com Sucesso!', '', MB_ICONINFORMATION);
    btnLimparClick(Sender);

  finally
    if Assigned(qryEstoque) then
      FreeAndNil(qryEstoque);
  end;
end;

end.
