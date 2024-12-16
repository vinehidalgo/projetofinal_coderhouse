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

