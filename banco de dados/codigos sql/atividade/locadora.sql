create database bdlocadora;
use bdlocadora;

create table Cliente (
	idCliente int not null auto_increment primary key,
    nome varchar(45) not null,
    rua varchar(45) not null,
    complemento varchar(45) not null,
    bairro varchar(45) not null,
    cep varchar(9) not null,
    cidade varchar(45) not null,
    uf varchar(2) not null,
    telefone varchar(16) not null
);

create table Dependente (
	idDependente int not null auto_increment primary key,
    nome varchar(45) not null,
    idCliente int not null,
    constraint dependente_id_cliente_fk
    foreign key (idCliente)
    references Cliente(idCliente)
);

create table Tipo_Pagamento (
	idTipo_Pagamento int not null auto_increment primary key,
    nome varchar(45) not null
);

create table Locacao (
	idLocacao int not null auto_increment primary key,
    dataLocacao date not null,
    valorTotal decimal(10,2) not null,
    idCliente int not null,
    idTipo_Pagamento int not null,
    idDependente int,
    constraint locacao_id_cliente_fk
    foreign key (idCliente)
    references Cliente(idCliente),
    constraint locacao_id_tipoPagamento_fk
    foreign key (idTipo_Pagamento)
    references Tipo_Pagamento(idTipo_Pagamento),
    constraint locacao_id_dependente_fk
    foreign key (idDependente)
    references Dependente(idDependente)
);

create table Status (
	idStatus int not null auto_increment primary key,
    nome varchar(45) not null
); 

create table Categoria (
	idCategoria int not null auto_increment primary key,
    nome varchar(45) not null
);

create table Midia (
	idMidia int not null auto_increment primary key,
    nome varchar(45) not null,
    valorMidia decimal(10,2)
);

create table Classificacao (
	idClassificacao int not null auto_increment primary key,
    nome varchar(45) not null,
    prazoDevolucao int not null,
    valor decimal(10,2) not null
);

create table Ator (
	idAtor int not null auto_increment primary key,
    nome varchar(45) not null
);

create table Filme (
	idFilme int not null auto_increment primary key,
    nome varchar(45) not null,
    sinopse varchar(45) not null,
    duracao int not null,
    idClassificacao int not null,
    idCategoria int not null,
	constraint filme_id_classificacao_fk
    foreign key (idClassificacao)
    references Classificacao(idClassificacao),
    constraint filme_id_categoria_fk
    foreign key (idCategoria)
    references Categoria(idCategoria)
);

create table Exemplar (
	idExemplar int not null auto_increment primary key,
    idFilme int not null,
    idMidia int not null,
    idStatus int not null,
    constraint exemplar_id_filme_fk
    foreign key (idFilme)
    references Filme(idFilme),
    constraint exemplar_id_midia_fk
    foreign key (idMidia)
    references Midia(idMidia),
    constraint exemplar_id_status_fk
    foreign key (idStatus)
    references Status(idStatus)
);

create table Retirada (
	idRetirada int not null auto_increment primary key,
    idLocacao int not null,
    idExemplar int not null,
    valorUnitario decimal(10,2) not null,
    dataDevolucaoPrevista date not null,
    constraint retirada_id_locacao_fk
    foreign key (idLocacao)
    references Locacao(idLocacao),
    constraint retirada_id_exemplar_fk
    foreign key (idExemplar)
    references Exemplar(idExemplar)
);

create table Devolucao (
	idDevolucao int not null auto_increment primary key,
    dataDevolucao date not null,
    idRetirada int not null,
    constraint devolucao_id_retirada_fk
    foreign key (idRetirada)
    references Retirada(idRetirada)
);

create table Multa (
	idMulta int not null auto_increment primary key,
    dataMulta date not null,
    valorMulta decimal(10,2) not null,
    qtdDiasAtraso int not null,
    valorTotalMulta decimal(10,2) not null,
    idDevolucao int not null,
    constraint multa_id_devolucao_fk
    foreign key (idDevolucao)
    references Devolucao(idDevolucao)
);

create table Filme_has_Ator (
	idFilme int not null,
    idAtor int not null,
    constraint primary key(idFilme, idAtor),
    constraint filmeHasAutor_id_filme_fk
    foreign key (idFilme)
    references Filme(idFilme),
    constraint filmeHasAutor_id_ator_fk
    foreign key (idAtor)
    references Ator(idAtor)
);

create table Reserva (
	idReserva int not null auto_increment primary key,
    idExemplar int not null,
    dataReserva date not null,
    idCliente int not null,
    constraint reserva_id_exemplar_fk
    foreign key (idExemplar)
    references Exemplar(idExemplar),
    constraint reserva_id_cliente_fk
    foreign key (idCliente)
    references Cliente(idCliente)
);

desc Cliente;
desc Dependente;