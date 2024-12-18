/* Script para a Inserção de Dados na base de dados: dundler_mifflin_rh */

USE dundler_mifflin_rh;

-- Departamentos da empresa
INSERT INTO departamentos (nome_departamento) VALUES
('Vendas'),           -- Departamento de vendas
('Contabilidade'),    -- Departamento de contabilidade
('Recursos Humanos'), -- Departamento de RH
('Suporte Técnico'),  -- Departamento de TI
('Logística'),        -- Departamento de logística
('Marketing'),        -- Departamento de marketing
('Operações');        -- Departamento de operações

-- Cargos disponíveis na empresa
INSERT INTO cargos (titulo_cargo, salario) VALUES
('Gerente Regional', 6000.00),     -- Cargo de gerente
('Assistente Regional', 3500.00),  -- Assistente regional
('Vendedor', 3000.00),             -- Cargo de vendedor
('Contador', 4000.00),             -- Cargo de contador
('Especialista de TI', 4500.00),   -- Especialista em TI
('Especialista em Logística', 3500.00), -- Especialista em logística
('Analista de Marketing', 4000.00),    -- Analista de marketing
('Analista de Operações', 4200.00);    -- Analista de operações

-- Localizações dos escritórios
INSERT INTO localizacoes (cidade, endereco) VALUES
('Scranton', '1725 Slough Avenue'),  -- Escritório principal
('Stamford', '123 Elm Street'),      -- Filial Stamford
('Buffalo', '45 Maple Road'),        -- Filial Buffalo
('Utica', '67 Birch Lane'),          -- Filial Utica
('Nashua', '12 Pine Street'),        -- Filial Nashua
('Rochester', '89 Oak Boulevard');   -- Filial Rochester

-- Funcionários da empresa
INSERT INTO funcionarios (nome, data_nascimento, id_departamento, id_cargo, id_localizacao) VALUES
('Michael Scott', '1964-03-15', 1, 1, 1),  -- Gerente de Vendas em Scranton
('Dwight Schrute', '1978-01-20', 1, 2, 1), -- Assistente Regional de Vendas em Scranton
('Jim Halpert', '1980-10-01', 1, 3, 1),    -- Vendedor de Vendas em Scranton
('Pam Beesly', '1979-03-25', 1, 3, 1),     -- Vendedora de Vendas em Scranton
('Angela Martin', '1971-11-11', 2, 4, 1),  -- Contadora em Contabilidade, Scranton
('Oscar Martinez', '1975-07-25', 2, 4, 1), -- Contador em Contabilidade, Scranton
('Kevin Malone', '1970-05-01', 2, 4, 1),   -- Contador em Contabilidade, Scranton
('Toby Flenderson', '1969-02-22', 3, 5, 1),-- Especialista de RH em Scranton
('Andy Bernard', '1973-08-22', 1, 3, 2),   -- Vendedor em Vendas, Stamford
('Karen Filippelli', '1978-11-10', 1, 3, 2),-- Vendedora em Vendas, Stamford
('Stanley Hudson', '1958-08-14', 1, 3, 1), -- Vendedor em Vendas, Scranton
('Ryan Howard', '1985-01-10', 6, 7, 1),    -- Analista de Marketing em Scranton
('Kelly Kapoor', '1980-02-05', 6, 7, 1),   -- Analista de Marketing em Scranton
('Creed Bratton', '1943-11-01', 4, 5, 1),  -- Especialista de TI, Scranton
('Meredith Palmer', '1970-12-15', 5, 6, 1),-- Especialista em Logística, Scranton
('Holly Flax', '1971-10-15', 3, 8, 4),     -- Analista de Operações, Utica
('Jan Levinson', '1965-02-20', 7, 8, 1);   -- Analista de Operações, Scranton

