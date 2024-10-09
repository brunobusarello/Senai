create database dbProduto;
use dbProduto;

create table produto (
	id int auto_increment primary key,
    descricao varchar(255) not null,
    preco float not null
);

select * from produto;