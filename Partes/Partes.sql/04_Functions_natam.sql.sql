use natam;

-- FUNCIONES : 
-- Cuantos pasajeros son mayores de 18 años --

 DROP FUNCTION IF EXISTS mayores_18;
DELIMITER $$ 
CREATE FUNCTION mayores_18 (  p_birthdate date ) 
RETURNS boolean
DETERMINISTIC
BEGIN 
DECLARE v_mayores_18  boolean;
-- SQL 
select p_birthdate <= DATE_SUB(CURDATE(), INTERVAL 18 YEAR) As mayores_18
into v_mayores_18;
RETURN v_mayores_18;
END$$ 
DELIMITER ;

select first_name, last_name,mayores_18(birthdate) from passenger  as mayores_18 ;

  select *
  from passenger;
  

-- Date_Sub= me resta, CURDATE() = devuelve la fecha actual, ,INTERVAL 18 YEAR  = el intervalo de tiempo que es 18.

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

