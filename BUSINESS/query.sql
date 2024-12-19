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
---------------------------------------------------------------------------------------
/* 
 Preciso que traga um valor simulado caso houvesse um reajuste de 20%  
*/

SELECT 
    NOME, 
    SALARIO, 
    GENERO,
    ROUND(SALARIO * 0.2, 2) AS [VALOR DE REAJUSTE] -- interpretando como string
FROM BUSINESS;

-- query de cima convertida para trazer os valores com casas decimais ajustadas
SELECT 
    NOME, 
    CAST(SALARIO AS FLOAT) AS SALARIO_NUMERICO, 
    GENERO, 
    ROUND(CAST(SALARIO AS FLOAT) * 0.2, 2) AS [VALOR DE REAJUSTE]
FROM BUSINESS;

/* 
Precisamos fazer um levantamento de funcionários que 
recebem mais doque R$ 
*/
SELECT NOME, SOBRENOME, EMAIL, SALARIO
FROM BUSINESS
WHERE SALARIO >= 5000
GO

