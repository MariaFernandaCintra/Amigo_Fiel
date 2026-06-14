CREATE SCHEMA IF NOT EXISTS petShop;

-- CRIAÇÃO DA TABELA CLIENTES
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(20),
    email VARCHAR(30),
    telefone VARCHAR(20),
    data_nascimento DATE,
    cpf VARCHAR(11)
);

-- CRIAÇÃO DA TABELA ENDEREÇO
CREATE TABLE endereco (
    id_endereco SERIAL PRIMARY KEY,
    rua VARCHAR(20),
    bairro VARCHAR(30),
    numero VARCHAR(5),
    cidade VARCHAR(20),
    estado VARCHAR(20),
    cep VARCHAR(8),
    id_cliente       INT           NOT NULL REFERENCES cliente(id_cliente)
);

-- CRIAÇÃO DA TABELA PET
CREATE TABLE pet (
    id_pet SERIAL PRIMARY KEY,
    nome VARCHAR(20),
    especie VARCHAR(30),
    data_nascimento DATE,
    idade INT,
    peso FLOAT,
    cor VARCHAR(10),
    sexo VARCHAR(15),
    raca VARCHAR(15),

    id_cliente INT   NOT NULL  REFERENCES cliente(id_cliente)
);


-- CRIAÇÃO DA TABELA FUNCIONARIO
CREATE TABLE funcionario (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(20),
    cpf VARCHAR(11),
    data_admissao DATE,
    cargo VARCHAR(30),
    salario DECIMAL(10,2)
);


-- CRIAÇÃO DA TABELA SERVIÇO
CREATE TABLE servico (
    id_servico SERIAL PRIMARY KEY,
    nome_servico VARCHAR(20),
    valor DECIMAL(10,2),
    descricao VARCHAR(50)
);

-- CRIAÇÃO DA TABELA FUNCIONARIO_SERVIÇO (RELACIONAL)
CREATE TABLE funcionario_servico (
    id_funcionario_servico SERIAL PRIMARY KEY,
    id_funcionario INT NOT NULL REFERENCES funcionario(id_funcionario),
    id_servico INT NOT NULL REFERENCES servico(id_servico)
);

-- CRIAÇAO DA TABELA ATENDIMENTO
CREATE TABLE atendimento (
    id_atendimento SERIAL PRIMARY KEY,
    data_atendimento DATE,
    horario TIME,
    valor_total DECIMAL(10,2),
    observacoes VARCHAR(100),
    id_pet INT NOT NULL REFERENCES pet(id_pet),
    id_funcionario INT NOT NULL REFERENCES funcionario(id_funcionario)      
);


-- CRIAÇÃO DA TABELA FORNECEDOR
CREATE TABLE fornecedor (
    id_fornecedor SERIAL PRIMARY KEY,
    razao_social VARCHAR(30),
    cnpj VARCHAR(20),
    email VARCHAR(50),
    telefone VARCHAR(20)
);

-- CRIAÇÃO DA TABELA PRODUTOS
CREATE TABLE produtos (
    id_produtos INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_produto VARCHAR(20),
    categoria VARCHAR(50),
    preco DECIMAL(10,2),
    quantidade_estoque INT,
    id_servico INT NOT NULL REFERENCES servico(id_servico),
    id_fornecedor INT NOT NULL REFERENCES fornecedor(id_fornecedor)     
);
