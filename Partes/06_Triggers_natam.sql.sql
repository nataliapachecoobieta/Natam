use natam;
-- Triggers --
-- Para esta etapa ocupare las tablas Passenger y flight_crew

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

-- drop table bkp_passenger;
create table bkp_passenger as
(select * from new_passenger where 1=1);

-- drop trigger tr_update_new_passenger;
-- actualizar un pasajero ocupando una tabla new_passenger --
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
-- Insertar un nuevo tripulante ocupando la tabla new_flight_crew-- 
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

