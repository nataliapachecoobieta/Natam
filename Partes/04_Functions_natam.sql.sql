use natam;

-- FUNCIONES : 
DROP FUNCTION IF EXISTS tiene_al_menos_x_anos;
DELIMITER $$ 
CREATE FUNCTION tiene_al_menos_x_anos (p_birthdate DATE, p_age INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN 
    DECLARE v_tiene_al_menos_x_anos BOOLEAN;
    
    -- Asignar el valor booleano a la variable usando SET
    SET v_tiene_al_menos_x_anos = (p_birthdate <= DATE_SUB(CURDATE(), INTERVAL p_age YEAR));
    
    RETURN v_tiene_al_menos_x_anos;
END$$ 
DELIMITER ;


SELECT tiene_al_menos_x_anos('1995-01-01', 18) as resultado;


 

-- concatename los datos de flight --
DELIMITER $$
CREATE FUNCTION last_flight (p_passenger_id INT) 
RETURNS VARCHAR(255)
DETERMINISTIC 
BEGIN
    DECLARE v_last_flight VARCHAR(255);
    SELECT CONCAT('Flight Number: ', ft.flight_number, ', Date: ', f.date_flight, ', Captain: ', f.name_capitan, ' ', f.last_name_capitan)  
    into v_last_flight
    FROM flight_ticket ft
    INNER JOIN flight f ON ft.flight_number = f.id_flight
    WHERE ft.id_passenger = p_passenger_id
    ORDER BY f.date_flight DESC
    LIMIT 1;

    RETURN v_last_flight;
END$$

DELIMITER ;

select * from flight_ticket ft
INNER JOIN flight f ON ft.flight_number = f.id_flight;



-- El numero de pasajero mayor a 90 --
DROP FUNCTION IF EXISTS vuelo_sobre_90 ;

DELIMITER $$ 
CREATE FUNCTION vuelo_sobre_90(p_cantidad int) 
RETURNS boolean
DETERMINISTIC 
BEGIN 
DECLARE V_RESULTADO  boolean;
-- SQL 
select (p_cantidad * 90)>90 
INTO V_RESULTADO;
RETURN V_RESULTADO;
END$$ 
DELIMITER ;

select id_flight,vuelo_sobre_90(passengers_numbers) as es_sobre_90 from flight;

