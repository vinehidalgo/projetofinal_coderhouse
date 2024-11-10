/* Criação do Banco de Dados para o Sistema de RH da empresa Dundler Mifflin 

	Esse Banco de dados tem por objetivo o armazenamento e a manutenção dos dados dos funcionários da empresa Dundler Mifflin
    que será utilizado pelo departamento de Recursos Humanos da referida empresa.
    
    Desenvolvimento em 09 de novembro, 2024 - Versão 1.0 */ 

-- Criação do banco de dados para o sistema de RH:
    
CREATE DATABASE dundler_mifflin_rh;
USE dundler_mifflin_rh;

/* Criação das tabelas que estarão no banco de dados dundler_mifflin_rh 

As tabelas que estarão neste banco de dados são:

1. Funcionários: armazena as informações sobre os funcionários da empresa, incluindo dados como nome, data de nascimento, departamento,
cargo e localização do escritório.
2. Departamento: armazena os dados sobre os departamentos da empresa, como vendas e contabilidade, incluindo o gerente responsável por
cada departamento.
3. Cargo: define os diferentes cargos ocupados pelos funcionários, como Vendedor ou Gerente Regional, além de registrar o salário de cada
cargo.
4. Localização: representa as diferentes localizações físicas dos escritórios, como a filial de Scranton, incluindo a cidade e o endereço
completo.
5. Contato: armazena as informações de contato dos funcionários, incluindo o tipo de contato (telefone, e-mail) e o valor específico de cada
contato (número de telefone, endereço de e-mail).

*/ 

-- Tabela `departamentos`: Armazena as informações dos departamentos da empresa, 
-- incluindo o nome do departamento. A referência ao gerente será adicionada posteriormente.
CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único do departamento
    nome_departamento VARCHAR(100) NOT NULL         -- Nome do departamento, ex: Vendas, Contabilidade
);

/* Nota: id_gerente será adicionado posteriormente como uma chave estrangeira para funcionarios(id_funcionario). */

-- Tabela `cargos`: Define os diferentes cargos disponíveis na empresa,
-- como Vendedor ou Gerente Regional, e o salário associado a cada cargo.
CREATE TABLE cargos (
    id_cargo INT PRIMARY KEY AUTO_INCREMENT,   -- Identificador único do cargo
    titulo_cargo VARCHAR(100) NOT NULL,        -- Título ou nome do cargo, ex: Gerente Regional
    salario DECIMAL(10, 2) NOT NULL            -- Salário associado ao cargo
);

-- Tabela `localizacoes`: Representa as diferentes localizações dos escritórios da empresa, 
-- como o escritório principal em Scranton, incluindo a cidade e o endereço completo.
CREATE TABLE localizacoes (
    id_localizacao INT PRIMARY KEY AUTO_INCREMENT,  -- Identificador único da localização
    cidade VARCHAR(100) NOT NULL,                   -- Nome da cidade onde está o escritório
    endereco VARCHAR(255) NOT NULL                  -- Endereço completo do escritório
);

-- Tabela `funcionarios`: Armazena as informações dos funcionários da empresa,
-- incluindo o nome, data de nascimento, departamento, cargo e localização onde trabalham.
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,  -- Identificador único do funcionário
    nome VARCHAR(100) NOT NULL,                     -- Nome completo do funcionário
    data_nascimento DATE,                           -- Data de nascimento do funcionário
    id_departamento INT,                            -- Departamento ao qual o funcionário pertence (chave estrangeira)
    id_cargo INT,                                   -- Cargo que o funcionário ocupa (chave estrangeira)
    id_localizacao INT,                             -- Localização onde o funcionário trabalha (chave estrangeira)
    CONSTRAINT fk_funcionarios_departamento FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento) ON DELETE SET NULL,
    CONSTRAINT fk_funcionarios_cargo FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo) ON DELETE SET NULL,
    CONSTRAINT fk_funcionarios_localizacao FOREIGN KEY (id_localizacao) REFERENCES localizacoes(id_localizacao) ON DELETE SET NULL
);

-- Tabela `contatos`: Armazena os dados de contato dos funcionários, como e-mails e telefones.
-- Cada contato está associado a um funcionário específico.
CREATE TABLE contatos (
    id_contato INT PRIMARY KEY AUTO_INCREMENT,   -- Identificador único do contato
    id_funcionario INT NOT NULL,                 -- Identificador do funcionário associado ao contato (chave estrangeira)
    tipo_contato VARCHAR(50) NOT NULL,           -- Tipo de contato, ex: Telefone ou E-mail
    valor_contato VARCHAR(100) NOT NULL,         -- Valor do contato, ex: número de telefone ou e-mail
    CONSTRAINT fk_contatos_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario) ON DELETE CASCADE
);

/* Após a criação de todas as tabelas, é necessário adicionar a chave estrangeira id_gerente na tabela departamentos
para fazer referência à tabela funcionarios

*/ 

-- Adiciona a coluna `id_gerente` e a restrição de chave estrangeira para `id_gerente` em `departamentos`,
-- permitindo que cada departamento tenha um gerente específico.
ALTER TABLE departamentos
ADD COLUMN id_gerente INT,
ADD CONSTRAINT fk_departamentos_gerente
FOREIGN KEY (id_gerente) REFERENCES funcionarios(id_funcionario) ON DELETE SET NULL;

/*
Explicação Geral dos Relacionamentos e Regras
ON DELETE SET NULL: Para as chaves estrangeiras id_departamento, id_cargo, id_localizacao e id_gerente, 
'ON DELETE SET NULL' é usado para definir o valor como NULL quando o registro referenciado for excluído,
garantindo a integridade dos dados.

ON DELETE CASCADE: Na chave estrangeira id_funcionario em contatos, ON DELETE CASCADE é usado para que todos os contatos
de um funcionário sejam automaticamente excluídos se o funcionário for removido.

*/ 
