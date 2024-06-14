use natam;
-- La primera tabla es : luggage



/*
select *
from flight;

drop table new_luggage;
create table if not exists new_luggage (
id_luggage int not null ,
flight_number varchar (20) not null,
id_passenger int not null,
first_name Varchar (20) not null,
last_name Varchar (20) not null,
weight int not null,
primary key (id_luggage)
);

drop table bkp_luggage;
create table  asbkp_luggage
(select * from new_luggage where 1=1);
*/


START TRANSACTION ;
 -- SELECT * FROM luggage WHERE id_luggage IN (1, 2, 3, 4);
Delete FROM luggage WHERE id_luggage IN (1, 2, 3, 4);
-- ROLLBACK ;
-- COMMIT;

select * from luggage;

/*
Insert into  luggage (id_luggage,flight_number,id_passenger,first_name, last_name,weight) Values 
(1, 'FL123', 1, ',Maria', 'Pinto',23),
(2, 'FL456', 2, 'Luis','Sanchez',19),
(3, 'FL789', 3, 'Paula', 'Jaraquemada',16),
(4, 'FL101', 4, 'Manuel', 'Rojas',20),
*/



-- La segunda tabla es : airport

START TRANSACTION;

INSERT INTO airport  VALUES 
('FL101', 102, 701, 'Bogota', 'Colombia'),
('FL111', 102, 702, 'Mendoza', 'Argentina'),
('FL123', 103, 703, 'Albuquerque', 'USA'),
('FL222', 104, 704, 'Brasilia', 'Brazil');

SAVEPOINT sp1;
INSERT INTO airport  VALUES 
('FL228', 105, 705, 'Cuidad de Mexico', 'Mexico'),
('FL232', 106, 706, 'Moscu ', 'Rusia'),
('FL281', 107, 707, 'Varzovia', 'Polonia'),
('FL330', 108, 708, 'Berlin ', 'Germany');
SAVEPOINT sp2;

commit;

select * from airport;

-- release SAVEPOINT sp1; -- elimina el SAVEPOINT




