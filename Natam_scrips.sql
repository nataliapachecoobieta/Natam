DROP SCHEMA  IF  EXISTS    natam ;
CREATE SCHEMA IF NOT EXISTS  natam;
USE natam ;

Create Table if not exists passenger(
id_passenger int not null ,
rut_passenger int not null,
first_name Varchar (20) not null,
last_name Varchar (20) not null,
phone_number varchar (15) not null,
email Varchar (35) not null,
birthdate date,
primary key (id_passenger));


create table if not exists flight_ticket(
id_ticket int not null ,
id_passenger int not null,
flight_number varchar (10)not null,
first_name Varchar (20)not null, 
last_name Varchar (20) not null,
gate_number Varchar (10) not null,
class_code varchar (10) not null,
seat_number varchar(10) not null, 
date_flight date not null,
primary key (id_ticket)
);


create table if not exists luggage (
id_luggage int not null ,
flight_number varchar (20) not null,
id_passenger int not null,
first_name Varchar (20) not null,
last_name Varchar (20) not null,
weight int not null,
primary key (id_luggage)
);

 
create Table if not exists flight (
id_flight varchar (10) not null,
origen varchar(20)not null,
destination  varchar (20)not null,
passengers_numbers int not null,
name_capitan varchar (20)not null,
last_name_capitan varchar (20)not null,
date_flight date not null,
primary key (id_flight, date_flight));
ALTER TABLE flight ADD INDEX idx_date_flight (date_flight);


Create Table if not exists airport(
id_flight varchar (10) not null,
id_airline int not null ,
id_Airport Varchar (10) not null,
name_city varchar (20)not null ,
country varchar (20)not null ,
primary key (id_Airport) 
);


Create  Table  if not exists airline  (
id_airline int not null auto_increment,
id_crew int not null,
primary key (id_airline)
);


Create Table  flight_crew(
id_crew int not null Auto_Increment,
id_flight varchar(10) not null,
rut_crew varchar (30) not null,
first_name Varchar (30) not null,
last_name Varchar (30) not null,
Phone_number varchar (20) not null,
email Varchar (30) not null,
birthday date,
primary key (id_crew)
);


create Table if not exists flight_passenger (
id_flight varchar (10) not null,
date_flight date not null,
id_passenger int not null ,
primary key (id_flight,date_flight,id_passenger)
);


Create Table aircraft (
id_flight varchar(10) not null,
model varchar (15)not null,
id_plate varchar (15) not null,
flight_hours int not null,
primary key (id_plate)
);

Alter Table flight_ticket add constraint  FK_1_flight_ticket foreign key (id_passenger) references passenger(id_passenger);
Alter Table flight_ticket add constraint  FK_2_flight_ticket foreign key (flight_number) references flight(id_flight);
Alter Table luggage add constraint FK_luggage foreign key (id_passenger) references passenger(id_passenger);
Alter Table airport add constraint FK_airport1 foreign key (id_flight) references Flight(id_flight);
Alter Table airport add constraint FK_airport2 foreign key (id_airline) references Airline (id_airline);
Alter Table flight_crew add constraint FK_flight_crew foreign key (id_flight) references flight(id_flight);
Alter table airline add constraint FK_airline foreign key (id_crew) references Flight_crew (id_crew);
Alter table aircraft add constraint FK_aircraft foreign key (id_flight) references flight(id_flight);
Alter Table flight_passenger add constraint  FK_flight_passenger foreign key (id_flight) references flight (id_flight);
Alter Table flight_passenger add constraint  FK_1_flight_passenger foreign key (date_flight) references flight(date_flight);
Alter Table flight_passenger add constraint  FK_2_flight_passenger foreign key (id_passenger) references passenger(id_passenger);
ALTER TABLE luggage ADD CONSTRAINT FK_luggage_passenger FOREIGN KEY (id_passenger) REFERENCES passenger(id_passenger);


-- --------------------------------------------------------------------------------------

Insert into  luggage (id_luggage,flight_number,id_passenger,first_name, last_name,weight) Values 
(1, 'FL123', 1, ',Maria', 'Pinto',23),
(2, 'FL456', 2, 'Luis','Sanchez',19),
(3, 'FL789', 3, 'Paula', 'Jaraquemada',16),
(4, 'FL101', 4, 'Manuel', 'Rojas',20),
(5, 'FL222', 5, 'Carmen', 'Sanchez',15),
(6, 'FL333', 6, 'Ignacia', 'Soto',10),
(7, 'FL444', 7, 'Carla', 'Romero',20),
(8, 'FL555', 8, 'Marta', 'Jimenez',18),
(9, 'FL656', 9, 'Luca', 'Gonzalez',23),
(10, 'FL777', 10, 'Cecilia ', 'Perez',20),
(11, 'FL888', 11, 'Jose', 'pineda',16),
(12, 'FL999', 12, 'sofia ', 'Vergara',17),
(13, 'FL111', 13, 'Vicente', 'Madreid',13),
(14, 'FL222', 14, 'Carlos', 'Ruiz',17),
(15, 'FL333', 15, 'Ines', 'Tejeda',20);




