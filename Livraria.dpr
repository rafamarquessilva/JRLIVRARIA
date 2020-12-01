program Livraria;

uses
  Vcl.Forms,
  FPrincipal in 'FPrincipal.pas' {FormPrincipal},
  DM in 'DM.pas' {db: TDataModule},
  Utilitarios in 'Comum\Utilitarios.pas',
  FPreco in 'FPreco.pas' {FormPreco},
  FPesquisa in 'FPesquisa.pas' {FormPesquisa},
  FProduto in 'FProduto.pas' {FormProduto},
  FEditora in 'FEditora.pas' {FormEditora},
  FFechamento in 'FFechamento.pas' {FormFechamento},
  FRelFechamento in 'FRelFechamento.pas' {FormRelFechamento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(Tdb, db);
  Application.Run;
end.
