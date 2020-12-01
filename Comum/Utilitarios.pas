unit Utilitarios;

interface

uses DM, SysUtils, Dialogs, Masks, DB, XSBuiltIns;

function CriarBanco: Tdb;

var
  Banco: Tdb;

implementation

function CriarBanco: Tdb;
var
  banco: Tdb;
begin
  banco := Tdb.Create(nil);
  banco.InicializarParametros;
  Result := banco;
end;

initialization

end.