Insert into Airport (id_flight,id_airline ,id_Airport,name_city,country) Values

('FL123', 101, 501, 'Santiago', 'Chile'),
('FL456', 102, 502, 'Buenos Aires', 'Argentina'),
('FL789', 103, 503, 'Chicago', 'USA'),
('FL101', 104, 504, 'Miami', 'USA'),
('FL222', 105, 505, 'Rio de Janeiro', 'Brazil'),
('FL444', 106, 506, 'Paris ', 'Francia'),
('FL228', 107, 507, 'Denver', 'USA'),
('FL555', 108, 508, 'Puero Natales', 'Chile'),
('FL777', 109, 509, 'Calama ', 'Chile'),
('FL888', 110, 510, 'Antofagasta ', 'Chile'),
('FL999', 111, 511, 'New Orleans', 'USA'),
('FL111', 112, 512, 'Atlanta', 'USA'),
('FL232', 113, 513, 'Boston', 'USA'),
('FL881', 114, 514, 'Mendoza ', 'Argentina '),
('FL330', 115, 515, 'Caracas', 'Venezuela');



Insert into Airline (id_airline,id_crew ) Values

(101, 201),
(102, 202),
(103, 203),
(104, 204),
(105,205),
(106, 206),
(107, 207),
(108, 208),
(109, 209),
(110, 210),
(111, 211),
(112, 212),
(113, 213),
(114, 214),
(115, 215);



INSERT INTO Aircraft (id_flight, model, id_plate, flight_hours)
VALUES
('FL123', 'Boeing 737', 'ABC123', 5000),
('FL456', 'Airbus A320', 'DEF456', 6000),
('FL789', 'Boeing 747', 'GHI789', 7000),
('FL101', 'Airbus A330', 'JKL012', 5500),
('FL222' ,'Boeing 777', 'MNO345', 6500),
('FL444', 'Airbus A350', 'PQR678', 4800),
('FL228', 'Boeing 767', 'STU901', 5200),
('FL555', 'Airbus A380', 'VWX234', 6700),
('FL777', 'Boeing 787', 'YZA567', 6100),
('FL888', 'Airbus A310', 'BCD890', 5300),
('FL999', 'Boeing 737', 'EFG123', 5600),
('FL111', 'Airbus A320', 'HIJ456', 5900),
('FL232', 'Boeing 747', 'KLM789', 6800),
('FL281', 'Airbus A330', 'NOP012', 5400),
('FL330', 'Boeing 777', 'QRS345', 6300);



INSERT INTO flight_passenger ( id_flight,date_flight,id_passenger)
values

('FL123', '2023-02-02', 1),
('FL456', '2023-02-02', 2),
('FL789', '2023-02-02', 3),
('FL101', '2023-02-02', 4),
('FL222', '2023-02-02', 5),
('FL444', '2023-02-02', 6),
('FL228', '2023-02-02', 7),
('FL555', '2023-02-02', 8),
('FL777', '2023-02-02', 9),
('FL888', '2023-02-02', 10),
('FL999', '2023-02-02', 11),
('FL111', '2023-02-02', 12),
('FL232', '2023-02-02', 13),
('FL281', '2023-02-02', 14),
('FL330', '2023-02-02', 15);





 -- ------------------------------------- ---
-- VISTAS--
   -- Vista: necitamos que los  nombre y apellidos esten en mayuscula --
   
   drop VIEW  vw_mayusculas_nombre_apellido;
   
CREATE OR REPLACE VIEW  vw_mayusculas_nombre_apellido as
	Select UPPER(first_name) AS first_name_upper, UPPER(last_name) AS last_name_upper
		From passenger;

-- Vista: para obtener el pasajero más anciano:--
drop view vw_oldest_passsenger ;

CREATE OR REPLACE VIEW vw_oldest_passsenger  AS
	Select id_passenger, birthdate AS oldest_birthday
		From passenger
		Order by birthdate ASC
		Limit 1;

-- Vista: para obtener id_equipaje y nombre y apellido del vuelo  FL123 --
 drop VIEW vw_find_luggage ;
    CREATE OR REPLACE VIEW vw_find_luggage AS
		Select id_luggage,first_name , last_name  
			from  luggage join flight on id_passenger = id_passenger
			Where luggage.flight_number ='FL123'
			Limit 1;


