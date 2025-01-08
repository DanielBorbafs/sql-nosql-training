CREATE DATABASE PRODUCTS 
GO

USE PRODUCTS 
GO

CREATE TABLE PRODUTOS(
    CODIGO_PRODUTO INT PRIMARY KEY,
    PRODUTO VARCHAR(120),
    PRECO MONEY,
    VENDIDO BIT,
    PAIS_FABRICACAO VARCHAR (120)
)

ALTER TABLE PRODUTOS
ALTER COLUMN PRECO MONEY NULL

SELECT * FROM PRODUTOS 

-- Traga todos  os produtos que foram vendidos na RUSSIA
SELECT PRODUTO, PRECO, PAIS_FABRICACAO
FROM PRODUTOS
WHERE VENDIDO = 1 AND PAIS_FABRICACAO = 'Russia'
GO

-- Traga o lucro total que foi feito no Brasil
SELECT PAIS_FABRICACAO, SUM(PRECO) AS [LUCRO TOTAL]
FROM PRODUTOS
WHERE PAIS_FABRICACAO = 'Brazil'
GROUP BY PAIS_FABRICACAO

-- Traga todos aparelhos Samsung vendidos
SELECT * FROM PRODUTOS
WHERE PRODUTO LIKE '%Samsung%' AND VENDIDO = 1