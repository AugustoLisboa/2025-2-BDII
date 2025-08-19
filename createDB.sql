-- BD para atividade prática de Laboratório de Banco de Dados
-- Professora: Ivone Matsuno Yugoshi

-- CREATE DATABASE empresa;

CREATE TABLE funcionario( 
	numfunc integer PRIMARY KEY, 
	pnome varchar(255) NOT NULL, 
	minicial char(1), 
	unome varchar(255) NOT NULL, 
	datanasc date, 
	sexo char(2) CHECK (sexo IN ('F', 'M')), 
	salario numeric NOT NULL CHECK(salario > 0), 
	supervisor integer, 
	depto integer CHECK(depto > 0),
	endereco varchar(255) 
); 

CREATE TABLE departamento( 
	numdepto integer PRIMARY KEY CHECK(numdepto > 0), 
	nomedepto varchar(255) NOT NULL UNIQUE,
	gerente integer, 
	data_ini_gerente date 
); 

CREATE TABLE depto_local( 
	numdepto integer, 
	dlocalizacao varchar(255), 
	PRIMARY KEY(numdepto, dlocalizacao)
);

CREATE TABLE projeto( 
	projnum integer PRIMARY KEY, 
	projnome varchar(255), 
	projlocal varchar(255), 
	dnum integer
);

CREATE TABLE trabalha_em( 
	fnum integer, 
	pnum integer, 
	PRIMARY KEY(fnum, pnum), 
	horas real
);

CREATE TABLE dependente( 
	fnum integer, 
	nomedependente varchar(255), 
	sexo char(1), 
	datanasc date, 
	parentesco varchar(255), 
	PRIMARY KEY(fnum, nomedependente)
); 

-- Adicionando chaves estrangeiras
ALTER TABLE funcionario
	ADD CONSTRAINT FK_supervisor FOREIGN KEY(supervisor) REFERENCES funcionario(numfunc),
	ADD CONSTRAINT FK_depto_func FOREIGN KEY(depto) REFERENCES departamento(numdepto);


ALTER TABLE departamento 
	ADD CONSTRAINT FK_gerente FOREIGN KEY(gerente) REFERENCES funcionario(numfunc);

ALTER TABLE depto_local 
	ADD CONSTRAINT FK_local FOREIGN KEY(numdepto) REFERENCES departamento(numdepto);

ALTER TABLE projeto 
	ADD CONSTRAINT FK_depto_proj FOREIGN KEY(dnum) REFERENCES departamento(numdepto);


ALTER table trabalha_em
	ADD CONSTRAINT FK_func_trab FOREIGN KEY(fnum) REFERENCES funcionario(numfunc),
	ADD CONSTRAINT FK_proj_trab FOREIGN KEY(pnum) REFERENCES projeto(projnum);

ALTER TABLE dependente
	ADD CONSTRAINT FK_func_dep FOREIGN KEY(fnum) REFERENCES funcionario(numfunc);

	