-- create database db_sccpf;
-- use db_sccpf;

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

create table pedido (
	id int auto_increment primary key,
    dataEmissao date not null,
    idCliente int not null,
    constraint Pedido_ID_Cliente_FK
    foreign key (idCliente)
    references cliente(id)
);

create table produto_pedido (
	idPedido int not null,
    idProduto int not null,
    constraint primary key(idPedido, idProduto),
    constraint ProdutoPedido_ID_Produto_FK
    foreign key (idProduto)
    references produto(id),
	constraint ProdutoPedido_ID_Pedido_FK
    foreign key (idPedido)
    references pedido(id)
);

alter table produto_pedido
	add column qtd int not null;

-- truncate produto;
-- select * from fornecedor;

-- Inserts para popular a tabela cliente
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('João Silva', '11987654321', 'joao.silva@email.com', 'Rua das Flores, 123');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Maria Souza', '11976543210', 'maria.souza@email.com', 'Av. Paulista, 456');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Pedro Almeida', '11999887766', 'pedro.almeida@email.com', 'Rua Verde, 789');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Ana Costa', '21987654321', 'ana.costa@email.com', 'Rua Azul, 101');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Lucas Oliveira', '31998765432', 'lucas.oliveira@email.com', 'Rua Amarela, 202');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Paula Lima', '41987654321', 'paula.lima@email.com', 'Av. Central, 303');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Carlos Pereira', '51987654321', 'carlos.pereira@email.com', 'Rua da Praia, 404');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Fernanda Martins', '61987654321', 'fernanda.martins@email.com', 'Rua da Montanha, 505');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Juliana Santos', '71987654321', 'juliana.santos@email.com', 'Rua da Colina, 606');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Bruno Gomes', '81987654321', 'bruno.gomes@email.com', 'Av. dos Pássaros, 707');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Camila Rocha', '11923456789', 'camila.rocha@email.com', 'Rua da Esperança, 808');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Rafael Nunes', '12987654321', 'rafael.nunes@email.com', 'Rua das Estrelas, 909');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Bianca Dias', '13987654321', 'bianca.dias@email.com', 'Av. do Sol, 1001');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Gabriel Carvalho', '14987654321', 'gabriel.carvalho@email.com', 'Rua da Paz, 1111');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Viviane Lima', '15987654321', 'viviane.lima@email.com', 'Rua do Porto, 1212');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Thiago Ferreira', '16987654321', 'thiago.ferreira@email.com', 'Rua do Rio, 1313');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Larissa Ribeiro', '17987654321', 'larissa.ribeiro@email.com', 'Rua da Floresta, 1414');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Rodrigo Sousa', '18987654321', 'rodrigo.sousa@email.com', 'Av. das Águas, 1515');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Beatriz Melo', '19987654321', 'beatriz.melo@email.com', 'Rua do Vento, 1616');
INSERT INTO cliente (nome, fone, email, endereco) VALUES ('Felipe Cardoso', '20987654321', 'felipe.cardoso@email.com', 'Av. das Árvores, 1717');

-- Inserts para popular a tabela fornecedor
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Tech Solutions Ltda', 'Carlos Silva', '11998765432', 'carlos.silva@techsolutions.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Global Import', 'Fernanda Costa', '21987654321', 'fernanda.costa@globalimport.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Distribuidora Alpha', 'Paulo Almeida', '31987654321', 'paulo.almeida@alpha.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Equipamentos Beta', 'Mariana Nunes', '41987654321', 'mariana.nunes@equipamentosbeta.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Mercado Forte', 'Ricardo Lima', '51987654321', 'ricardo.lima@mercadoforte.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Super Tech', 'Juliana Mendes', '61987654321', 'juliana.mendes@supertech.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Inova Comércio', 'Ana Santos', '71987654321', 'ana.santos@inovacomercio.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Soluções LTDA', 'Pedro Ferreira', '81987654321', 'pedro.ferreira@solucoesltda.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Max Produtos', 'Bruno Rocha', '11912345678', 'bruno.rocha@maxprodutos.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Tech Parts', 'Vanessa Oliveira', '21923456789', 'vanessa.oliveira@techparts.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Distribuidora Solar', 'Eduardo Costa', '31934567890', 'eduardo.costa@solar.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Ferramentas Global', 'Roberto Martins', '41945678901', 'roberto.martins@globalferramentas.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Mundo Peças', 'Patrícia Ribeiro', '51956789012', 'patricia.ribeiro@mundpecas.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Equipamentos Fênix', 'Thiago Melo', '61967890123', 'thiago.melo@equipamentosfenix.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Sol Distribuidora', 'Marcela Carvalho', '71978901234', 'marcela.carvalho@soldistribuidora.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Alpha Solutions', 'Lucas Ribeiro', '81989012345', 'lucas.ribeiro@alphasolutions.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Prime Importações', 'Rafael Souza', '11990123456', 'rafael.souza@primeimportacoes.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Top Tecnologia', 'Clara Silva', '21901234567', 'clara.silva@toptecnologia.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Mercado Digital', 'Daniel Gomes', '31912345678', 'daniel.gomes@mercadodigital.com');
INSERT INTO fornecedor (empresa, contato, fone, email) VALUES ('Network Supply', 'Isabela Araújo', '41923456789', 'isabela.araujo@networksupply.com');

-- Inserts para popular a tabela produto
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Mouse Óptico', 'unidade', 150.00, 25.90);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Teclado Mecânico', 'unidade', 80.00, 120.50);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Monitor LED 24"', 'unidade', 40.00, 850.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Cadeira Gamer', 'unidade', 25.00, 1250.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Fone de Ouvido Bluetooth', 'unidade', 200.00, 150.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Smartphone 128GB', 'unidade', 60.00, 2300.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Notebook i5 8GB RAM', 'unidade', 30.00, 3500.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('HD Externo 1TB', 'unidade', 120.00, 450.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Impressora Multifuncional', 'unidade', 35.00, 780.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('SSD 256GB', 'unidade', 150.00, 320.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Webcam Full HD', 'unidade', 85.00, 210.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Microfone Condensador', 'unidade', 50.00, 350.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Placa de Vídeo GTX 1650', 'unidade', 20.00, 1950.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Cabo HDMI 2m', 'unidade', 300.00, 25.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Mouse Pad Grande', 'unidade', 200.00, 50.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Estabilizador de Energia', 'unidade', 60.00, 180.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Roteador Wi-Fi 5', 'unidade', 90.00, 230.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Pendrive 64GB', 'unidade', 250.00, 45.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Carregador Portátil 10000mAh', 'unidade', 120.00, 110.00);
INSERT INTO produto (description, unit, qtd, preco) VALUES ('Smartwatch', 'unidade', 70.00, 400.00);