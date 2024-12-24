/* 
   Este script realiza operações transacionais no banco de dados `dundler_mifflin_rh`
   utilizando duas tabelas: `funcionarios` e `contatos`.
   As operações incluem transações com exclusão e inserção de registros, savepoints,
   rollback e commit.
*/

/* 
   Mudanças na Tabela `funcionarios`
 */

-- Iniciar uma transação
START TRANSACTION;

-- 1. Eliminar registros na tabela `funcionarios` e realizando o ROLLBACK para reverter a exclusão
DELETE FROM funcionarios WHERE id_funcionario = 2;
DELETE FROM funcionarios WHERE id_funcionario = 3;

SELECT * FROM funcionarios; -- Validação dos Registros Eliminados

ROLLBACK; -- Reverter a exclusão (descomente para testar a reversão)

-- Iniciar uma transação
START TRANSACTION;

-- 1.1 Eliminar registros na tabela `funcionarios` e realizando o COMMIT para confirmar a exclusão
DELETE FROM funcionarios WHERE id_funcionario = 2;
DELETE FROM funcionarios WHERE id_funcionario = 3;

COMMIT; -- Confirmar as alterações (COMMIT);

SELECT * FROM funcionarios; -- Validação do COMMIT;

-- Reinserir registros eliminados
INSERT INTO funcionarios (id_funcionario, nome, data_nascimento, id_departamento, id_cargo, id_localizacao)
VALUES (2, 'Dwight Schrute', '1978-01-20', 1, 2, 1),
       (3, 'Jim Halpert', '1980-10-01', 1, 3, 1);

SELECT * FROM funcionarios; -- Validação do Reinserção

/* 
   Mudanças na Tabela `contatos`
*/

-- Iniciar uma nova transação
START TRANSACTION;

-- 1. Inserir 8 novos registros na tabela `contatos`
INSERT INTO contatos (id_funcionario, tipo_contato, valor_contato) VALUES
(1, 'Telefone', '555-9999'),
(1, 'E-mail', 'michael.updated@dundermifflin.com'),
(2, 'Telefone', '555-1111'),
(2, 'E-mail', 'dwight.updated@dundermifflin.com');

-- Criar o primeiro savepoint após 4 registros
SAVEPOINT savepoint_4;

-- Inserir mais 4 registros
INSERT INTO contatos (id_funcionario, tipo_contato, valor_contato) VALUES

(3, 'Telefone', '555-2222'),
(3, 'E-mail', 'jim.updated@dundermifflin.com'),
(4, 'Telefone', '555-3333'),
(4, 'E-mail', 'pam.updated@dundermifflin.com');

-- Criar o segundo savepoint após 8 registros
SAVEPOINT savepoint_8;

-- RELEASE SAVEPOINT savepoint_4; -- Linha comentada a setença de eliminação do savepoint dos primeiros 4 registros inseridos.

-- Confirmar as alterações
COMMIT;

