use exemplo2;
use exemploProgramador;

drop table grade_salarial;
drop table departamento;

create table departamento (
	id_departamento int ,
    nm_departamento varchar(30),
    localizacao varchar(20),
    constraint departamento_id_departamento_pk
    primary key(id_departamento)
);

create table grade_salarial (
	id_grade_salarial int primary key,
    menor_salario decimal(10,2),
    maior_salario decimal(10,2)
);

desc departamento;

alter table departamento
	add constraint nm_departamento_uk unique (nm_departamento);
    
alter table empregado
	add id_departamento int;
    
alter table empregado
	add constraint empregado_id_empregado_pk
    primary key (id_empregado);
alter table empregado
	modify column id_empregado int not null;
alter table empregado
	drop lider;

alter table empregado
	add constraint empregado_id_departamento_fk
    foreign key (id_departamento)
    references departamento(id_departamento);

alter table empregado
	add constraint empregado_lider_fk
    foreign key (lider)
    references empregado(id_empregado);
    
-- exclui os dados das tabelas, mas não exclui a estrutura
truncate empregado;

desc empregado;