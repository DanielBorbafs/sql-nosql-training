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

insert into alunos values(null, 'Joao', 25);
insert into alunos values(null, 'Marcelo', 20);
insert into alunos values(null, 'Layla', 23);

select * from alunos where idade > 20;

update alunos
set id_aluno = 21
where id_aluno = 1;

delete from alunos
where id_aluno = 2;

create table cursos(
    id_curso int primary key auto_increment,
    nome varchar(30)
);

insert into cursos values(null,'Curso Javascript');
insert into cursos values(null,'Curso Python');
insert into cursos values(null,'Curso SQL');

select * from alunos
inner join cursos on alunos.id_aluno = cursos.id_curso;

select alunos.nome_aluno as aluno, cursos.nome as curso
from alunos
inner join cursos on alunos.id_aluno = cursos.id_curso;
