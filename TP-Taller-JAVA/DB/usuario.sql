drop user if exists 'mecanico'@'%';
create user 'mecanico'@'%' identified by 'contrasenia';
GRANT SELECT, INSERT, UPDATE, DELETE ON taller.* TO 'mecanico'@'%';