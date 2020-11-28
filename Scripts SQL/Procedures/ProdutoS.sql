if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'[dbo].ProdutoS') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].ProdutoS
GO

CREATE PROCEDURE ProdutoS
(
	@Obra			VARCHAR(500) NULL,
	@Autor			VARCHAR(500) NULL,
	@Editora		INT NULL,
	@CodigoBarras	VARCHAR(30) NULL,
	@AnoIBDA		INT = 0
)

AS

IF @Editora = 0
	SET @Editora = NULL

IF @Obra = ''
	SET	@Obra = NULL	

IF @Autor = ''
	SET @Autor = NULL

IF TRIM(@CodigoBarras) = ''
	SET @CodigoBarras = NULL
ELSE
	SET @CodigoBarras = dbo.Fn_extrairnumero(@CodigoBarras)

IF @AnoIBDA = 0
	SET @AnoIBDA = NULL

SELECT  p.Chave,
        p.Codigo,          
		p.AnoIBDA,
        p.Descricao AS Obra,    
        p.Edicao,               
        e.Descricao AS Editora, 
        p.Valor,
		p.Arquivo,
		p.EstoqueInicial,
		p.QuantidadeDev AS QuantidadeDevolvida
FROM	Produto p             
LEFT JOIN Editora e ON e.Chave = p.Editora 
WHERE	p.Codigo  = ISNULL(@CodigoBarras, p.Codigo)
AND		p.AnoIBDA = ISNULL(@AnoIBDA, p.AnoIBDA)
AND		(@Editora IS NULL OR @Editora = ISNULL(p.Editora, 0))
AND		(@Obra IS NULL OR dbo.fnTiraAcento(p.Descricao) LIKE '%'+dbo.fnTiraAcento(@Obra)+'%')
AND		(@Autor IS NULL OR dbo.fnTiraAcento(p.Autor) LIKE '%'+dbo.fnTiraAcento(@Autor)+'%')
ORDER	BY p.Descricao

RETURN

GO