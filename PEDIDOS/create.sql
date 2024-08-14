
CREATE DATABASE PEDIDOS 
GO

USE PEDIDOS
GO

CREATE TABLE CLIENTES(
	ID_CLIENTE INT PRIMARY KEY  IDENTITY(1,1),
	NOME VARCHAR(60),
	EMAIL VARCHAR(60),
	TELEFONE VARCHAR(30)
)
GO



CREATE TABLE PEDIDOS(
	ID_PEDIDO INT PRIMARY KEY IDENTITY(1,1),
	DATA_PEDIDO DATE,
	VALOR_TOTAL MONEY,
	PRODUTO VARCHAR(30),
	ID_CLIENTE INT
)
GO
-- ADICIONANDO FK A TABELA PEDIDOS
ALTER TABLE PEDIDOS
ADD CONSTRAINT FK_CLIENTE_ID
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE) 
GO

-- SELECIONANDO QUEM COMPROU OS PRODUTOS
SELECT 
	C.NOME,
	C.TELEFONE,
	P.VALOR_TOTAL,
	P.PRODUTO,
	P.DATA_PEDIDO
FROM CLIENTES C
INNER JOIN PEDIDOS P
ON
C.ID_CLIENTE = P.ID_CLIENTE 
GO

-- SELECIONANDO QUAL CLIENTE GASTOU MAIS
SELECT 
	C.NOME,
	SUM(P.VALOR_TOTAL)AS TOTAL_COMPRAS
FROM CLIENTES C
INNER JOIN PEDIDOS P ON C.ID_CLIENTE = P.ID_CLIENTE
GROUP BY C.NOME
ORDER BY TOTAL_COMPRAS DESC
GO

-- LUCRO TOTAL DA EMPRESA
SELECT SUM(VALOR_TOTAL)AS LUCRO_TOTAL
FROM PEDIDOS 
GO

-- PRODUTO COMPRADO
SELECT PRODUTO, COUNT(PRODUTO)AS NUMERO_COMPRAS FROM PEDIDOS 
GROUP BY PRODUTO
ORDER BY NUMERO_COMPRAS DESC
GO

-- QUANTIDADE DE CLIENTES
SELECT COUNT(ID_CLIENTE) AS QUANTIDADE_CLIENTES FROM CLIENTES 
GO

SELECT COUNT(ID_CLIENTE) AS TOTAL_CLIENTES FROM CLIENTES
GO

-- CRIAÇÃO DE VIEWS 
CREATE VIEW QuantidadeTotalClientes AS
SELECT COUNT(ID_CLIENTE) AS QUANTIDADE_CLIENTES
FROM CLIENTES
GO



-- DEPOIS DE DAR UM INSERT MOSTRA A QUANTIDADE TOTAL DE CLIENTES
CREATE TRIGGER MostrarQuantidadeClientes
ON CLIENTES
AFTER INSERT
AS
BEGIN
  SELECT * FROM QuantidadeTotalClientes

END;
