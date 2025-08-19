-- BD para atividade prática de Laboratório de Banco de Dados
-- Professora: Ivone Matsuno Yugoshi

--Dados da tabela 

--INSERTs na tabela - Funcionário, sem relacionar o SUPERVISOR e DEPTO

INSERT INTO funcionario(PNOME, MINICIAL, UNOME, NUMFUNC, DATANASC, ENDERECO, SEXO, SALARIO) 
values 
	('John', 'B', 'Smith', 123456789, '1979/09/01', '731 Fondren, Houston, Tx', 'M', 30000),
	('Franklin', 'T', 'Wong' , 333445555, '1982/08/12', '638 Voss, Houston, Tx', 'M', 40000),
	('Alicia', 'J', 'Zelaya', 999887777, '1990/01/19', '3321 Castle, Spring, TX', 'F', 2500),
	('Jennifer', 'S', 'Wallace', 987654321, '1981/06/06', '291 Berry, Bellarie, TX', 'F', 43000),
	('Ramesh', 'K', 'Narayan', 666884444, '1985/09/15', '975 Fire Oak, Humble, TX', 'M', 38000),
	('Joyce', 'A', 'English', 453453453, '1982/07/31', '5631 Rice, Houston, TX', 'F', 25000),
	('Ahmad', 'V', 'Jabbar', 987987987, '1989/03/29', '980 Dallas, Houston, TX', 'M', 25000),
	('James', 'E', 'Borg', 888665555, '1980/11/10', '450 Stone, Houston, TX', 'M', 55000);

--UPDATEs na tabela FUNCIONARIO atualizando o campo supervisor
UPDATE FUNCIONARIO SET supervisor = 333445555 
WHERE NUMFUNC= 123456789 OR NUMFUNC = 666884444 OR NUMFUNC = 453453453;

UPDATE FUNCIONARIO SET supervisor = 888665555 
WHERE NUMFUNC = 333445555 OR NUMFUNC = 987654321;

UPDATE FUNCIONARIO SET supervisor = 987654321 
WHERE NUMFUNC = 999887777 OR NUMFUNC = 987987987;

--INSERTs na tabela departamento

INSERT INTO departamento(NOMEDEPTO, NUMDEPTO, GERENTE, DATA_INI_GERENTE)
VALUES 	('Pesquisa', 5, 333445555, '2005/05/22'),
		('TI', 4, 987654321, '2004/01/12'),
		('Administração', 1, 888665555, '2001/06/18');

--UPDATEs na tabela FUNCIONARIO atualizando o campo DEPTO 
UPDATE FUNCIONARIO SET DEPTO = 5 WHERE NUMFUNC = 123456789 OR NUMFUNC = 333445555 OR NUMFUNC = 666884444 OR NUMFUNC = 453453453;

UPDATE FUNCIONARIO SET DEPTO = 4 WHERE NUMFUNC = 999887777 OR NUMFUNC = 987654321 OR NUMFUNC = 987987987;

UPDATE FUNCIONARIO SET DEPTO = 1 WHERE NUMFUNC = 888665555;

--INSERTs na tabela depto_localizacoes
INSERT INTO depto_local(numdepto, dlocalizacao)
VALUES 	(1, 'Três Lagoas'), 
		(4, 'Campo Grande'), 
		(5, 'Corumbá'), 
		(5, 'Ponta Porã'), 
		(5, 'Coxim');

--INSERTs na tabela projeto
INSERT INTO projeto(PROJNOME, PROJNUM, PROJLOCAL, DNUM)
	VALUES  ('ProdutoX',1,'Três Lagoas', 1),
			('ProdutoY',2,'Ponta Porã', 5),
			('ProdutoZ',3,'Coxim', 5),
			('Automatização',10,'Campo Grande', 4),
			('Reorganização',20,'Três Lagoas', 1),
			('Novos Benefícios',30,'Corumbá', 5);

--INSERTs na tabela trabalha_em que relaciona funcionário e projeto
INSERT INTO trabalha_em (FNUM, PNUM, HORAS)
VALUES 	(123456789, 1, 32.5),
		(123456789, 2, 7.5),
		(666884444, 3, 40.0),
		(453453453, 1, 20.0),
		(453453453, 2, 20.0),
		(333445555, 2, 10.0),
		(333445555, 3, 10.0),
		(333445555, 10, 10.0),
		(333445555, 20, 10.0),
		(999887777, 30, 30.0),
		(999887777, 10, 10.0),
		(987987987, 10, 35.0),
		(987987987, 30, 5.0),
		(987654321, 30, 20.0),
		(987654321, 20, 15.0),
		(888665555, 20, 35.0);

--INSERTs na tabela dependente
INSERT INTO dependente (FNUM, NOMEDEPENDENTE, SEXO, DATANASC, PARENTESCO)
VALUES 	(333445555, 'Alice', 'F', '2005/06/05', 'FILHA'),
		(333445555, 'Theodore', 'M', '2007/10/23', 'FILHO'),
		(333445555, 'Joy', 'F', '1990/06/09', 'CÔNJUGE'),
		(987654321, 'Abner', 'M', '1980/08/24', 'CÔNJUGE'),
		(123456789, 'Michael', 'M', '2007/01/04', 'FILHO'),
		(123456789, 'Alice', 'F', '2002/12/03', 'FILHA'),
		(123456789, 'Elizabeth', 'F', '1985/11/09', 'CÔNJUGE');