-- Contatos dos funcionários
INSERT INTO contatos (id_funcionario, tipo_contato, valor_contato) VALUES
(1, 'Telefone', '555-1234'),       -- Michael Scott
(1, 'E-mail', 'michael@dundermifflin.com'),
(2, 'Telefone', '555-5678'),       -- Dwight Schrute
(2, 'E-mail', 'dwight@dundermifflin.com'),
(3, 'Telefone', '555-8765'),       -- Jim Halpert
(3, 'E-mail', 'jim@dundermifflin.com'),
(4, 'Telefone', '555-4321'),       -- Pam Beesly
(4, 'E-mail', 'pam@dundermifflin.com'),
(5, 'Telefone', '555-3456'),       -- Angela Martin
(5, 'E-mail', 'angela@dundermifflin.com'),
(6, 'Telefone', '555-7890'),       -- Oscar Martinez
(6, 'E-mail', 'oscar@dundermifflin.com'),
(7, 'Telefone', '555-4567'),       -- Kevin Malone
(7, 'E-mail', 'kevin@dundermifflin.com'),
(8, 'Telefone', '555-6543'),       -- Toby Flenderson
(8, 'E-mail', 'toby@dundermifflin.com'),
(9, 'Telefone', '555-2222'),       -- Andy Bernard
(9, 'E-mail', 'andy@dundermifflin.com'),
(10, 'Telefone', '555-3333'),      -- Karen Filippelli
(10, 'E-mail', 'karen@dundermifflin.com'),
(11, 'Telefone', '555-4444'),      -- Stanley Hudson
(11, 'E-mail', 'stanley@dundermifflin.com'),
(12, 'Telefone', '555-5555'),      -- Ryan Howard
(12, 'E-mail', 'ryan@dundermifflin.com'),
(13, 'Telefone', '555-6666'),      -- Kelly Kapoor
(13, 'E-mail', 'kelly@dundermifflin.com'),
(14, 'Telefone', '555-7777'),      -- Creed Bratton
(14, 'E-mail', 'creed@dundermifflin.com'),
(15, 'Telefone', '555-8888'),      -- Meredith Palmer
(15, 'E-mail', 'meredith@dundermifflin.com'),
(16, 'Telefone', '555-9999'),      -- Holly Flax
(16, 'E-mail', 'holly@dundermifflin.com'),
(17, 'Telefone', '555-0000'),      -- Jan Levinson
(17, 'E-mail', 'jan@dundermifflin.com');

-- Atribuindo gerentes aos departamentos
UPDATE departamentos SET id_gerente = 1 WHERE id_departamento = 1; -- Michael Scott (Vendas)
UPDATE departamentos SET id_gerente = 5 WHERE id_departamento = 2; -- Angela Martin (Contabilidade)
UPDATE departamentos SET id_gerente = 8 WHERE id_departamento = 3; -- Toby Flenderson (RH)
UPDATE departamentos SET id_gerente = 14 WHERE id_departamento = 4; -- Creed Bratton (TI)
UPDATE departamentos SET id_gerente = 15 WHERE id_departamento = 5; -- Meredith Palmer (Logística)
UPDATE departamentos SET id_gerente = 12 WHERE id_departamento = 6; -- Ryan Howard (Marketing)
UPDATE departamentos SET id_gerente = 17 WHERE id_departamento = 7; -- Jan Levinson (Operações)

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

/* Criação de Funções baseadas no DB dundler_mifflin_rh: Cálculo de Salário Total + Lista de Gerentes por Departamento

OBSERVAÇÃO: As funções abaixo listadas devem ser executadas em Scripts diferentes ou com uso do delimitador no MySQL Workbench. */

DELIMITER $$

-- Função: Cálculo do Salário Total
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_salario_total`(funcionario_id INT) 
RETURNS DECIMAL(10,2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE salario_base DECIMAL(10, 2);
    DECLARE salario_total DECIMAL(10, 2);

    -- Obter o salário base do funcionário
    SET salario_base = (
        SELECT c.salario
        FROM funcionarios f
        JOIN cargos c ON f.id_cargo = c.id_cargo
        WHERE f.id_funcionario = funcionario_id
        LIMIT 1
    );

    -- Calcular o salário total com um benefício de 15%
    SET salario_total = salario_base + (salario_base * 0.15);

    RETURN salario_total;
END$$

-- Função: Nome do Gerente por Departamento
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_nome_gerente_por_departamento`(departamento_id INT) 
RETURNS VARCHAR(100) CHARSET utf8mb4
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE nome_gerente VARCHAR(100);

    -- Define o valor da variável
    SET nome_gerente = (
        SELECT g.nome
        FROM departamentos d
        JOIN funcionarios g ON d.id_gerente = g.id_funcionario
        WHERE d.id_departamento = departamento_id
        LIMIT 1
    );

    RETURN nome_gerente;
END$$

DELIMITER ;

DELIMITER $$
-- Stored Procedure: Ordenar registros da tabela funcionarios
CREATE PROCEDURE sp_ordenar_funcionarios (
    IN campo_ordenacao VARCHAR(50),  -- Campo a ser ordenado
    IN ordem VARCHAR(10)            -- Ordem: 'ASC' ou 'DESC'
)
BEGIN
    -- Query dinâmica para ordenar com base nos parâmetros
    SET @sql_query = CONCAT(
        'SELECT id_funcionario, nome, data_nascimento, id_departamento, id_cargo, id_localizacao ',
        'FROM funcionarios ',
        'ORDER BY ', campo_ordenacao, ' ', ordem
    );

    -- Preparar e executar a query
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$
DELIMITER ;

/* Criação das Stored Procedure referente ao banco de dados dundler_mifflin_rh */ 

DELIMITER $$

