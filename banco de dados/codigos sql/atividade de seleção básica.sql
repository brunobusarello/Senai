#1) recuperar a localização do departamento de operações;
select localizacao from departamento where nm_departamento like "Operações";

#2) recuperar todos os empregados que exercem a função de escriturário;
select nm_empregado from empregado where funcao like "ESCRITURÁRIO";

#3) recuperar o nome, o salário e a comissão dos empregados (que possuem comissão), ordenados pelo maior salário;
select nm_empregado, salario, comissao from empregado where comissao is not null order by salario desc;

#4) recuperar o nome, a atividade e a data de contratação dos empregados que trabalham no departamento 20 e recebem mais de R$ 1.000;
select nm_empregado, funcao, data_contratacao from empregado where id_departamento = 20 and salario > 1000;

#5) recuperar os empregados que são gerentes;
select nm_empregado from empregado where funcao like "GERENTE";

#6) recuperar as informações dos empregados que possuem a letra &quot;o&quot; no nome;
select * from empregado where NM_EMPREGADO like "%o%";

#7) recuperar o nome e o número do departamento de todos os empregados que trabalham nos departamentos 10 e 30 por ordem alfabética de nome do empregado;
select nm_empregado, id_departamento from empregado where id_departamento in (10,30) order by nm_empregado asc;

#8) recuperar as informações dos empregados que foram contratados no ano de 1981.
select * from empregado where DATA_CONTRATACAO like "1981%";
select * from empregado where year(DATA_CONTRATACAO) = 1981;

#9) recuperar todos os empregados com comissão maior ou igual a 1000 por ordem alfabética de nome do empregado;
select NM_EMPREGADO from empregado where comissao >= 1000 order by NM_EMPREGADO asc;

#10) recuperar empregados que tem salário inferior a R$ 1.300 ordenados pelo salário;
select NM_EMPREGADO from empregado where SALARIO < 1300 order by salario;