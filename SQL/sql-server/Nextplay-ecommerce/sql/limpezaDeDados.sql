/* Ao inserir os dados via SSIS no sql server a origem que vem de um CSV acaba armazenando os dados com ;; no final de cada registro 
Vamos fazer a limpeza desses caracteres usando REPLACE
*/

--Substituindo por uma string vazia
UPDATE CATEGORIAS
SET NOME = REPLACE(NOME, ';;', '');


