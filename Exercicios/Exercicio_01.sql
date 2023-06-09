/* Exercícios de SQL:

Crie uma tabela chamada "Alunos" com as colunas "ID" (inteiro), "Nome" (texto) e "Idade" (inteiro).
Insira três registros na tabela "Alunos".
Selecione todos os alunos com idade superior a 20 anos.
Atualize a idade do aluno com ID 1 para 25.
Exclua o aluno com ID 2 da tabela.
Crie uma tabela chamada "Cursos" com as colunas "ID" (inteiro) e "Nome" (texto).
Insira dois registros na tabela "Cursos".
Selecione todos os alunos e seus respectivos cursos usando uma junção entre as tabelas "Alunos" e "Cursos".
*/

create table alunos (
id_aluno int primary key auto_increment,
nome_aluno varchar(30),
idade int 
);
