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
