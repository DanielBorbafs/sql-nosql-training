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


/* 
Precisamos extrair a contagem de gênero cadastrados em nosso sistema:
- Verificar se possuí dados nulos;
- Fazer a contagem
*/
UPDATE BUSINESS
SET GENERO = 'N' -- NÃO INFORMADO
WHERE GENERO IS NULL

SELECT GENERO, COUNT(GENERO) AS [CONTAGEM DE SEXO]
FROM BUSINESS
GROUP BY GENERO
GO
/*
N	113 - NÃO INFORMADO
F	455 - FEMININO
M	432 - MASCULINO
*/
