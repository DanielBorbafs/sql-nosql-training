
/*
QUERY 01 - 
Mostra o cliente que mais fez compra na livraria,
quanto ele gastou em R$
e também quantas compras ele ja fez 
*/
SELECT c.client_id, c.nome AS cliente, COUNT(*) AS total_compras, SUM(v.valor) AS valor_total
FROM vendas v
JOIN clientes c ON v.client_id = c.client_id
GROUP BY c.client_id, c.nome
ORDER BY valor_total DESC;

