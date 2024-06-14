use mysql;
-- A continuacion se crean  los 2 usuarios de acuerso a lo solicitado--
create user if not exists 'atejeda.natam'@'localhost' IDENTIFIED by 'abc123';
create user if not exists 'srosales.natam'@'localhost' IDENTIFIED by 'def456';
-- Al usuario atejeda se le da solo el permiso de lectura --
Grant select on natam.* to 'atejeda.natam'@'localhost';

--  El usuario  srosales tendra solo  permisos de lectura de insersion y actualizacion --
GRANT SELECT, INSERT, UPDATE ON natam.* TO 'srosales.natam'@'localhost';




