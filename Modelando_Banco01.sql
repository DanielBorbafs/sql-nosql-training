/*CRIANDO AS TABELAS DO BANCO*/

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT, 
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT, 
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

/* INSERINDO DADOS NO BANCO */

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOFREIRE@GMAIL.COM', '75545567');
INSERT INTO CLIENTE VALUES(NULL,'ANALUISA','F','ANALUISA@GMAIL.COM', '49598787');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL, '8977554');
INSERT INTO CLIENTE VALUES(NULL,'DAN','F',NULL, '5666556');
+-----------+----------+------+----------------------+----------+
| IDCLIENTE | NOME     | SEXO | EMAIL                | CPF      |
+-----------+----------+------+----------------------+----------+
|         1 | JOAO     | M    | JOAOFREIRE@GMAIL.COM | 75545567 |
|         3 | ANALUISA | F    | ANALUISA@GMAIL.COM   | 49598787 |
|         4 | CLARA    | F    | NULL                 | 8977554  |
|         5 | DAN      | F    | NULL                 | 5666556  |
+-----------+----------+------+----------------------+----------+

/* INSERINDO DADOS NA TABELA ENDEREÇO*/

INSERT INTO ENDERECO VALUES(NULL, 'RUA UNIAO','CENTRO','HORIZONTE','MG', 5);
INSERT INTO ENDERECO VALUES(NULL, 'AV DANTES','JARDIM','HORIZONTE','ES', 3);

mysql> SELECT * FROM ENDERECO;
+------------+-----------+--------+-----------+--------+------------+
| IDENDERECO | RUA       | BAIRRO | CIDADE    | ESTADO | ID_CLIENTE |
+------------+-----------+--------+-----------+--------+------------+
|          1 | RUA UNIAO | CENTRO | HORIZONTE | MG     |          5 |
|          3 | AV DANTES | JARDIM | HORIZONTE | ES     |          3 |
+------------+-----------+--------+-----------+--------+------------+


/*INSERINDO DADOS NA TABELA TELEFONE*/

DESC TELEFONE;

INSERT INTO TELEFONE VALUES (NULL, 'CEL', '78987854', 5);
INSERT INTO TELEFONE VALUES (NULL, 'COM', '89885774', 5);

+------------+------+----------+------------+
| IDTELEFONE | TIPO | NUMERO   | ID_CLIENTE |
+------------+------+----------+------------+
|          1 | CEL  | 78987854 |          5 |
|          2 | COM  | 89885774 |          5 |
+------------+------+----------+------------+
/*Selecao, projecao e funcao*/

/* PROJECAO É TUDO OQUE VOCE VER NA TELA */

SELECT NOW() AS DATA_ATUAL;

SELECT 2 + 2 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW()
FROM CLIENTE;

/*SELECAO É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
A CLAUSULA DE SELECAO É O WHERE */

SELECT NOME, SEXO, EMAIL /* PROJECAO */
FROM CLIENTE /*ORIGEM*/
WHERE SEXO = 'F'; /* SELECAO */


SELECT NUMERO
FROM TELEFONE
WHERE TIPO = 'CEL';


/* JUNCAO -> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

SELECT ID_CLIENTE, BAIRRO, CIDADE 
FROM ENDERECO;

/* NOME, SEXO, BAIRRO, CIDADE */

SELECT NOME, SEXO, BAIRRO CIDADE /*(BAIRRO,CIDADE É DE OUTRA TABELA)*/
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE;  /*MANEIRA NAO CONVENCI0NAL, USANDO WHERE*/


SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;


SELECT NOME, SEXO, BAIRRO, CIDADE /*PROJECAO*/
FROM CLIENTE /*ORIGEM*/
	INNER JOIN ENDERECO /*JUNCAO*/
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /*SELECAO*/


/* NOME, SEXO, BAIRRO, CIDADE ,TIPO NUMERO */

SELECT CLIENTE.NOME,  CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;


/*FORMA MAIS RESUMIDA*/
SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

* ALTERANDO DADOS DA TABELA */ 

/* Inserindo as informacoes que irao ser alteradas no banco*/
INSERT INTO CLIENTE VALUES(NULL,'alterar','m','alterar@email.com', '123456789');

/*Confirmando se é mesmo o dado que sejamos alterar */

select * from cliente 
where idcliente = 8;

/*Alterando o dado */

UPDATE CLIENTE 
SET EMAIL = 'FELIPE@EMAIL.COM'
where idcliente = 8;

/* DELETANDO DADOS */

delete from cliente where IDCLIENTE = 8;

/* Exercicios DML */ 

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

/* CADASTRE TELEFONES PARA OS CLIENTES */
INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);


-------------- *  QUERYS  * -----------------------

/*
1 - PASSO PARA EXECUTAR QUALQUER QUERY:
descrever as tabelas do banco para sabermos onde estamos mexendo.
desc cliente;
desc endereco;
desc telefone;
*/

+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

mysql> desc telefone;
+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+


/*
2 - PASSO SELECIONAR TODOS OS CAMPOS DAS TABELAS QUE IREMOS UTILIZAR.
	SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF,
		 E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, 
		 T.TIPO, T.NUMERO
	FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;

--- SERIA UM RELATORIO GERAL -----
*/


/* QUERY 01 -  Relatorio de homens */

/* Relatorio de homens */
SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF,
	 E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, 
	 T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';

+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | RUA                | BAIRRO     | CIDADE         | ESTADO | TIPO | NUMERO   |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 99667587 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 66687899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | COM  | 54768899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | CEL  | 78458743 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 56576876 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 89986668 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654 |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979 |
|        13 | LORENA  | M    | NULL              | 774557887   | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676 |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | COM  | 88679978 |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768 |
|        18 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665 |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+


/*  obs os idcliente 11, 12, 13,17 E 18. sao mulheres, precisamos alterar */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 11
OR IDCLIENTE = 12
OR IDCLIENTE = 13
OR IDCLIENTE = 17
OR IDCLIENTE = 18;

/* ou dessa forma*/

SELECT * FROM CLIENTE CLIENTE
WHERE IDCLIENTE IN(11,12,13,17,18);

/*ALTERANDO OS DATOS*/
UPDATE CLIENTE SET SEXO = 'F'
WHERE IDCLIENTE IN(11,12,13,17,18);

/* Relatorio de homens */
SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF,
	 E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, 
	 T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';






































