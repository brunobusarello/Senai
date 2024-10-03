create database bdnotafiscal;
use bdnotafiscal;

create table Cliente (
	idCliente int primary key not null auto_increment,
    nome varchar(45) not null,
    endereco varchar(100) not null
);

create table Vendedor (
	idVendedor int primary key not null auto_increment,
    nome varchar(45) not null
);

create table NotaFiscal (
	idNotaFiscal int primary key not null auto_increment,
    dataEmissao date not null,
    totalNota decimal(10,2) not null,
    idCliente int not null,
    idVendedor int not null,
    constraint nota_fiscal_id_cliente_fk
    foreign key (idCliente)
    references Cliente(idCliente),
    constraint nota_fiscal_id_vendedor_fk
    foreign key (idVendedor)
    references Vendedor(idVendedor)
);

create table Produto (
	idProduto int not null auto_increment primary key,
    descricao varchar(45) not null,
    unidade varchar(2) not null,
    preco decimal(10,2) not null
);

create table ItemNotaFiscal (
	idNotaFiscal int,
    idProduto int,
    quantidade int not null,
    precoProduto int not null,
    totalProduto int not null,
    constraint primary key (idNotaFiscal, idProduto),
    constraint ItemNotaFiscal_id_NotaFiscal_fk foreign key (idNotaFiscal) references NotaFiscal (idNotaFiscal),
    constraint ItemNotaFiscal_id_Produto_fk foreign key (idProduto) references Produto (idProduto)
);

desc Produto;
desc ItemNotaFiscal;
desc NotaFiscal;
desc Cliente;
desc Vendedor;