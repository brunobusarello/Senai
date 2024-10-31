#1) Recuperar o número de empregados que exercem a função de Analista.
select count(funcao) "Número de Analistas" from empregado where funcao = "ANALISTA";

#2) Exibir o menor e o maior salário entre os empregados, assim como a média e a soma de todos os salários de todos os empregados. Coloque apelidos nas colunas Máximo, Mínimo, Soma e Média, respectivamente.
select max(salario) "Máximo", min(salario) "Mínimo", sum(salario) "Soma", avg(salario) "Média" from empregado;

#3) Exibir o menor e o maior salário dentre os empregados, assim como a média e a soma de todos os salários de todos os empregados agrupados por função.
select funcao "Função", min(salario) "Menor", max(salario) "Maior", avg(salario) "Média", sum(salario) "Salário"
	from empregado
    group by funcao;

#4) Exibir o nome e o número de empregados com o mesmo cargo.
select funcao "Função", count(funcao) "Quantidade" from empregado group by funcao;

#5) Exibir o nome do departamento, o nome do local, o número de empregados e o salário médio de todos os empregados que atuam no departamento.
select d.NM_DEPARTAMENTO "Nome do departamento", d.LOCALIZACAO "Localização do departamento", count(e.ID_DEPARTAMENTO) "Quantidade de funcionários", avg(coalesce(e.salario, 0)) "Média salarial"
	from empregado e right join departamento d on e.id_departamento = d.id_departamento
    group by e.ID_DEPARTAMENTO;

#6) Recuperar o nome do departamento onde o salário médio for superior a R$ 2.500.
select d.NM_DEPARTAMENTO
	from empregado e join departamento d on e.id_departamento = d.id_departamento
    group by 1
    having avg(e.salario) > 2500;

#7) Exibir o nome do departamento e o local onde o número de empregados for igual ou menor a 5 (deve listar o departamento que não tem ninguém).
select d.NM_DEPARTAMENTO, d.LOCALIZACAO
	from empregado e right join departamento d on e.id_departamento = d.id_departamento
    group by 1
    having count(e.id_empregado) <= 5;

#8) Recuperar o nome e a quantidade de liderados que o funcionário possui. 
select l.nm_empregado "Nome do Líder", count(e.id_empregado) "Quantidade de liderados"
	from empregado l join empregado e on l.ID_EMPREGADO = e.LIDER
    group by 1;
	
#9) Recuperar o nome do departamento, salário mínimo, salário máximo do departamento
select d.nm_departamento "Nome do departamento", min(coalesce(e.salario, 0)) "Menor salário", max(coalesce(e.salario, 0)) "Maior salário"
	from empregado e right join departamento d on e.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO
    group by 1;

#10) Recuperar a quantidade de cada grade salarial por departamento.
select d.NM_DEPARTAMENTO "Nome do departamento", count(g.ID_GRADE_SALARIAL) "Quantidade de funcionários", g.ID_GRADE_SALARIAL "Grade salarial"
	from grade_salarial g, empregado e left join departamento d on e.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO
    where e.SALARIO between g.menor_salario and g.MAIOR_SALARIO
    group by g.ID_GRADE_SALARIAL, d.ID_DEPARTAMENTO
    order by d.NM_DEPARTAMENTO;
    
