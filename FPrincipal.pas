unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Utilitarios, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, FPreco, FPesquisa, FEditora, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage, FProduto, FFechamento,
  FRelFechamento, Vcl.ComCtrls;

type
  TFormPrincipal = class(TForm)
    Panel2: TPanel;
    btnPesquisa: TSpeedButton;
    Image1: TImage;
    Panel1: TPanel;
    btnPreco: TSpeedButton;
    Image2: TImage;
    Panel3: TPanel;
    btnProduto: TSpeedButton;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    Image4: TImage;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    Image3: TImage;
    Image5: TImage;
    Panel6: TPanel;
    SpeedButton3: TSpeedButton;
    Image6: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnPrecoClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    procedure CriarFormulario(T: TFormClass; F: TForm);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  Banco := CriarBanco;
end;

procedure TFormPrincipal.SpeedButton1Click(Sender: TObject);
begin
 CriarFormulario(TFormEditora, FormEditora);
end;

procedure TFormPrincipal.SpeedButton2Click(Sender: TObject);
begin
 CriarFormulario(TFormFechamento, FormFechamento);
end;

procedure TFormPrincipal.SpeedButton3Click(Sender: TObject);
begin
CriarFormulario(TFormRelFechamento, FormRelFechamento);
end;

procedure TFormPrincipal.Timer1Timer(Sender: TObject);
begin
StatusBar1.Panels[0].Text := ' Hora: ' + FormatDateTime('hh:nn:ss',now);
StatusBar1.Panels[1].Text := ' ' + FormatDateTime ('dddd", "dd" de "mmmm" de "yyyy',now);
end;

procedure TFormPrincipal.btnPesquisaClick(Sender: TObject);
begin
 CriarFormulario(TFormPesquisa, FormPesquisa);
end;

procedure TFormPrincipal.btnPrecoClick(Sender: TObject);
begin
  CriarFormulario(TFormPreco, FormPreco);
end;

procedure TFormPrincipal.btnProdutoClick(Sender: TObject);
begin
  CriarFormulario(TFormProduto, FormProduto);
end;

procedure TFormPrincipal.CriarFormulario(T: TFormClass; F: TForm);
begin
  try
    Application.CreateForm(T, F);
    F.ShowModal;
  finally
    if Assigned(F) then
      FreeAndNil(F);
  end;
end;

end.
