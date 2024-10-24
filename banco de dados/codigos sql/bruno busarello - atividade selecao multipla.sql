#1) Recuperar o nome, o número do empregado e o nome do departamento de todos os empregados;
select e.nm_empregado, e.id_empregado, d.nm_departamento 
	from empregado e, departamento d
    where e.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO;

#2) Recuperar o nome e a localização dos departamentos e o nome, a atividade e o salário dos empregados que trabalham em NEW YORK;
select d.nm_departamento, d.localizacao, e.nm_empregado, e.funcao, e.salario
	from departamento d, empregado e
    where d.ID_DEPARTAMENTO = e.ID_DEPARTAMENTO and d.LOCALIZACAO = 'NEW YORK';

#3) Recuperar o nome do empregado, o nome do departamento e a localização de todos os empregados que recebem comissão;
select e.nm_empregado, d.nm_departamento, d.localizacao
	from empregado e, departamento d
    where e.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO and e.COMISSAO is not null;

#4) Recuperar o nome, salário e data de contratação de todos os empregados que trabalham no departamento de Pesquisa e Desenvolvimento, ordenados pelo maior salário.
select e.nm_empregado, e.salario, e.data_contratacao
	from empregado e, departamento d
    where e.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO and d.NM_DEPARTAMENTO = 'PESQUISA E DESENVOLVIMENTO'
    order by e.salario desc;

#5) Recuperar todos os dados dos empregados que trabalham em Chicago e não tem comissão.
select e.* from empregado e join departamento d on e.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO 
	where e.COMISSAO is null and d.LOCALIZACAO = 'CHICAGO';

#6) Recuperar o número e o nome dos empregados, o número e o nome do departamento dos empregados que recebam na faixa de R$ 1.000 e R$ 2.300.
select e.id_empregado, e.nm_empregado, d.id_departamento, d.nm_departamento
	from empregado e join departamento d
    on e.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO
    where e.SALARIO between 1000 and 2300;

#7) Recuperar o nome e a função do empregado, o nome do departamento, o salário do empregado e a grade salarial (ID_GRADE_SALARIAL) de todos os empregados;
select e.nm_empregado, e.funcao, d.nm_departamento, e.salario, g.id_grade_salarial
	from empregado e, departamento d, grade_salarial g
    where e.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO and e.SALARIO between g.MENOR_SALARIO and g.MAIOR_SALARIO;

#8) Recuperar o nome e o número do empregado junto com o nome e o número do líder; coloque um apelido nas colunas ID Empregado, Nome Empregado, ID Líder e Nome Líder;
select e.nm_empregado 'Nome Empregado', e.id_empregado 'ID Empregado', l.nm_empregado 'Nome Líder', l.id_empregado 'ID Líder'
	from empregado e left join empregado l
    on e.LIDER = l.ID_EMPREGADO;

#9) Recuperar o nome do empregado, o nome do departamento e a classificação salarial.
select e.NM_EMPREGADO, d.NM_DEPARTAMENTO, g.ID_GRADE_SALARIAL 
	from empregado e, grade_salarial g, departamento d
    where e.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO and e.SALARIO between g.MENOR_SALARIO and g.MAIOR_SALARIO;
    

#10) Recuperar nome, salário e data de contratação do empregado, o nome do departamento que o funcionário trabalha e o nome, o salário e data de contratação do líder, 
# ordenados pelo nome do funcionário. Utilize apelidos para as colunas para facilitar a leitura.
select e.NM_EMPREGADO 'NOME DO EMPREGADO', e.SALARIO 'SALÁRIO DO EMPREGADO', e.DATA_CONTRATACAO 'DATA DE CONTRATAÇÃO DO EMPREGADO', d.NM_DEPARTAMENTO 'NOME DO DEPARTAMENTO', l.NM_EMPREGADO 'NOME DO LÍDER', l.SALARIO 'SALÁRIO DO LÍDER', l.DATA_CONTRATACAO 'DATA DE CONTRATAÇÃO DO LÍDER'
	from departamento d, empregado e left join empregado l on e.LIDER = l.ID_EMPREGADO
    where d.ID_DEPARTAMENTO = e.ID_DEPARTAMENTO
    order by e.NM_EMPREGADO asc;
