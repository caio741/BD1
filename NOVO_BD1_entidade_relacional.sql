#https://github.com/caio741/BD1.git
CREATE DATABASE IF NOT EXISTS VIDEO_LOCADORA;
USE VIDEO_LOCADORA;

DROP TABLE if exists FUNC_CONTRATADO;
DROP TABLE if exists FUNC_HORISTA;
DROP TABLE if exists DEPENDENTES;
DROP TABLE if exists EXEMPLAR;
DROP TABLE if exists ENDERECO;
DROP TABLE if exists FILME;
DROP TABLE if exists CATEGORIA;
DROP TABLE if exists AUTOR;
DROP TABLE if exists ALUGAR;
DROP TABLE if exists FUNCIONARIO;
DROP TABLE if exists CLIENTE;
DROP TABLE if exists PESSOA_FISICA;

CREATE TABLE PESSOA_FISICA(
CPF CHAR(11),
RG INTEGER,
SEXO CHAR(15),
IDADE INTEGER,
PRIMARY KEY (CPF)
);
CREATE TABLE CLIENTE(
ID_CLIENTE INTEGER,
NOME CHAR(20),
TELEFONE CHAR(12),
EMAIL VARCHAR(30),
CPF CHAR(11),
PRIMARY KEY (ID_CLIENTE),
FOREIGN KEY (CPF) REFERENCES PESSOA_FISICA(CPF) ON DELETE CASCADE
);
CREATE TABLE FUNCIONARIO(
CPF CHAR(11),
NOME VARCHAR(50),
RG INTEGER,
SEXO CHAR(15),
IDADE INTEGER,
PRIMARY KEY (CPF)
);
CREATE TABLE ALUGAR(
ID_ALUGUEL INTEGER,
INICIO DATE,
TERMINO DATE,
CPF CHAR(11),
ID_CLIENTE INTEGER,
PRIMARY KEY (ID_ALUGUEL),
FOREIGN KEY (CPF) REFERENCES FUNCIONARIO(CPF) ON DELETE CASCADE,
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE) ON DELETE CASCADE
);
CREATE TABLE AUTOR(
ID_AUTOR INTEGER,
NOME CHAR(50),
ANO_NASCEU DATE,
PRIMARY KEY (ID_AUTOR)
);
CREATE TABLE CATEGORIA(
ID_GENERO INTEGER,
NOME_GENERO CHAR(10),
DETALHE VARCHAR(200),
PRIMARY KEY (ID_GENERO)
);
CREATE TABLE FILME(
ID_FILME INTEGER,
NOME_FILME CHAR(20),
PRODUTOR_FILME CHAR(50),
ID_AUTOR INTEGER,
ID_GENERO INTEGER,
PRIMARY KEY (ID_FILME),
FOREIGN KEY (ID_AUTOR) REFERENCES AUTOR(ID_AUTOR) ON DELETE CASCADE,
FOREIGN KEY (ID_GENERO) REFERENCES CATEGORIA(ID_GENERO) ON DELETE CASCADE
);
CREATE TABLE ENDERECO(
DESCRICAO VARCHAR(50),
CEP CHAR(8),
BAIRRO CHAR(20),
RUA VARCHAR(100),
NUMERO INTEGER,
ID_CLIENTE INTEGER,
PRIMARY KEY (DESCRICAO, ID_CLIENTE),
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE) ON DELETE CASCADE
);
CREATE TABLE EXEMPLAR(
NUMERO_COPIA INTEGER,
TEMPO_MAX_EMPRESTIMO INTEGER,
ID_ALUGUEL INTEGER,
ID_FILME INTEGER,
PRIMARY KEY (NUMERO_COPIA, ID_ALUGUEL, ID_FILME),
FOREIGN KEY (ID_ALUGUEL) REFERENCES ALUGAR(ID_ALUGUEL) ON DELETE CASCADE,
FOREIGN KEY (ID_FILME) REFERENCES FILME(ID_FILME) ON DELETE CASCADE
);
CREATE TABLE DEPENDENTES(
CPF CHAR(11),
NOME VARCHAR(50),
IDADE INTEGER,
RELACIONAMENTO CHAR(10),
PRIMARY KEY (CPF, NOME),
FOREIGN KEY (CPF) REFERENCES PESSOA_FISICA(CPF) ON DELETE CASCADE
);
CREATE TABLE FUNC_HORISTA(
CPF CHAR(11),
ID_TEMP INTEGER,
HORAS_TRABALHADA TIME,
SALARIO_HORA DOUBLE,
PRIMARY KEY (CPF),
FOREIGN KEY (CPF) REFERENCES FUNCIONARIO(CPF) ON DELETE CASCADE
);
CREATE TABLE FUNC_CONTRATADO(
CPF CHAR(11),
ID INTEGER,
SALARIO DOUBLE,
TURNO VARCHAR(20),
PRIMARY KEY (CPF),
FOREIGN KEY (CPF) REFERENCES FUNCIONARIO(CPF) ON DELETE CASCADE
);