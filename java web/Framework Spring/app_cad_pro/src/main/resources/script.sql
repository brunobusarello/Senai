use productdb;

create table produto (
    id bigint auto_increment primary key,
    nome varchar(255) not null,
    descricao varchar(500),
    preco decimal(10,2) not null,
    quantidade int not null,
    categoria varchar(255),
    fornecedor varchar(255),
    imagem longblob
)