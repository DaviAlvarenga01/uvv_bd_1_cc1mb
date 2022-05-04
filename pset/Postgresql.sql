-- elmasri.departamento definition

-- Drop table

-- DROP TABLE elmasri.departamento;

CREATE TABLE elmasri.departamento (
	numero_departamento int4 NOT NULL,
	nome_departamento varchar(15) NOT NULL,
	cpf_gerente bpchar(11) NOT NULL,
	data_inicio_gerente date NULL,
	CONSTRAINT numero_departamento_pk PRIMARY KEY (numero_departamento)
);
CREATE UNIQUE INDEX departamento_idx ON elmasri.departamento USING btree (nome_departamento);


-- elmasri.departamento foreign keys

ALTER TABLE elmasri.departamento ADD CONSTRAINT funcionarios_departamento_fk FOREIGN KEY (cpf_gerente) REFERENCES elmasri.funcionarios(cpf);

-- elmasri.dependente definition

-- Drop table

-- DROP TABLE elmasri.dependente;

CREATE TABLE elmasri.dependente (
	cpf_funcionario bpchar(11) NOT NULL,
	nome_dependente varchar(15) NOT NULL,
	sexo bpchar(1) NULL,
	data_nascimento date NULL,
	parentesco varchar(15) NULL,
	CONSTRAINT nome_dependente_pk PRIMARY KEY (cpf_funcionario, nome_dependente)
);


-- elmasri.dependente foreign keys

ALTER TABLE elmasri.dependente ADD CONSTRAINT funcionarios_dependente_fk FOREIGN KEY (cpf_funcionario) REFERENCES elmasri.funcionarios(cpf);

-- elmasri.funcionarios definition

-- Drop table

-- DROP TABLE elmasri.funcionarios;

CREATE TABLE elmasri.funcionarios (
	cpf bpchar(11) NOT NULL,
	primeiro_nome varchar(15) NOT NULL,
	nome_meio bpchar(1) NULL,
	endereco varchar(20) NOT NULL,
	ultimo_nome varchar(15) NOT NULL,
	data_nascimento date NULL,
	sexo bpchar(1) NULL,
	salario numeric(10, 2) NULL,
	cpf_supervisor bpchar(11) NOT NULL,
	numero_departamento int4 NOT NULL,
	CONSTRAINT cpf_pk PRIMARY KEY (cpf),
	CONSTRAINT funcionarios_funcionarios_fk FOREIGN KEY (cpf_supervisor) REFERENCES elmasri.funcionarios(cpf)
);

-- elmasri.projeto definition

-- Drop table

-- DROP TABLE elmasri.projeto;

CREATE TABLE elmasri.projeto (
	numero_projeto int4 NOT NULL,
	nome_projeto varchar(15) NOT NULL,
	local_projeto varchar(15) NULL,
	numero_departamento int4 NOT NULL,
	CONSTRAINT numero_projeto_pk PRIMARY KEY (numero_projeto)
);
CREATE UNIQUE INDEX projeto_idx ON elmasri.projeto USING btree (nome_projeto);


-- elmasri.projeto foreign keys

ALTER TABLE elmasri.projeto ADD CONSTRAINT departamento_projeto_fk FOREIGN KEY (numero_departamento) REFERENCES elmasri.departamento(numero_departamento);

-- elmasri.trabalha_em definition

-- Drop table

-- DROP TABLE elmasri.trabalha_em;

CREATE TABLE elmasri.trabalha_em (
	cpf_funcionario bpchar(11) NOT NULL,
	numero_projeto int4 NOT NULL,
	horas numeric(3, 1) NOT NULL,
	CONSTRAINT numero_parentesco_pk PRIMARY KEY (cpf_funcionario, numero_projeto)
);


-- elmasri.trabalha_em foreign keys

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT funcionarios_trabalha_em_fk FOREIGN KEY (cpf_funcionario) REFERENCES elmasri.funcionarios(cpf);
ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk FOREIGN KEY (numero_projeto) REFERENCES elmasri.projeto(numero_projeto);

