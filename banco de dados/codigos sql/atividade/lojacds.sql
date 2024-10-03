create database bdlojacds;
use bdlojacds;

create table Categoria (
	idCategoria int not null primary key auto_increment,
    nome varchar(45) not null
);
    
create table Autor (
	idAutor int not null primary key auto_increment,
    nome varchar(45) not null,
    cpf varchar(14) not null
);

create table Genero (
	idGenero int not null primary key auto_increment,
    nome varchar(45) not null
);
    
create table Gravadora (
	idGravadora int not null primary key auto_increment,
    nome varchar(45) not null,
    endereco varchar(100) not null
);

create table Vendedor (
	idVendedor int not null primary key auto_increment,
    nome varchar(45) not null,
    idGravadora int not null,
    constraint vendedor_id_gravadora_fk
    foreign key (idGravadora)
    references Gravadora(idGravadora)
);

create table Telefone (
	idTelefone int not null primary key auto_increment,
    telefone varchar(16) not null,
    idGravadora int not null,
    constraint telefone_id_gravadora_fk
    foreign key (idGravadora)
    references Gravadora(idGravadora)
);

create table Artista (
	idArtista int not null primary key auto_increment,
    nome varchar(45) not null,
    dataNascimento date not null,
    idGenero int not null,
    idArtistaInspiracao int,
    idGravadora int not null,
    constraint artista_id_genero_fk
    foreign key (idGenero)
    references Genero(idGenero),
    constraint artista_inspiracao_fk
    foreign key (idArtistaInspiracao)
    references Artista(idArtista),
    constraint artista_id_gravadora_fk
    foreign key (idGravadora)
    references Gravadora(idGravadora)
);

create table CD (
	idCD int not null primary key auto_increment,
    titulo varchar(45) not null,
    idCategoria int not null,
    idArtista int not null,
    quantidade int,
    constraint cd_id_categoria_fk
    foreign key (idCategoria)
    references Categoria(idCategoria),
    constraint cd_id_artista_fk
    foreign key (idArtista)
    references Artista(idArtista)
);

create table Musica (
	idMusica int not null primary key auto_increment,
    titulo varchar(45) not null,
    idCD int not null,
    faixa int not null,
    idGenero int not null,
    constraint musica_id_cd_fk
    foreign key (idCD)
    references CD(idCD),
    constraint musica_id_genero_fk
    foreign key (idGenero)
    references Genero(idGenero)
);

create table Musica_has_Autor (
	idMusica int,
    idAutor int,
    constraint primary key (idMusica, idAutor),
    constraint musicaHasAutor_id_musica_fk
    foreign key (idMusica)
    references Musica(idMusica),
    constraint musicaHasAutor_id_autor_fk
    foreign key (idAutor)
    references Autor(idAutor)
);

desc Vendedor;
desc Gravadora;