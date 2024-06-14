use natam;
-- PROCEDURE-- 
-- Obtener info.del pasajero
DROP PROCEDURE IF EXISTS SP_obtener_informacion_pasajero;

DELIMITER //

CREATE PROCEDURE SP_obtener_informacion_pasajero( in id_pasajero INT)
BEGIN
    DECLARE rut_pasajero INT;
    DECLARE primer_nombre VARCHAR(20);
    DECLARE apellido VARCHAR(20);
    DECLARE numero_telefono VARCHAR(15);
    DECLARE correo_electronico VARCHAR(35);
    DECLARE fecha_nacimiento DATE;

    SELECT rut_passenger, first_name, last_name, phone_number, email, birthdate
    INTO rut_pasajero, primer_nombre, apellido, numero_telefono, correo_electronico, fecha_nacimiento
    FROM passenger
    WHERE id_passenger = id_pasajero
    ORDER BY id_passenger DESC;
    
END//

DELIMITER ;


call  SP_obtener_informacion_pasajero(1);

DELIMITER //



drop procedure  SP_insertar_y_eliminar_tripulante;
DELIMITER //

CREATE PROCEDURE SP_insertar_y_eliminar_tripulante(
    -- IN id_crew int -- este parametro es autoincremental no se debe poner ya que si tiene esta condicion el sistema  va hacerlo entonces se omite , si este no tiene esta condision se debe poner como parametro --
    IN id_flight varchar (20),
    IN rut_tripulante VARCHAR(30),
    IN primer_nombre VARCHAR(30),
    IN apellido VARCHAR(30),
    IN numero_telefono VARCHAR(20),
    IN correo_electronico VARCHAR(30),
    IN fecha_nacimiento DATE,
    IN eliminar_tripulante BOOLEAN
)
BEGIN
    -- Variable para almacenar el ID del nuevo miembro de la tripulación de vuelo
    DECLARE new_crew_id INT;

    -- Insertar el nuevo miembro de la tripulación de vuelo
    INSERT INTO flight_crew (id_flight, rut_crew, first_name, last_name, Phone_number, email, birthday)
    VALUES (id_flight, rut_tripulante, primer_nombre, apellido, numero_telefono, correo_electronico, fecha_nacimiento);

    -- Obtener el ID del miembro de la tripulación de vuelo recién insertado
    SELECT id_crew INTO new_crew_id
    FROM flight_crew 
    WHERE rut_crew = rut_tripulante AND id_flight = id_flight
    ORDER BY id_crew DESC 
    LIMIT 1;
    
    -- Verificar si se solicita eliminar al miembro de la tripulación de vuelo
    IF eliminar_tripulante THEN
        -- Eliminar al miembro de la tripulación de vuelo recién insertado
        DELETE FROM flight_crew 
        WHERE id_crew = new_crew_id;
    END IF;
END//

DELIMITER ;

-- Aca es donde tienes que insertar o eliminar, como siempre --
CALL SP_insertar_y_eliminar_tripulante(
    'FL101',
    '123456789',
    'Juan',
    'Pérez',
    '123456789',
    'juan@example.com',
    '1990-01-01',
    0
);
