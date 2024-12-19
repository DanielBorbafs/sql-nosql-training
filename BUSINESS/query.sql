/*
Precisamos buscar funcionários que possuem dados incompátiveis,
vamos filtrar funcionários que estão com os generos nulos.
*/
SELECT NOME, EMAIL, PROFISSAO, GENERO
FROM FUNCIONARIOS 
WHERE GENERO IS NULL
GO



-- Trazendo o gasto total de salário por profissão
SELECT PROFISSAO, SUM(SALARIO) AS TOTAL_SALARIOS
FROM FUNCIONARIOS
GROUP BY PROFISSAO
ORDER BY TOTAL_SALARIOS DESC; -- Ordena do maior para o menor total de salários
