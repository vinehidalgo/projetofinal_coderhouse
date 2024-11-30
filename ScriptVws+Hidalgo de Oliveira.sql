/* Criação de Views - Base de Dados dundler_mifflin_rh */

/* 1. View: Lista de Funcionários com seus Departamentos, Cargos e Localizações 

Esta view tem por objetivo fornecer as informações completas sobre os funcionários, incluindo o departamento, cargo e localização onde trabalham:

*/ 

CREATE VIEW vw_funcionarios_detalhe AS 
SELECT 
	f.id_funcionario AS id_funcionario,
    f.nome AS nome_funcionario,
    f.data_nascimento AS data_nascimento,
    d.nome_departamento AS nome_departamento,
    c.titulo_cargo AS cargo,
    l.cidade AS localizacao,
    l.endereco AS endereco_localizacao
FROM 
	funcionarios as f
LEFT JOIN
	departamentos AS d ON f.id_departamento = d.id_departamento 
LEFT JOIN 
	cargos AS c ON f.id_cargo = c.id_cargo 
LEFT JOIN 
	localizacoes AS l ON f.id_localizacao = l.id_localizacao;
    
    /* 2. View: Contatos de Funcionários 
    
    Esta view tem por objetivo listar todos os contatos de cada funcionário, facilitando o acesso a números de telefone e e-mails
    
    */ 
    
CREATE VIEW vw_contatos_funcionarios AS
SELECT 
    f.id_funcionario,
    f.nome AS nome_funcionario,
    -- Subconsulta para pegar o valor do contato do tipo 'Telefone'
    (SELECT c.valor_contato 
     FROM contatos AS c 
     WHERE c.id_funcionario = f.id_funcionario AND c.tipo_contato = 'Telefone'
     LIMIT 1) AS telefone,
    -- Subconsulta para pegar o valor do contato do tipo 'E-mail'
    (SELECT c.valor_contato 
     FROM contatos AS c 
     WHERE c.id_funcionario = f.id_funcionario AND c.tipo_contato = 'E-mail'
     LIMIT 1) AS email
FROM 
    funcionarios AS f;

/* 3. View: Funcionários e seus Gerentes

Esta view tem por objetivo mostrar os funcionários e seus respectivos gerentes de departamento a qual pertencem

*/ 

CREATE VIEW vw_funcionarios_gerentes AS
SELECT 
	f.id_funcionario,
    f.nome AS nome_funcionario,
    d.nome_departamento,
    g.nome AS nome_gerente
FROM 
	funcionarios AS f 
LEFT JOIN 
	departamentos AS d ON f.id_departamento = d.id_departamento
LEFT JOIN
	funcionarios AS g ON d.id_gerente = g.id_funcionario
ORDER BY 
	f.nome;

/* 4. View: Resumo de Departamento

Esta view tem por objetivo trazer um resumo de cada departamento, incluindo o número de funcionários, o gerente e a localização atual

*/ 

CREATE VIEW vw_departamentos_resumo AS 
SELECT 
	d.id_departamento,
    d.nome_departamento AS nome_departamento,
    g.nome AS nome_gerente,
    COUNT(f.id_funcionario) AS total_funcionarios,
    l.cidade AS localizacao_principal
FROM 
	departamentos AS d 
LEFT JOIN
	funcionarios AS g ON d.id_gerente = g.id_funcionario
LEFT JOIN    
    funcionarios AS f ON d.id_departamento = f.id_departamento
LEFT JOIN 
	localizacoes AS l ON f.id_localizacao = l.id_localizacao
GROUP BY 
	d.id_departamento, d.nome_departamento, g.nome, l.cidade;
    
/* 5. View: Funcionários por Localização

Esta view tem por objetivo exibir todos os funcionários agrupados pelas diferentes localizações da empresa.

*/ 

CREATE VIEW vw_funcionarios_localizacao AS 
SELECT 
	f.id_funcionario,
    f.nome AS nome_funcionario,
    c.titulo_cargo,
    d.nome_departamento,
	l.cidade AS cidade_localizacao,
    l.endereco AS endereco_localizacao
FROM 
	funcionarios AS f
LEFT JOIN 
	localizacoes AS l ON f.id_localizacao = l.id_localizacao
LEFT JOIN 
	departamentos AS d ON f.id_departamento = d.id_departamento
LEFT JOIN 
	cargos AS c ON f.id_cargo = c.id_cargo 
ORDER BY 
	l.cidade, f.nome; 

/* 6. View: Relatório Gerencial Completo dos Funcionários 

Essa view tem por objetivo trazer uma visão completa de todos os funcionários, incluindo o salário base o o valor total considerando um acréscimo de benefícios de 10%

*/ 

CREATE VIEW vw_relatorio_gerencial AS 
SELECT 
	f.id_funcionario,
    f.nome AS nome_funcionario,
    f.data_nascimento,
    d.nome_departamento,
    g.nome AS nome_gerente,
    c.titulo_cargo,
    c.salario AS salario_base,
    l.cidade AS cidade_localizacao,
    l.endereco AS endereco_localizacao,
    -- Subconsulta para obter o telefone
    (SELECT ct.valor_contato
	FROM contatos AS ct 
    WHERE ct.id_funcionario = f.id_funcionario AND ct.tipo_contato = 'Telefone'
    LIMIT 1) AS telefone,
    -- Subconsulta para obter o email
    (SELECT ct.valor_contato
    FROM contatos AS ct 
    WHERE ct.id_funcionario = f.id_funcionario AND ct.tipo_contato = 'E-mail'
    LIMIT 1) AS email,
    -- Total de funcionarios no mesmo departamento
    (SELECT COUNT(*) 
    FROM funcionarios AS f2
    WHERE f2.id_departamento = f.id_departamento) AS total_funcionarios_departamento,
    -- Salário total (base + benefícios fictícios calculados) 
    (c.salario + (c.salario* 0.1)) AS salario_total -- 10% de benefícios
FROM 
	funcionarios AS f
LEFT JOIN 
	departamentos AS d ON f.id_departamento = d.id_departamento 
LEFT JOIN 
	funcionarios AS g ON d.id_gerente = g.id_funcionario 
LEFT JOIN 
	cargos AS c ON f.id_cargo = c.id_cargo
LEFT JOIN 
	localizacoes AS l ON f.id_localizacao = l.id_localizacao; 