CREATE TABLE elmasri.localizacoes_departamento (
    numero_departamento int4 NOT NULL,
    "local" varchar(15) NOT NULL,
    CONSTRAINT localizacoes_departamento_pk PRIMARY KEY (numero_departamento, local),
    CONSTRAINT departamento_localizacoes_departamento_fk FOREIGN KEY (numero_departamento) REFERENCES elmasri.departamento(numero_departamento)
);


INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('12345678966', 'João', 'B', 'Silva', '1985-01-09', 'Rua das Flores,751,Sao Paulo,SP', 'M', 30000.00, '33344555587', 5);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('33344555576', 'Fernando', 'T', 'Wong', '1955-12-08', 'Rua da Lapa, 34, São Paulo,SP', 'M', 40000.00, '88866555576', 5);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('45345345376', 'Joice', 'A', 'Leite', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000.00, '33344555587', 5);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('66688444476', 'Ronaldo', 'K', 'Lima', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000.00, '33344555587', 5);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('88866555576', 'Jorge', 'E', 'Brito', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000.00, 'NULL', 1);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('98765432168', 'Jennifer', 'S', 'Souza', '1941-06-20', 'Av.Arthur de Lima, 54, Santo André, SP', 'F', 43000.00, '88866555576', 4);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('98798798733', 'Andre', 'V', 'Pereira', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000.00, '98765432168', 4);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('99988777767', 'Alice', 'J', 'Zelaya', '1968-01-19', 'Rua Souza Lima,35, Curitiba, PR', 'F', 25000.00, '98765432168', 4);


INSERT INTO uvv.departamento (numero_departamento, nome_departamento, cpf_gerente, data_inicio_gerente) VALUES(1, 'Matriz', '88866555576', '1981-06-19');
INSERT INTO uvv.departamento (numero_departamento, nome_departamento, cpf_gerente, data_inicio_gerente) VALUES(4, 'Administração', '98765432168', '1995-01-01');
INSERT INTO uvv.departamento (numero_departamento, nome_departamento, cpf_gerente, data_inicio_gerente) VALUES(5, 'Pesquisa', '33344555587', '1988-05-22');


INSERT INTO uvv.localizacoes_departamentos (numero_departamento, `local`) VALUES(1, 'São Paulo');
INSERT INTO uvv.localizacoes_departamentos (numero_departamento, `local`) VALUES(4, 'Mauã');
INSERT INTO uvv.localizacoes_departamentos (numero_departamento, `local`) VALUES(5, 'Itu');
INSERT INTO uvv.localizacoes_departamentos (numero_departamento, `local`) VALUES(5, 'Santo André');
INSERT INTO uvv.localizacoes_departamentos (numero_departamento, `local`) VALUES(5, 'São Paulo');


INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(1, 'ProdutoX', 'Santo André', 5);
INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(2, 'ProdutoY', 'Itu', 5);
INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(3, 'ProdutoZ', 'São Paulo', 5);
INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(10, 'Informatização', 'Mauá', 4);
INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(20, 'Reorganização', 'São Paulo', 1);
INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(30, 'Novosbeneficios', 'Mauá', 4);


INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('12345678966', 1, 32.5);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('12345678966', 2, 7.5);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('33344555587', 2, 10.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('33344555587', 3, 10.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('33344555587', 10, 10.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('45345345376', 1, 20.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('45345345376', 2, 20.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('66688444476', 3, 40.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('88866555576', 20, 0.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('98765432168', 20, 15.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('98765432168', 30, 20.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('98798798733', 10, 35.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('98798798733', 30, 5.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('99988777767', 10, 10.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('99988777767', 20, 10.0);
INSERT INTO uvv.trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES('99988777767', 30, 30.0);



INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('12345678966', 'Michael', 'M', '1988-01-04', 'Filho');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido');

