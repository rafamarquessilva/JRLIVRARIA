unit FRelFechamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.Win.ADODB, Utilitarios, ComObj, System.DateUtils;

type
  TFormRelFechamento = class(TForm)
    btnImprimir: TSpeedButton;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    stpRel: TADOStoredProc;
    stpRelChave: TAutoIncField;
    stpRelCodigo: TStringField;
    stpRelObra: TStringField;
    stpRelEditora: TStringField;
    stpRelValor: TBCDField;
    stpRelEstoqueInicial: TIntegerField;
    stpRelQuantidadeDev: TIntegerField;
    stpRelQuantidadeAtual: TIntegerField;
    EdtCodigoBarras: TEdit;
    chkListarLivrosDev: TCheckBox;
    Label2: TLabel;
    edtIAnoIBDA: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelFechamento: TFormRelFechamento;

implementation

{$R *.dfm}

procedure TFormRelFechamento.btnImprimirClick(Sender: TObject);
var
  excel, Sheet: Variant;
  linha: integer;
  Tipo: String;
  Campos: Array of string;
  i:integer;
  Opcao: String;
  iAnoIBDA: Integer;
function xInc(var i: integer):integer;
begin
  inc(i);
  result := i;
end;
begin
  iAnoIBDA := 0;
  if not(Banco.ADOconnection.Connected) then
    Banco.ADOconnection.Connected := True;

  stpRel.Connection := Banco.ADOconnection;

  if chkListarLivrosDev.Checked then
    Opcao := 'S'
  else
    Opcao := 'N';

  if trim(edtIAnoIBDA.Text) <> '' then
    iAnoIBDA := StrToIntDef(edtIAnoIBDA.Text, 0);

  stpRel.Close;
  stpRel.Parameters.ParamByName('CodigoBarras').Value := EdtCodigoBarras.Text;
  stpRel.Parameters.ParamByName('ApenasDevolvidos').Value := Opcao;
  stpRel.Parameters.ParamByName('AnoIBDA').Value := iAnoIBDA;
  stpRel.Open;

  if stpRel.RecordCount > 0 then
  begin
    try
      try
        excel := CreateOleObject('Excel.Application');
        excel.Workbooks.add(1);
        excel.Workbooks[1].WorkSheets[1].Name := 'Fechamento';
        Sheet := excel.WorkBooks[1].WorkSheets['Fechamento'];

        Sheet.Range['B2'] := 'Fechamento';

        Sheet.Range['B2'].font.name := 'Arial';
        Sheet.Range['B2','H2'].font.bold := true;
        Sheet.Range['B2','H2'].font.size := 14;
        Sheet.Range['B2','H2'].font.italic := true;
        Sheet.Range['B2:b2'].HorizontalAlignment := 3;

        i:= -1;
        SetLength(Campos,5);
        Campos[xinc(i)] := 'Cód. Barras';
        Campos[xinc(i)] := 'Título';
        Campos[xinc(i)] := 'Estoque Inicial';
        Campos[xinc(i)] := 'Qtde. Vendida';
        Campos[xinc(i)] := 'Qtde. Devolvida';

        i:= -1;
        Sheet.Range['A4']  := Campos[xinc(i)];
        Sheet.Range['B4']  := Campos[xinc(i)];
        Sheet.Range['C4']  := Campos[xinc(i)];
        Sheet.Range['D4']  := Campos[xinc(i)];
        Sheet.Range['E4']  := Campos[xinc(i)];

        Sheet.Range['A4:E4'].font.bold := true;

        for linha := 0 to stpRel.RecordCount - 1 do
        begin
          Tipo := '@';
          Sheet.cells [linha+5, 1].NumberFormat := Tipo;

          Sheet.cells [linha+5, 1]  := stpRelCodigo.AsString;
          Sheet.cells [linha+5, 2]  := stpRelObra.AsString;
          Sheet.cells [linha+5, 3]  := stpRelEstoqueInicial.AsInteger;
          Sheet.cells [linha+5, 4]  := stpRelQuantidadeAtual.AsInteger;
          Sheet.cells [linha+5, 5]  := stpRelQuantidadeDev.AsInteger;
          if stpRelQuantidadeDev.AsInteger > 0 then
          begin
            Sheet.cells [linha+5, 5].Font.Color := clRed;
            Sheet.cells [linha+5, 5] := stpRelQuantidadeDev.AsInteger;
          end
          else
          begin
            Sheet.cells [linha+5, 5].Font.Color := clBlack;
            Sheet.cells [linha+5, 5] := stpRelQuantidadeDev.AsInteger;
          end;
          stpRel.Next;
        end;
        //Ajustando a largura das colunas
        Sheet.Range['A:A'].ColumnWidth := 14;
        Sheet.Range['B:B'].ColumnWidth := 93;
        Sheet.Range['C:C'].ColumnWidth := 14;
        Sheet.Range['D:D'].ColumnWidth := 14;
        Sheet.Range['E:E'].ColumnWidth := 14;
      except
        raise Exception.Create('Erro na criação da planilha do excel.');
      end;
      Excel.Visible := True;
    finally
      excel := null;
    end;
  end
  else
    raise Exception.Create('Não foi encontrado nenhum registro!');
end;

procedure TFormRelFechamento.FormShow(Sender: TObject);
begin
  edtIAnoIBDA.Text := IntToStr(YearOf(Now));
end;

procedure TFormRelFechamento.SpeedButton1Click(Sender: TObject);
begin
  EdtCodigoBarras.Clear;
  chkListarLivrosDev.Checked := False;
end;

end.
