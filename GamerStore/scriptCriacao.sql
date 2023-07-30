use gamerstore
go
/* criando a tabela cliente */
create table cliente (
	idCliente INT PRIMARY KEY IDENTITY,
	nomeCliente varchar(30),
	emailCliente varchar(35),
	telefoneCliente varchar(30),
	idade varchar(3),
	sexo char(1),
	estado char(2)
)
go
/* constraint */ 
ALTER TABLE cliente
ADD CONSTRAINT CK_SEXO CHECK(SEXO IN ('M','F'))
GO
/* desc table */
sp_columns cliente

/* CRIANDO A TABELA ESTOQUE */
create table estoque (
	idproduto INT PRIMARY KEY IDENTITY,
	nomeProduto varchar(40),
	precoProduto decimal,
	quantidadeProduto int
)
go
/* CRIANDO A TABELA VENDAS */
create table vendas (
	idvendas INT PRIMARY KEY IDENTITY,
	quantidadeProduto int,
	valorTotal decimal,
	idCliente int
)
go
/* ATRIBUINDO FK */
ALTER TABLE vendas
ADD CONSTRAINT FK_vendas_cliente
FOREIGN KEY (idCliente)
REFERENCES cliente (idCliente)
GO
ALTER TABLE ESTOQUE
ADD CONSTRAINT FK_PRODUTO_ESTOQUE
FOREIGN KEY (IDPRODUTO)
REFERENCES ESTOQUE(IDPRODUTO)
GO

/* CRIANDO TRIGGER
- TODA VEZ QUE UMA VENDA FOR EXECUTADA DIMINUI A QUANTIDADE DE PRODUTO NO ESTOQUE
*/

CREATE TRIGGER TRG_VENDA_ATUALIZA_ESTOQUE
ON VENDAS
AFTER INSERT 
AS BEGIN 
	-- ATUALIZAR O ESTOQUE
	UPDATE ESTOQUE
	SET quantidadeProduto = estoque.quantidadeProduto - i.quantidadeProduto
	FROM ESTOQUE
	INNER JOIN INSERTED I ON ESTOQUE.IDPRODUTO = I.idCliente;
END;
GO
