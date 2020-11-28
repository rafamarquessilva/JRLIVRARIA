if exists (select * from dbo.sysobjects where id = OBJECT_ID(N'[dbo].BaixaEstoque') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].BaixaEstoque
GO

CREATE PROCEDURE BaixaEstoque
(
	@Chave			INT,
	@Quantidade		INT

)

AS

UPDATE	Produto
SET		QuantidadeDev = ISNULL(QuantidadeDev, 0) + @Quantidade
WHERE	Chave = @Chave


-- GRAVA LOG DE IMPORTAÇÃO -- 

-----------------------------

RETURN

GO