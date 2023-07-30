create database gamerstore
  
use gamerstore
go

/* criando a tabela cliente */
create table cliente (
	idCliente INT PRIMARY KEY IDENTITY,
	nomeCliente varchar(30),
	emailCliente varchar(100),
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
	idCliente int,
	idproduto int,
	FOREIGN KEY (idproduto) References estoque(idproduto)
)
go

/* ATRIBUINDO FKS*/
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


-- INSERINDO DADOS ----

-- Clientes
insert into cliente values ( 'Daniel', 'contatodaniel@ig.com', '27998788','23', 'M','ES')
go
insert into cliente values ( 'Caua','caua123@gmail.com', '9987887', '18', 'M', 'ES')
go

-- PRODUTOS 
insert into estoque values ('GOW Ragnarok', 149.90, 30)
go
insert into estoque values ('GTA V', 120, 20)
go

-- VENDAS 
INSERT INTO vendas (quantidadeProduto, idCliente, idproduto)
VALUES (5, 1, 1)
go



/* CRIANDO TRIGGER
- TODA VEZ QUE UMA VENDA FOR INSERIDA, FAZ O CALCULO AUTOMATICO DO VALOR TOTAL
*/
CREATE TRIGGER TRG_CALCULAR_VALORTOTAL
ON vendas
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE vendas
    SET valorTotal = i.quantidadeProduto * e.precoProduto
    FROM vendas v
    INNER JOIN inserted i ON v.idvendas = i.idvendas
    INNER JOIN estoque e ON i.idproduto = e.idproduto;
END
go

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
