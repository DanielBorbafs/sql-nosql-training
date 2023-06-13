
* QUERYS


SELECT c.client_id, c.nome AS cliente, COUNT(*) AS ComprasFeitas, v.vendas,
FROM vendas v
JOIN clientes c ON v.client_id = c.client_id
GROUP BY c.client_id, c.nome
ORDER BY ComprasFeitas DESC;

