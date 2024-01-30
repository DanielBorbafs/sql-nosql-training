
/* PROCESSOS DE MODELAGEM 
entidade = tabela
campos = atributos
MODELAGEM CONCEITUAL - RASCUNHO;
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM ( criando os diagramas visuais das tabelaS);
MODELAGEM FÍSICA - SCRIPTS DE BANCO;
*/ 


/*
Uma empresa necessita de cadastros de clientes para mandar mala direta
Dados do clientes que precisam de armazenados:
. NOME - CARACTER(30);
. CPF - NUMERICO(char) (11);
. EMAIL - CARACTER(30);
. TELEFONE - CARACTER(30);
. ENDERECO - CARACTER(100);
. SEXO;
*/ 

/* MODELAGEM FÍSICA */
CREATE DATABASE UNIDADOS;
USE UNIDADOS;

/* CRIANDO A TABELA */
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF VARCHAR(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
);

/* DESCOBRINDO ESTRUTURA DA TABELA*/
DESC CLIENTE


/* FORMAS PARA INSERIR DADOS EM UM BANCO */

/* FORMA 01 - OMITINDO AS COLUNAS, DEVE SER ARMAZENADO NA MESMA ORDEM DA CRIAÇÃO DA TABELA)*/
INSERT INTO CLIENTE VALUES('DANIEL', 'M', 'DEV.DANIELBORBA@GMAIL.COM','12345678912', '2798532156', 'AV VALADARES 161 - SERRA ESPIRITO SANTO');

/* FORMA 02 - COLOCANDO AS COLUNAS, INDEPENDENTE DA ORDEM */
INSERT INTO CLIENTE(NOME, ENDERECO, TELEFONE, CPF, SEXO, EMAIL) VALUES('ELIZA', 'RUA UNIAO 564 -GUARAPARI', '2698745623', '12355245678', 'F', 'ELIZACLIENTE@GMAIL.COM');

/* FORMA 03 - COMPACTO */
INSERT INTO CLIENTE VALUES('DANIEL', 'M', 'DEV.DANIELBORBA@GMAIL.COM','12345678912', '2798532156', 'AV VALADARES 161 - SERRA ESPIRITO SANTO'),
('ELIZA', 'RUA UNIAO 564 -GUARAPARI', '2698745623', '12355245678', 'F', 'ELIZACLIENTE@GMAIL.COM'),
('ELIZA', 'RUA UNIAO 564 -GUARAPARI', '2698745623', '12355245678', 'F', 'ELIZACLIENTE@GMAIL.COM');


/* MOSTRANDO DADOS DA TABELA */
SELECT * FROM CLIENTE;

/* 
PERFORMANCE COM OPERADORES LÓGICOS:
CONTANDO REGISTROS DE UMA TABELA COM COUNT(*)
*/

SELECT COUNT(*) AS "NUMERO DE CLIENTES"
FROM CLIENTE; 

/* GROUP BY*/
SELECT SEXO, COUNT(*) as "Quantidade"
FROM CLIENTE
GROUP BY SEXO;
# faz a contagem de M e F e agrupa por sexo


/* PERFORMANCE COM OPERADORES LÓGICOS */

# Utilizando OR deve-se vim primeiro na query o campo com mais probabilidade de ser verdadeiro
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE SEXO = "F"
OR CIDADE = "RIO DE JANEIRO";


# Utilizando And, é obrigatorio a checagem dos dois campos, começamos com a menor possibilidade de ser verdadeiro
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE CIDADE = "RIO DE JANEIRO"
AND SEXO = "F";

/* FILTRANDO VALORES NULOS */
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;

/* FILTRANDO VALORES NÃO NULOS */
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;

/* UPDATE */
SELECT * FROM CLIENTE
WHERE NOME = 'ELIZA';
UPDATE CLIENTE
SET EMAIL = 'ELIZA.IG@GMAIL.COM'
WHERE NOME = 'ELIZA';

