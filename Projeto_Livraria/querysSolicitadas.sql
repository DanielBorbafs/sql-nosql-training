
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

/* Caso não queira que apareça o ID do cliente : */

SELECT c.nome AS cliente, COUNT(*) AS total_compras, SUM(v.valor) AS valor_total
FROM vendas v
JOIN clientes c ON v.client_id = c.client_id
GROUP BY c.nome
ORDER BY valor_total DESC;

/*
QUERY 02 
 Agrupa os clientes por faixa etária de idade,
 mostra a faixa etária e quantos clientes estão armazenados naquela faixa.
*/
SELECT
  CASE
    WHEN idade BETWEEN 14 AND 16 THEN '14-16 anos'
    WHEN idade BETWEEN 17 AND 19 THEN '17-19 anos'
    WHEN idade BETWEEN 20 AND 25 THEN '20-25 anos'
    ELSE 'Outras idades'
  END AS faixa_etaria,
  COUNT(*) AS total_clientes
FROM clientes
GROUP BY faixa_etaria;
+--------------+----------------+
| faixa_etaria | total_clientes |
+--------------+----------------+
| 20-25 anos   |              2 |
| 14-16 anos   |              1 |
+--------------+----------------+
/* Ja aqui mostra qual id do cliente que está armazenado na faixa etária descrita*/

SELECT
  CASE
    WHEN idade BETWEEN 14 AND 16 THEN '14-16 anos'
    WHEN idade BETWEEN 17 AND 19 THEN '17-19 anos'
    WHEN idade BETWEEN 20 AND 25 THEN '20-25 anos'
    ELSE 'Outras idades'
  END AS faixa_etaria,
  GROUP_CONCAT(client_id ORDER BY client_id) AS ids_clientes
FROM clientes
GROUP BY faixa_etaria;

/* QUERY 03
mostra a quantidade de clientes que residem em cada estado.
*/
select estado, count(*) as total_clientes 
from endereco
group by estado;

/* Query 04
Mostra a quantidade TOTAL de clientes do sexo masculino e feminino */ 
select sexo, count(*) as total
from clientes
group by sexo;



