
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

/* SELEÇÕES
 Projeção = utiliza-se SELECT
 seleção = utiliza-se where(onde)

 */

/* FILTRANDO DADOS
 - QUERO TRAZER O NOME E O SEXO DA TABELA CLIENTE ONDE O CLIENTE É MASCULINO
*/
SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'M';

# QUERO TRAZER O NOME, O ENDERECO DO CLIENTE ONDE O CLIENTE É FEMININO
SELECT NOME, ENDERECO FROM CLIENTE
WHERE SEXO = 'F';

/*
OBS: Não será projetado o sexo pois o where é apenas uma seleção,
 é uma regra onde não ira aparecer o retorno da mesma na query.
*/

/* UTILIZANDO O LIKE 
O CARACTERE % VAI BUSCAR NO CAMPO TUDO QUE TERMINA COM A REGRA QUE DEFINIMOS
EXEMPLO:
# QUERO TRAZER NOME, SEXO DO CLIENTE QUE MORE NO RJ( NO CASO DO NOSSO BANCO O RJ É SEMPRE NO FINAL)
"% = COMEÇA COM QUALQUER COISA MAS TERMINA COM RJ"
*/

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

/* EXERCICIOS 

CRIAR UM DATABASE PARA ARMAZENAR DADOS DE UM LIVRO.

MODELAGEM CONCEITUAL, CAMPOS QUE DEVEM SER ARMAZENADOS:

NOME DO LIVRO;
NOME DA EDITORA;
UF DA EDITORA;
NOME DO AUTOR;
SEXO DO AUTOR;
NUMERO DE PÁGNAS;
VALOR DO LIVRO;
ANO DE PUBLICAÇÃO;
*/

# MODELAGEM FISÍCA

CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVROS(
	LIVRO VARCHAR(100),
	PAGINAS INT(5),
	EDITORA VARCHAR(30),
	VALOR FLOAT(10,2),
	UF CHAR(2),
	ANO INT(4),
	AUTOR VARCHAR(100),
	SEXO CHAR(1)
);

# INSERINDO DADOS

INSERT INTO LIVROS VALUES('CAVALEIRO REAL', 296, 'WARNER BOOKS', 180.50, 'ES', 1995, 'JONAS BROTHER', 'M');

/* Trazer todos os dados */

SELECT * FROM LIVROS;

/* Trazer o nome do livro e da editora */

SELECT LIVRO, EDITORA FROM LIVROS;

/* Trazer o nome do livro, a UF dos livros e por fim, os autores devem ser do sexo masculino */

SELECT LIVRO, UF FROM LIVROS
WHERE SEXO = "M";

/* Trazer nome do livro, numero de paginas e por fim, os autores devem ser do sexo feminino */

SELECT LIVRO, PAGINAS FROM LIVROS
WHERE SEXO = "F";

/* Trazer valores dos livros das editoras de SÃO PAULO. */

SELECT VALOR FROM LIVROS 
WHERE EDITORA = 'SP'

/* Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo
ou Rio janeiro */

SELECT AUTOR FROM LIVROS
WHERE SEXO = 'M'
AND UF= 'SP'
OR UF = 'RJ';

**************************
# EXERCICIO

/*
Criar um banco para funcionarios de uma empresa. nesse banco deve conter
as seguintes informações:

Modelagem conceitual:
. nome,
. email,
. sexo,
. departamento,
. admissao,
. salario ,
. cargo, 

*/

/* Querys que precisam vim prontas:

- Trazer funcionarios do sexo masculino, ou funcinarios que trabalhem no departamento de jardim.
*/

# Criando banco
CREATE DATABASE empresa;

USE empresa;

#Criando a tabela
CREATE TABLE funcionarios(
	idFuncionario int primary key,
	nome varchar(100),
	email varchar(180),
	sexo char(1),
	departamento varchar(100),
	admissao varchar(10),
	salario DECIMAL(10,2),
	idRegiao int

);

#Trazer todos funcionarios que trabalhem no departamento de filmes ou roupas

/* 1. PASSO
utilizar o COUNT(*) para poder verificar qual dos dois departamentos
possui mais registros, logo após criar a query. como vamos utilizar o
OR, precisamos que o campo que possui mais registros venha primeiro 
para otimizar a consulta do banco
*/

SELECT COUNT(*) AS TOTAL_REGISTROS
FROM funcionarios
WHERE departamento = "filmes"
OR departamento = "roupas"

# OU

SELECT COUNT(*), departamento
FROM funcionarios
GROUP BY departamento
ORDER BY 1;

/* 2. PASSO 
depois que estiver definido qual campo possui mais registros vamos sempre 
iniciar com ele primeiro. no exemplo o departamento filmes possui: 70 resultados
e o departamento roupas possui 30. logo, em porcentagem entre os dois. O filme possui
70%. então ele vem no where
*/

SELECT nome 
FROM funcionarios
WHERE departamento = "filmes"
OR departamento = "roupas";


# traga os funcionarios do sexo masculino ou funcionarios que trabalhem no jardim

SELECT nome 
FROM funcionarios
WHERE sexo = 'M'
OR departamento = 'jardim';


/*funcionarias(AS) que trabalham no departamento de filmes ou departamento do lar,
necessita enviar um email para as colaboradoras desses dois setores.
*/

select count(*), sexo
from funcionarios
GROUP BY sexo;


SELET * FROM FUNCIONARIOS
WHERE 
(DEPARTAMENTO = "Lar" AND SEXO = 'Feminino');
OR
(DEPARTAMENTO = 'Filmes' AND SEXO = 'Feminino');

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
WHERE NOME = 'JOAO';

UPDATE CLIENTE
SET EMAIL = 'ELIZA.IG@GMAIL.COM'
WHERE NOME = 'ELIZA';

/* DELETANDO REGISTROS */

#1 CONTAR OS REGISTROS - QUEREMOS APAGAR TODAS AS "ELIZA" DA TABELA
SELECT COUNT(*) FROM CLIENTE
WHERE NOME = 'ELIZA';
DELETE FROM CLIENTE
WHERE NOME = 'ELIZA';

/* QUEREMOS APAGAR SOMENTE UMA ELIZA QUE POSSUI UM EMAIL ERRADO */

DELETE FROM CLIENTE
WHERE NOME = 'ELIZA'
AND EMAIL = 'ELIZSA.IG@GMAIL.COM'
