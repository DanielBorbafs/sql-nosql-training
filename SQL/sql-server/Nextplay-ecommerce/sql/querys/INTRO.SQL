
SELECT  SUM(V.VALOR_TOTAL) AS VALOR_GASTO, C.NOME
FROM VENDAS V
INNER JOIN clientes C ON C.cliente_id = V.cliente_id
GROUP BY C.NOME