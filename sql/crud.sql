-- CRIAÇÃO DO BANCO DE DADOS
CREATE SCHEMA IF NOT EXISTS petShop;

-- CRIAÇÃO DA TABELA DE CLIENTES
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(20),
    email VARCHAR(30),
    telefone VARCHAR(20),
    data_nascimento DATE,
    cpf VARCHAR(11)
);

-- INSERÇÃO DE DADOS NAS TABELAS
INSERT INTO cliente (nome,email,telefone,data_nascimento,cpf) VALUES ('Ana Silva','cliente1@gmail.com','169900000001','1990-01-01','10000000001');
INSERT INTO endereco (rua,bairro,numero,cidade,estado,cep,id_cliente) VALUES ('Rua 1','Centro','1','Batatais','SP','14000001',1);
INSERT INTO pet (nome,especie,data_nascimento,idade,peso,cor,sexo,raca,id_cliente) VALUES ('Pet1','Cachorro','2020-01-01',5,10.1,'Marrom','M','Labrador',1);
INSERT INTO funcionario (nome,cpf,data_admissao,cargo,salario) VALUES ('Funcionario 1','20000000001','2022-01-01','Atendente',2550);

-- CONSULTA DE DADOS


-- atendimento que o valor foi maior que 50
SELECT
    p.nome AS pet,
    a.data_atendimento,
    a.valor_total
FROM pet p
INNER JOIN atendimento a
    ON p.id_pet = a.id_pet
WHERE a.valor_total > 50
ORDER BY a.valor_total DESC;


-- o produto é usado para tal serviço
SELECT
    s.nome_servico,
    p.nome_produto
FROM servico s
INNER JOIN produtos p
    ON s.id_servico = p.id_servico
WHERE p.preco > 0
ORDER BY s.nome_servico;


-- pet mais atendido
SELECT
    c.nome AS cliente,
    p.nome AS pet,
    a.data_atendimento,
    a.valor_total
FROM cliente c
INNER JOIN pet p
    ON c.id_cliente = p.id_cliente
INNER JOIN atendimento a
    ON p.id_pet = a.id_pet
WHERE a.valor_total > 90
ORDER BY a.valor_total DESC;

-- atualização de dados

-- atualiza o salario do funcionario com id 5 para 4500.00
UPDATE funcionario
SET salario = 4500.00
WHERE id_funcionario = 5;


-- exclusão de dados

-- deleção de produto com o id 10
DELETE FROM produtos
WHERE id_produtos = 10;