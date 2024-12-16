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
