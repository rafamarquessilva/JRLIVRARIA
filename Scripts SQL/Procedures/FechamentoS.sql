if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'[dbo].FechamentoS') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].FechamentoS
GO

CREATE PROCEDURE FechamentoS
(
	@CodigoBarras		VARCHAR(30) NULL,
	@ApenasDevolvidos	CHAR(1),
	@AnoIBDA			INT = 0
)

AS

IF TRIM(@CodigoBarras) = ''
	SET @CodigoBarras = NULL
ELSE
	SET @CodigoBarras = dbo.Fn_extrairnumero(@CodigoBarras)

IF @ApenasDevolvidos = ''
	SET @ApenasDevolvidos = 'N'

IF @AnoIBDA = 0
	SET @AnoIBDA = NULL

SELECT  p.Chave,
        p.Codigo,               
        p.Descricao AS Obra,              
        e.Descricao AS Editora, 
        p.Valor,
		p.EstoqueInicial,
		p.QuantidadeDev,
		(p.EstoqueInicial - p.QuantidadeDev) AS QuantidadeAtual
FROM	Produto p             
LEFT JOIN Editora e ON e.Chave = p.Editora 
WHERE	p.Codigo  = ISNULL(@CodigoBarras, p.Codigo)
AND		p.AnoIBDA = ISNULL(@AnoIBDA, p.AnoIBDA)
AND		(
			@ApenasDevolvidos = 'N' 
			OR
			(@ApenasDevolvidos = 'S' AND p.QuantidadeDev > 0)
		)
ORDER	BY p.Descricao

RETURN

GO