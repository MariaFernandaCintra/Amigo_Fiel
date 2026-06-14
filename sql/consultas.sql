-- CONSULTAS

-- clientes que tem como pet um cachorro
SELECT
    c.nome AS cliente,
    p.nome AS pet,
    p.especie
FROM cliente c
INNER JOIN pet p
    ON c.id_cliente = p.id_cliente
WHERE p.especie = 'Cachorro'
ORDER BY c.nome;

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

-- funcionarios que realizaram procedimentos que o total foi maior que 60
SELECT
    f.nome AS funcionario,
    a.data_atendimento,
    a.valor_total
FROM funcionario f
INNER JOIN atendimento a
    ON f.id_funcionario = a.id_funcionario
WHERE a.valor_total >= 60
ORDER BY f.nome;

-- produtos que custam mais de R$ 20,00 juntamente com o fornecedor responsável por cada produto
SELECT
    p.nome_produto,
    p.preco,
    f.razao_social
FROM produtos p
INNER JOIN fornecedor f
    ON p.id_fornecedor = f.id_fornecedor
WHERE p.preco > 20
ORDER BY p.preco DESC;

-- mostrar quais funcionários estão habilitados a realizar quais serviços, exibindo apenas os serviços com valor superior a R$ 30,00.
SELECT
    f.nome,
    s.nome_servico,
    s.valor
FROM funcionario f
INNER JOIN funcionario_servico fs
    ON f.id_funcionario = fs.id_funcionario
INNER JOIN servico s
    ON fs.id_servico = s.id_servico
WHERE s.valor > 30
ORDER BY s.valor DESC;

-- Fornecedores de produtos de higiene
SELECT
    f.razao_social,
    p.nome_produto,
    p.categoria
FROM fornecedor f
INNER JOIN produtos p
    ON f.id_fornecedor = p.id_fornecedor
WHERE p.categoria = 'Higiene'
ORDER BY f.razao_social;

-- Produtos que tem o estoque acima de 100 unidades
SELECT
    p.nome_produto,
    p.quantidade_estoque,
    f.razao_social
FROM produtos p
INNER JOIN fornecedor f
    ON p.id_fornecedor = f.id_fornecedor
WHERE p.quantidade_estoque > 100
ORDER BY p.quantidade_estoque DESC;

-- clientes que tem um animail da raça labrador
SELECT
    c.nome,
    p.nome,
    p.raca
FROM cliente c
INNER JOIN pet p
    ON c.id_cliente = p.id_cliente
WHERE p.raca = 'Labrador'
ORDER BY c.nome;


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