-- Stored Procedure: Inserir ou eliminar registros na tabela funcionarios
CREATE PROCEDURE sp_gerenciar_funcionarios (
    IN acao VARCHAR(10),         -- Ação: 'INSERIR' ou 'ELIMINAR'
    IN id_funcionario INT,       -- ID do funcionário (para eliminar)
    IN nome_funcionario VARCHAR(100), -- Nome do funcionário (para inserir)
    IN data_nascimento DATE,     -- Data de nascimento
    IN id_departamento INT,      -- ID do departamento
    IN id_cargo INT,             -- ID do cargo
    IN id_localizacao INT        -- ID da localização
)
BEGIN
    IF acao = 'INSERIR' THEN
        -- Inserir um novo registro na tabela funcionarios
        INSERT INTO funcionarios (nome, data_nascimento, id_departamento, id_cargo, id_localizacao)
        VALUES (nome_funcionario, data_nascimento, id_departamento, id_cargo, id_localizacao);
    ELSEIF acao = 'ELIMINAR' THEN
        -- Eliminar um registro específico pelo ID
        DELETE FROM funcionarios WHERE id_funcionario = id_funcionario;
    ELSE
        -- Caso a ação não seja válida
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ação inválida. Use INSERIR ou ELIMINAR.';
    END IF;
END $$

DELIMITER ;

/* Criação da Tabela de Log e dos Triggers */

-- Tabela para armazenar logs das operações
CREATE TABLE log_operacoes (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    tabela_afetada VARCHAR(50) NOT NULL,     -- Nome da tabela que sofreu a operação
    operacao VARCHAR(50) NOT NULL,           -- Tipo de operação: INSERT, UPDATE, DELETE
    usuario VARCHAR(100) NOT NULL,           -- Usuário que realizou a operação
    data_operacao DATE NOT NULL,             -- Data da operação
    hora_operacao TIME NOT NULL,             -- Hora da operação
    detalhes VARCHAR(255)                    -- Detalhes específicos da operação
);

/* Triggers na Tabela funcionarios
Trigger BEFORE INSERT: Antes de inserir um funcionário, registra a operação */ 

DELIMITER $$
CREATE TRIGGER before_insert_funcionarios
BEFORE INSERT ON funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO log_operacoes (
        tabela_afetada, operacao, usuario, data_operacao, hora_operacao, detalhes
    ) VALUES (
        'funcionarios', 'INSERT', USER(), CURDATE(), CURTIME(), 
        CONCAT('Inserção de funcionário: ', NEW.nome)
    );
END $$
DELIMITER ;

/* Triggers na Tabela funcionarios
Trigger AFTER DELETE: Após deletar um funcionário, registra a operação. */ 

DELIMITER $$

CREATE TRIGGER after_delete_funcionarios
AFTER DELETE ON funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO log_operacoes (
        tabela_afetada, operacao, usuario, data_operacao, hora_operacao, detalhes
    ) VALUES (
        'funcionarios', 'DELETE', USER(), CURDATE(), CURTIME(), 
        CONCAT('Exclusão do funcionário ID: ', OLD.id_funcionario, ', Nome: ', OLD.nome)
    );
END $$

DELIMITER ;

/* Triggers na Tabela contatos
Trigger BEFORE UPDATE: Antes de atualizar um contato, registra a operação. */

DELIMITER $$

CREATE TRIGGER before_update_contatos
BEFORE UPDATE ON contatos
FOR EACH ROW
BEGIN
    INSERT INTO log_operacoes (
        tabela_afetada, operacao, usuario, data_operacao, hora_operacao, detalhes
    ) VALUES (
        'contatos', 'UPDATE', USER(), CURDATE(), CURTIME(), 
        CONCAT('Atualização de contato ID: ', OLD.id_contato, 
               ' | Tipo: ', OLD.tipo_contato, ' -> ', NEW.tipo_contato,
               ' | Valor: ', OLD.valor_contato, ' -> ', NEW.valor_contato)
    );
END $$

DELIMITER ;

/* Triggers na Tabela contatos
Trigger AFTER INSERT: Após inserir um contato, registra a operação. */

DELIMITER $$

CREATE TRIGGER after_insert_contatos
AFTER INSERT ON contatos
FOR EACH ROW
BEGIN
    INSERT INTO log_operacoes (
        tabela_afetada, operacao, usuario, data_operacao, hora_operacao, detalhes
    ) VALUES (
        'contatos', 'INSERT', USER(), CURDATE(), CURTIME(), 
        CONCAT('Novo contato inserido: ID Funcionário: ', NEW.id_funcionario, 
               ', Tipo: ', NEW.tipo_contato, ', Valor: ', NEW.valor_contato)
    );
END $$

DELIMITER ;