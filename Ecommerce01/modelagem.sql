

create table endereco (
	enderecoid int primary key identity(1,1),
	cep varchar(10),
	rua varchar(30),
	logradouro int,
	estado char(2)
);
go


create table contato(
	contatoid int primary key identity(1,1),
	tipo varchar(10),
	numero varchar(12),
);
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

create table pedidos (
	pedidoid int primary key identity(1,1),
	datapedido date,
	statuspedido varchar(20),
	fk_clienteid int,
	foreign key (fk_clienteid) references clientes(clienteid) 

);
go

create table categorias(
	categoriaid int primary key identity(1,1),
	nomecategoria varchar(20),
	descricao varchar(100)
);
go

create table produtos (
	produtoid int primary key identity(1,1),
	nomeproduto varchar(30),
	preco decimal(10,2),
	estoque int,
	fk_categoriaid int,
	foreign key(fk_categoriaid) references categorias(categoriaid)


);
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
