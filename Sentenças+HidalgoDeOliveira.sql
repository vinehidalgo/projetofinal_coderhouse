/* 
   Este script cria dois usuários no banco de dados `dundler_mifflin_rh`
   e concede permissões específicas:
   1. O primeiro usuário rh_user terá apenas permissões de leitura.
   2. O segundo usuário  gerente_user terá permissões de leitura, inserção e modificação.
   Ambos os usuários NÃO terão permissão para excluir registros.
*/

/* Criar usuário com permissões específicas */
CREATE USER 'rh_user'@'localhost' IDENTIFIED BY 'rh_123';
CREATE USER 'gerente_user'@'localhost' IDENTIFIED BY 'gerente_123';

/* Conceder permissões ao usuário 'rh_user' (somente leitura) */
GRANT SELECT ON dundler_mifflin_rh.* TO 'rh_user'@'localhost';

/* Conceder permissões ao usuário 'gerente_user' (leitura, inserção, modificação, sem exclusão) */
GRANT SELECT, INSERT, UPDATE ON dundler_mifflin_rh.* TO 'gerente_user'@'localhost';

/* Aplicar mudanças nas permissões */
FLUSH PRIVILEGES;

/* Verificar permissões concedidas */
SHOW GRANTS FOR 'rh_user'@'localhost';
SHOW GRANTS FOR 'gerente_user'@'localhost';


