

create table endereco (
	enderecoid int primary key identity(1,1),
	cep varchar(10),
	rua varchar(30),
	logradouro int,
	estado char(2)
);
go
insert into endereco values ('29178-675', 'av bela vista', 456, 'ES');
go

create table contato(
	contatoid int primary key identity(1,1),
	tipo varchar(10),
	numero varchar(12),
);
go

insert into contato values ('Comercial', '(17)27996217');
go

create table clientes(
	clienteid int primary key identity(1,1),
	nomecliente varchar(30),
	email varchar(50),
	fk_contatoid int,
	fk_endereco int,
	foreign key(fk_contatoid) references contato(contatoid),
	foreign key(fk_endereco) references endereco(enderecoid)
);
go

insert into clientes values ('Bernardo', 'Bernardo@gmail.com', 1,1);
go

create table pedidos (
	pedidoid int primary key identity(1,1),
	datapedido date,
	statuspedido varchar(20),
	fk_clienteid int,
	foreign key (fk_clienteid) references clientes(clienteid) 

);
go

insert into pedidos values(getdate(), 'Aguardando pagamento', 1);
go

create table categorias(
	categoriaid int primary key identity(1,1),
	nomecategoria varchar(20),
	descricao varchar(100)
);
go

insert into categorias values( 'Eletronicos', 'Produtos eletronicos em geral')
go

create table produtos (
	produtoid int primary key identity(1,1),
	nomeproduto varchar(30),
	preco decimal(10,2),
	estoque int,
	fk_categoriaid int,
	foreign key(fk_categoriaid) references categorias(categoriaid);


);
go

insert into produtos values('Fone Xtreme', 120.00, 50, 1);
go

create table detalhespedido (
	detalheid int primary key identity(1,1),
	quantidade int,
	precounitario decimal(10,2),
	fk_pedido int,
	fk_produto int,
	foreign key(fk_pedido) references pedidos(pedidoid),
	foreign key (fk_produto) references produtos(produtoid)
);
go

insert into detalhespedido values (2, 120.0 , 1, 1);
go




