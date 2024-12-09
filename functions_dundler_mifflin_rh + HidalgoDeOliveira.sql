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
