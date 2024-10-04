create database db_sccpf;
use db_sccpf;

create table cliente (
	id int auto_increment primary key,
    nome varchar(45) not null,
    fone varchar(45) not null,
    email varchar(45) not null,
    endereco varchar(45) not null
);

create table produto (
	id int auto_increment primary key,
    description varchar(150) not null,
    unit varchar(45) not null,
    qtd decimal(10,2) not null,
    preco decimal(10,2) not null
);

create table fornecedor (
	id int auto_increment primary key,
    empresa varchar(100) not null,
    fone varchar(45) not null,
    email varchar(45) not null,
    contato varchar(45) not null
);

truncate produto;
select * from fornecedor;