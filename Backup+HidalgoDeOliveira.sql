/*
   Nome do Arquivo: Backup+HidalgoDeOliveira.sql
   Descrição: Este arquivo contém o backup de dados do banco de dados `dundler_mifflin_rh`.
   Ele inclui apenas os dados de todas as tabelas.

   Tabelas Incluídas no Backup:
   1. departamentos: Dados dos departamentos da empresa.
   2. cargos: Informações sobre cargos e salários.
   3. localizacoes: Localizações dos escritórios.
   4. funcionarios: Dados dos funcionários, incluindo departamento, cargo e localização.
   5. contatos: Informações de contato (telefone e e-mail) de cada funcionário.
*/

/* 
   Dados da Tabela `departamentos`
*/

INSERT INTO departamentos (id_departamento, nome_departamento) VALUES
(1, 'Vendas'),
(2, 'Contabilidade'),
(3, 'Recursos Humanos'),
(4, 'Suporte Técnico'),
(5, 'Logística'),
(6, 'Marketing'),
(7, 'Operações');

/* 
   Dados da Tabela `cargos`
*/
INSERT INTO cargos (id_cargo, titulo_cargo, salario) VALUES
(1, 'Gerente Regional', 6000.00),
(2, 'Assistente Regional', 3500.00),
(3, 'Vendedor', 3000.00),
(4, 'Contador', 4000.00),
(5, 'Especialista de TI', 4500.00),
(6, 'Especialista em Logística', 3500.00),
(7, 'Analista de Marketing', 4000.00),
(8, 'Analista de Operações', 4200.00);

/* 
   Dados da Tabela `localizacoes`
*/
INSERT INTO localizacoes (id_localizacao, cidade, endereco) VALUES
(1, 'Scranton', '1725 Slough Avenue'),
(2, 'Stamford', '123 Elm Street'),
(3, 'Buffalo', '45 Maple Road'),
(4, 'Utica', '67 Birch Lane'),
(5, 'Nashua', '12 Pine Street'),
(6, 'Rochester', '89 Oak Boulevard');

/* 
   Dados da Tabela `funcionarios`
*/
INSERT INTO funcionarios (id_funcionario, nome, data_nascimento, id_departamento, id_cargo, id_localizacao) VALUES
(1, 'Michael Scott', '1964-03-15', 1, 1, 1),
(2, 'Dwight Schrute', '1978-01-20', 1, 2, 1),
(3, 'Jim Halpert', '1980-10-01', 1, 3, 1),
(4, 'Pam Beesly', '1979-03-25', 1, 3, 1),
(5, 'Angela Martin', '1971-11-11', 2, 4, 1),
(6, 'Oscar Martinez', '1975-07-25', 2, 4, 1),
(7, 'Kevin Malone', '1970-05-01', 2, 4, 1),
(8, 'Toby Flenderson', '1969-02-22', 3, 5, 1),
(9, 'Andy Bernard', '1973-08-22', 1, 3, 2),
(10, 'Karen Filippelli', '1978-11-10', 1, 3, 2),
(11, 'Stanley Hudson', '1958-08-14', 1, 3, 1),
(12, 'Ryan Howard', '1985-01-10', 6, 7, 1),
(13, 'Kelly Kapoor', '1980-02-05', 6, 7, 1),
(14, 'Creed Bratton', '1943-11-01', 4, 5, 1),
(15, 'Meredith Palmer', '1970-12-15', 5, 6, 1),
(16, 'Holly Flax', '1971-10-15', 3, 8, 4),
(17, 'Jan Levinson', '1965-02-20', 7, 8, 1);

/*
   Dados da Tabela `contatos`
*/
INSERT INTO contatos (id_contato, id_funcionario, tipo_contato, valor_contato) VALUES
(1, 1, 'Telefone', '555-1234'),
(2, 1, 'E-mail', 'michael@dundermifflin.com'),
(3, 2, 'Telefone', '555-5678'),
(4, 2, 'E-mail', 'dwight@dundermifflin.com'),
(5, 3, 'Telefone', '555-8765'),
(6, 3, 'E-mail', 'jim@dundermifflin.com'),
(7, 4, 'Telefone', '555-4321'),
(8, 4, 'E-mail', 'pam@dundermifflin.com'),
(9, 5, 'Telefone', '555-3456'),
(10, 5, 'E-mail', 'angela@dundermifflin.com'),
(11, 6, 'Telefone', '555-7890'),
(12, 6, 'E-mail', 'oscar@dundermifflin.com'),
(13, 7, 'Telefone', '555-4567'),
(14, 7, 'E-mail', 'kevin@dundermifflin.com'),
(15, 8, 'Telefone', '555-6543'),
(16, 8, 'E-mail', 'toby@dundermifflin.com'),
(17, 9, 'Telefone', '555-2222'),
(18, 9, 'E-mail', 'andy@dundermifflin.com'),
(19, 10, 'Telefone', '555-3333'),
(20, 10, 'E-mail', 'karen@dundermifflin.com'),
(21, 11, 'Telefone', '555-4444'),
(22, 11, 'E-mail', 'stanley@dundermifflin.com'),
(23, 12, 'Telefone', '555-5555'),
(24, 12, 'E-mail', 'ryan@dundermifflin.com'),
(25, 13, 'Telefone', '555-6666'),
(26, 13, 'E-mail', 'kelly@dundermifflin.com'),
(27, 14, 'Telefone', '555-7777'),
(28, 14, 'E-mail', 'creed@dundermifflin.com'),
(29, 15, 'Telefone', '555-8888'),
(30, 15, 'E-mail', 'meredith@dundermifflin.com'),
(31, 16, 'Telefone', '555-9999'),
(32, 16, 'E-mail', 'holly@dundermifflin.com'),
(33, 17, 'Telefone', '555-0000'),
(34, 17, 'E-mail', 'jan@dundermifflin.com');


/*  Para restaurar o backup no banco de dados, execute o seguinte comando no MySQL Workbench ou outro cliente SQL: */ 

SOURCE -- caminho/do/arquivo/Backup+HidalgoDeOLiveira.sql;