-- Vista:  para obtener el número de boletos vendidos por pasajero del vuel FL789--
drop VIEW tickets_sale  ;
    CREATE OR REPLACE VIEW vw_tickets_sale AS
		Select (SELECT COUNT(*) FROM flight_ticket WHERE id_passenger = p.id_passenger) AS ticket_count 
			from passenger p 
			Where p.id_passenger IN (SELECT id_passenger FROM flight_ticket WHERE flight_number = 'FL789');


-- Vista:  para obtener el peso total del equipaje por vuelo --
drop VIEW vw_luggage_weight;
CREATE OR REPLACE VIEW vw_luggage_weight AS
Select flight_ticket.flight_number,
    (Select sum(luggage.weight) 
     From luggage 
     Where luggage.flight_number = flight_ticket.flight_number) AS peso
	 From flight_ticket;
     

    
-- Vista: para obtener los detalles del vuelo del crew john,Doe --
drop VIEW vw__vuelo_crew_Doe ;
 CREATE  OR REPLACE VIEW vw__vuelo_crew_Doe  AS 
	Select flight.id_flight, flight.origen, flight.destination, flight.passengers_numbers, flight_crew.first_name, flight_crew.last_name, flight.date_flight 
		FROM flight 
		JOIN flight_crew ON flight.id_flight = flight_crew.id_flight 
		WHERE flight_crew.first_name = 'John' AND flight_crew.last_name = 'Doe' 
		LIMIT 0, 10000;

 
 -- ------------------------------------- ---
 -- FUNCIONES : 
-- Cuantos pasajeros son mayores de 18 años --

 DROP FUNCTION IF EXISTS es_mayores_18;
DELIMITER $$ 
CREATE FUNCTION mayores_18 (  p_birthdate date ) 
RETURNS boolean
DETERMINISTIC
BEGIN 
DECLARE v_mayores_18  boolean;
-- SQL 
select p_birthdate <= DATE_SUB(CURDATE(), INTERVAL 18 YEAR) As mayores_18
from passenger
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


-- PROCEDURE-- 

DROP PROCEDURE IF EXISTS obtener_informacion_pasajero;

DELIMITER //

CREATE PROCEDURE pr_obtener_informacion_pasajero( in id_pasajero INT)
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


call  pr_obtener_informacion_pasajero(1);

DELIMITER //



drop procedure  pr_insertar_y_eliminar_tripulante;
DELIMITER //

CREATE PROCEDURE pr_insertar_y_eliminar_tripulante(
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
CALL pr_insertar_y_eliminar_tripulante(
    'FL101',
    '123456789',
    'Juan',
    'Pérez',
    '123456789',
    'juan@example.com',
    '1990-01-01',
    0
);

-- Triggers --
-- Para esta etapa ocupare las tablas Passenger y Flight_crew

drop table new_passenger;
create table new_passenger (
	id_passenger int not null ,
    camp_ant_camp_new varchar(100),
	rut_passenger int not null,
	first_name Varchar (20) not null,
	last_name Varchar (20) not null,
	phone_number varchar (15) not null,
	email Varchar (35) not null,
	birthdate date,
	first_date date,  
	last_date date,
	primary key (id_passenger));

drop table bkp_passenger;
create table bkp_passenger as
(select * from new_passenger where 1=1);

drop trigger tr_update_new_passenger;

create trigger tr_update_new_passenger
after update on natam.bkp_passenger 
for each row
insert into natam.new_passenger
values (
	new.id_passenger,
   concat('se agregaron los siguientes datos nuevos:',new.id_passenger ,'se fueron los siguientes datos antiguos:',old.id_passenger ),
  new.rut_passenger, 
  new.first_name , 
  new.last_name ,
  new.phone_number,
  new.email,
  new.birthdate, 
  new.first_date,
  new.last_date
 -- now()
); 

 
 

drop table new_crew_flight;

 create table  new_flight_crew (
 
id_crew int not null Auto_Increment,
id_flight varchar(10) not null,
rut_crew varchar (30) not null,
first_name Varchar (30) not null,
last_name Varchar (30) not null,
Phone_number varchar (20) not null,
email Varchar (30) not null,
birthday date,
first_date date ,
last_date date,
primary key (id_crew));



create table bkp_flight_crew
(select * from new_flight_crew where 1=1);


drop TRIGGER insert_new_flight_crew;
-- Crear el trigger before_insert_new_crew_flight
DELIMITER //

CREATE TRIGGER insert_new_flight_crew
BEFORE INSERT ON natam.bkp_flight_crew
FOR EACH ROW
BEGIN
    -- Validar que el birthday no esté vacío, si está vacío asignar un valor por defecto
    IF NEW.birthday IS NULL OR NEW.birthday = '' THEN
        SET NEW.birthday= 'YYYY-MM-DD';
    END IF;
    END//

DELIMITER ;









