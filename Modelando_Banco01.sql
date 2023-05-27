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

