/*
	SCRIPT DE CRIAÇÃO DAS TABELAS
	AUTOR: Rafael Marques da Silva
	DATA: 29/08/2018
	LIVRARIA
*/

USE LIVRARIA

-------------
-- EDITORA --
-------------
IF NOT EXISTS (SELECT * FROM sysobjects WHERE NAME='Editora' AND xtype='U')
BEGIN
	CREATE TABLE Editora
	(
		Chave			INT IDENTITY NOT NULL,
		Descricao		VARCHAR(100) NOT NULL
		CONSTRAINT PK_Editora_Chave PRIMARY KEY(Chave)
	)
END 

-------------
-- AUTOR --
-------------
--IF NOT EXISTS (SELECT * FROM sysobjects WHERE NAME='Autor' AND xtype='U')
--BEGIN
--	CREATE TABLE Autor
--	(
--		Chave			INT IDENTITY NOT NULL,
--		Nome			VARCHAR(100) NOT NULL
--		CONSTRAINT PK_Autor_Chave PRIMARY KEY(Chave)
--	)
--END 

-------------
-- PRODUTO --
-------------
IF NOT EXISTS (SELECT * FROM sysobjects WHERE NAME='Produto' AND xtype='U')
BEGIN
	CREATE TABLE Produto
	(
		Chave			INT IDENTITY NOT NULL,
		[Editora] [int] NULL,
		[Codigo] [varchar](15) NOT NULL,
		[Valor] [numeric](10, 2) NOT NULL,
		[Descricao] [varchar](100) NOT NULL,
		[Edicao] [varchar](40) NULL,
		[Autor] [varchar](500) NULL,
		[Arquivo] [varchar](500) NULL,
		[EstoqueInicial] [int] NULL,
		[QuantidadeDev] [int] NOT NULL,
		CONSTRAINT PK_Produto_Chave PRIMARY KEY(Chave)
	)
	ALTER TABLE Produto ADD CONSTRAINT FK_Produdo_Editora FOREIGN KEY (Editora) REFERENCES Editora (Chave);
	CREATE UNIQUE INDEX AK_Produto_Codigo ON Produto (Codigo);   
END

------------------
-- AUTORPRODUTO --
------------------
--IF NOT EXISTS (SELECT * FROM sysobjects WHERE NAME='AutorProduto' AND xtype='U')
--BEGIN
--	CREATE TABLE AutorProduto
--	(
--		Chave			INT IDENTITY NOT NULL,
--		Produto			INT NOT NULL,
--		Autor			INT NOT NULL
--		CONSTRAINT PK_AutorProduto_Chave PRIMARY KEY(Chave)
--	)
--	ALTER TABLE AutorProduto ADD CONSTRAINT FK_AutorProduto_Produto FOREIGN KEY (Produto) REFERENCES Produto (Chave);
--	ALTER TABLE AutorProduto ADD CONSTRAINT FK_AutorProduto_Autor FOREIGN KEY (Autor) REFERENCES Autor (Chave);
--END 

/*
--DROP TABLE AutorProduto
DROP TABLE Produto
DROP TABLE Editora
--DROP TABLE Autor

*/
