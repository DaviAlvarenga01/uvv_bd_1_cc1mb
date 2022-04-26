


CREATE TABLE elmasri.funcionario (                                      -- Cria a tabela funcionarios
                cpf CHAR(11) NOT NULL COMMENT 'CPF do funcionário. Será a PK da tabela.',        -- no mariadb os comentarios ja ficam inclusos nas colunas.
                primeiro_nome VARCHAR(15) NOT NULL COMMENT 'Primeiro nome do funcionário.',
                nome_meio CHAR(1) COMMENT 'Inicial do nome do meio.',
                ultimo_nome VARCHAR(15) NOT NULL COMMENT 'Sobrenome do funcionário.',     
                data_nascimento DATE,
                endereco VARCHAR(90) COMMENT 'Endereço do funcionário.',    
                sexo CHAR(1) COMMENT 'Sexo do funcionário.',
                salario NUMERIC(10,2) COMMENT 'Salário do funcionário.',
                cpf_supervisor CHAR(11) NOT NULL COMMENT 'o-relacionamento).',
                numero_departamento INTEGER NOT NULL COMMENT 'Número do departamento do funcionário.',   -- É uma foreign key da tabela departamentos
                CONSTRAINT funcionario_pk PRIMARY KEY (cpf)                       -- cria a primary key_cpf
);

/* Parte Incial do codigo, onde se elabora a tabela principal de onde vao sair as principais relacoes,
e onde ficarao armazenadas as informacoes sobre os funcionarios. Endereço sofreu alteração na quantidade de caracteres para poder comportar os enderecos do pset.
 */ 

ALTER TABLE elmasri.funcionario COMMENT 'Tabela que armazena as informações dos funcionários.';     -- comando que insere uma descrição da tabela

INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('12345678966', 'João', 'B', 'Silva', '1985-01-09', 'Rua das Flores,751,Sao Paulo,SP', 'M', 30000.00, '33344555587', 5);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('33344555576', 'Fernando', 'T', 'Wong', '1955-12-08', 'Rua da Lapa, 34, São Paulo,SP', 'M', 40000.00, '88866555576', 5);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('45345345376', 'Joice', 'A', 'Leite', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000.00, '33344555587', 5);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('66688444476', 'Ronaldo', 'K', 'Lima', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000.00, '33344555587', 5);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('88866555576', 'Jorge', 'E', 'Brito', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000.00, 'NULL', 1);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('98765432168', 'Jennifer', 'S', 'Souza', '1941-06-20', 'Av.Arthur de Lima, 54, Santo André, SP', 'F', 43000.00, '88866555576', 4);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('98798798733', 'Andre', 'V', 'Pereira', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000.00, '98765432168', 4);
INSERT INTO uvv.funcionarios (CPF, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES('99988777767', 'Alice', 'J', 'Zelaya', '1968-01-19', 'Rua Souza Lima,35, Curitiba, PR', 'F', 25000.00, '98765432168', 4);




CREATE TABLE elmasri.departamento (                           -- CRIA a tabela departamento
                numero_departamento INTEGER NOT NULL COMMENT 'Número do departamento. É a PK desta tabela.',
                nome_departamento VARCHAR(15) NOT NULL COMMENT 'Nome do departamento. Deve ser único.',
                cpf_gerente CHAR(11) NOT NULL COMMENT 'CPF do gerente do departamento. É uma FK para a tabela funcionários.',    
                data_inicio_gerente DATE COMMENT 'Data do início do gerente no departamento.',
                CONSTRAINT numero_departamento_pk PRIMARY KEY (numero_departamento)
);
ALTER TABLE elmasri.departamento COMMENT 'Tabela que armazena as informaçoẽs dos departamentos.';

INSERT INTO uvv.departamento (numero_departamento, nome_departamento, cpf_gerente, data_inicio_gerente) VALUES(1, 'Matriz', '88866555576', '1981-06-19');
INSERT INTO uvv.departamento (numero_departamento, nome_departamento, cpf_gerente, data_inicio_gerente) VALUES(4, 'Administração', '98765432168', '1995-01-01');
INSERT INTO uvv.departamento (numero_departamento, nome_departamento, cpf_gerente, data_inicio_gerente) VALUES(5, 'Pesquisa', '33344555587', '1988-05-22');



CREATE UNIQUE INDEX departamento_idx     -- Cria uma chave única
 ON elmasri.departamento
 ( nome_departamento );

/*uma chave exclusiva/unica é uma chave candidata que não é a chave primária da relação.*/

CREATE TABLE elmasri.localizacoes_departamento (
                numero_departamento INTEGER NOT NULL COMMENT 'Número do departamento. Faz parta da PK desta tabela e também é uma FK para a tabela departamento.',
                local VARCHAR(15) NOT NULL COMMENT 'Localização do departamento. Faz parte da PK desta tabela.',
                CONSTRAINT numero_departamento_pk PRIMARY KEY (numero_departamento, local)
);
ALTER TABLE elmasri.localizacoes_departamento COMMENT 'Tabela que armazena as possíveis localizações dos departamentos.';   

INSERT INTO uvv.localizacoes_departamentos (numero_departamento, `local`) VALUES(1, 'São Paulo');
INSERT INTO uvv.localizacoes_departamentos (numero_departamento, `local`) VALUES(4, 'Mauã');
INSERT INTO uvv.localizacoes_departamentos (numero_departamento, `local`) VALUES(5, 'Itu');
INSERT INTO uvv.localizacoes_departamentos (numero_departamento, `local`) VALUES(5, 'Santo André');
INSERT INTO uvv.localizacoes_departamentos (numero_departamento, `local`) VALUES(5, 'São Paulo');


CREATE TABLE elmasri.projeto (
                numero_projeto INTEGER NOT NULL COMMENT 'Número do projeto. É a PK desta tabela.',
                nome_projeto VARCHAR(15) NOT NULL COMMENT 'Nome do projeto. Deve ser único.',
                local_projeto VARCHAR(15) COMMENT 'Localização do projeto.',
                numero_departamento INTEGER NOT NULL COMMENT 'Número do departamento. É uma FK para a tabela departamento.',
                CONSTRAINT numero_projeto_pk PRIMARY KEY (numero_projeto)
);
ALTER TABLE elmasri.projeto COMMENT 'Tabela que armazena as informações sobre os projetos dos departamentos.';

INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(1, 'ProdutoX', 'Santo André', 5);
INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(2, 'ProdutoY', 'Itu', 5);
INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(3, 'ProdutoZ', 'São Paulo', 5);
INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(10, 'Informatização', 'Mauá', 4);
INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(20, 'Reorganização', 'São Paulo', 1);
INSERT INTO uvv.projeto (numero_projeto, nome_projeto, local_projeto, numero_departamento) VALUES(30, 'Novosbeneficios', 'Mauá', 4);


CREATE UNIQUE INDEX projeto_idx
 ON elmasri.projeto
 ( nome_projeto );


CREATE TABLE elmasri.trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL COMMENT 'CPF do funcionário. Faz parte da PK desta tabela e é uma FK para a tabela funcionário.',
                numero_projeto INTEGER NOT NULL COMMENT 'Número do projeto. Faz parte da PK desta tabela e é uma FK para a tabela projeto.',
                horas NUMERIC(3,1) NOT NULL COMMENT 'Horas trabalhadas pelo funcionário neste projeto.',
                CONSTRAINT numero_parentesco_pk PRIMARY KEY (cpf_funcionario, numero_projeto)
);
ALTER TABLE elmasri.trabalha_em COMMENT 'Tabela para armazenar quais funcionários trabalham em quais projetos.';

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


CREATE TABLE elmasri.dependente (
                cpf_funcionario CHAR(11) NOT NULL COMMENT 'CPF do funcionário. Faz parte da PK desta tabela e é uma FK para a tabela funcionário.',
                nome_dependente VARCHAR(15) NOT NULL COMMENT 'Nome do dependente. Faz parte da PK desta tabela.',
                sexo CHAR(1) COMMENT 'Sexo do dependente.',
                data_nascimento DATE COMMENT 'Data de nascimento do dependente.',
                parentesco VARCHAR(15) COMMENT 'Descrição do parentesco do dependente com o funcionário.',
                CONSTRAINT nome_dependente_pk PRIMARY KEY (cpf_funcionario, nome_dependente)
);
ALTER TABLE elmasri.dependente COMMENT 'Tabela que armazena as informações dos dependentes dos funcionários.';

INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('12345678966', 'Michael', 'M', '1988-01-04', 'Filho');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho');
INSERT INTO uvv.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido');


 -- Criação das foreign Keys 

ALTER TABLE elmasri.funcionarios ADD CONSTRAINT funcionarios_funcionarios_fk   
FOREIGN KEY (cpf_supervisor)
REFERENCES elmasri.funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;   -- A restrição é incondicionalmente verificada ao final de cada instrução SQL.

ALTER TABLE elmasri.dependente ADD CONSTRAINT funcionarios_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT funcionarios_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.departamento ADD CONSTRAINT funcionarios_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES elmasri.funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES elmasri.projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
