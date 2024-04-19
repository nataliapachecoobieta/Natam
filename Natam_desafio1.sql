DROP SCHEMA  IF  EXISTS    Natam ;
CREATE SCHEMA IF NOT EXISTS  Natam;
USE Natam ;

-- Drop Table If exists Natam;
-- Create Table if not exists Natam(-- 


Create Table if not exists Passenger(
id_passenger int not null ,
rut_passenger int not null,
first_name Varchar (20) not null,
last_name Varchar (20) not null,
Phone_number varchar (15) not null,
email Varchar (35) not null,
birthdate date,
primary key (id_passenger));





/*insert into Passenger (id_passenger,rut_passenger,first_name, last_name,Phone_number,email) Values 
(1,'12.345.657-2','Maria','Pinto', '+56 986543123','m.pinto@gmail.com'),
(2,'13.355.637-0','Luis','Soto', '+56 987456321','l.soto@gmail.com'),
(3,'10.545.157-k','Paula','Jaraquemada', '+56 9863423123','p.jaraquemada@outlook.com'),
(4,'22.334.987-1','Maneul','Rojas', '+56 123543678','manuel.rojas@gmail.com'),
(5,'12.345.657-2','Maria','Pinto', '+56 986543123','m.pinto@gmail.com'),
(6,'18.987453.657-0','Ignacia','Soto', '+56 9761273465','i.soto@outlook.com'),
(7,'12.345.657-2','Carla','Romero', '+56 897354122','maria.pinto@gmail.com'),
(8,'23.465.988-k','Luca','Gonzalez', '+56 765234987','maria.figueroa@yahoo.com'),
(10,'12.345.657-2','Maria','Pinto', '+56 986543123','maria.pinto@gmail.com'),
(11,'15.564.129-6','Jose','Piñeda', '+56 765432199','jose.piñeda@gmail.com'),
(12,'23.354.465-2','Sofia','Vergara', '+56 986543657','sofia.vergara@outlook.com'),
(13,'8.234.476-k','Vicente','Madrid', '+56 543128761','vicente.madrid@gmail.com'),
(14,'12.692.627-2','Carlos','Ruiz', '+56 675243111','carlos.ruiz@gmail.com'),
(15,'15.345.989-1','Ines','Tejeda', '+56 765123992','inez.tejeda@gmail.com');*/








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
primary key (id_ticket),
constraint FK_flight_ticket foreign key (id_passenger) references Passenger(id_passenger)
);

/*Insert into Flight_ticket (id_ticket,id_passenger,flight_number,first_name, last_name,gate_number,class_code,seat_number,date_flight) Values 
(1, 1, 'FL123', 'Jose', 'Doe', 'GATE1', 'ECONOMY', 'A12', '2024-04-12'),
(2, 2, 'FL456', 'Jaime', 'Smith', 'GATE2', 'BUSINESS', 'C7', '2024-04-13'),
(3, 3, 'FL789', 'Alice', 'Johnson', 'GATE3', 'PREMIUM', 'D15', '2024-04-14'),
(4, 4, 'FL101', 'Michael', 'Johnson', 'GATE4', 'ECONOMY', 'B3', '2024-04-15'),
(5, 5, 'FL222', 'Emily', 'Brown', 'GATE5', 'BUSINESS', 'D10', '2024-04-16'),
(6, 6, 'FL333', 'Daniela', 'Martinez', 'GATE6', 'PREMIUM', 'F5', '2024-04-17'),
(7, 7, 'FL444', 'Sofia', 'Taylor', 'GATE7', 'ECONOMY', 'A7', '2024-04-18'),
(8, 8, 'FL555', 'Sandro', 'Anderson', 'GATE8', 'BUSINESS', 'C12', '2024-04-19'),
(10, 10, 'FL777', 'David', 'Lee', 'GATE10', 'ECONOMY', 'B14', '2024-04-21'),
(11, 11, 'FL888', 'Carla', 'Garcia', 'GATE11', 'BUSINESS', 'E9', '2024-04-22'),
(12, 12, 'FL999', 'James', 'Lopez', 'GATE12', 'PREMIUM', 'F2', '2024-04-23'),
(13, 13, 'FL111', 'Isabella', 'Hernandez', 'GATE13', 'ECONOMY', 'A20', '2024-04-24'),
(14, 14, 'FL222', 'Alexander', 'Gonzalez', 'GATE14', 'BUSINESS', 'C5', '2024-04-25'),
(15, 15, 'FL333', 'Mia', 'Perez', 'GATE15', 'PREMIUM', 'D8', '2024-04-26');*/





create table if not exists luggage (
id_luggage int not null ,
flight_number int not null,
id_passenger int not null,
first_name Varchar (20) not null,
last_name Varchar (20) not null,
primary key (id_luggage),
constraint FK_luggage foreign key (id_passenger) references Passenger(id_passenger)
);

/*Insert into  luggage (id_luggage,flight_number,id_passenger,first_name, last_name) Values 
(1, 123, 1, 'John', 'Doe'),
(2, 456, 2, 'Jane', 'Smith'),
(3, 789, 3, 'Alice', 'Johnson'),
(4, 101, 4, 'Michael', 'Johnson'),
(5, 222, 5, 'Emily', 'Brown'),
(6, 333, 6, 'Daniel', 'Martinez'),
(7, 444, 7, 'Sophia', 'Taylor'),
(8, 555, 8, 'Matthew', 'Anderson'),
(10, 777, 10, 'David', 'Lee'),
(11, 888, 11, 'Emma', 'Garcia'),
(12, 999, 12, 'James', 'Lopez'),
(13, 111, 13, 'Isabella', 'Hernandez'),
(14, 222, 14, 'Alexander', 'Gonzalez'),
(15, 333, 15, 'Mia', 'Perez');*/

create Table if not exists Flight (
id_flight int not null,
origen varchar(20)not null,
destination  varchar (20)not null,
passengers_numbers int not null,
name_capitan varchar (20)not null,
last_name_capitan varchar (20)not null,
date_flight date not null,
primary key (id_flight));




/*Insert into Flight (id_flight,origen ,destination,passengers_numbers, name_capitan, last_name_capitan,date_flight) Values

(1, 'New York', 'Los Angeles', 150, 'John', 'Doe', '2024-04-12'),
(2, 'Los Angeles', 'Chicago', 120, 'Jane', 'Smith', '2024-04-13'),
(3, 'Chicago', 'Miami', 100, 'Alice', 'Johnson', '2024-04-14'),
(4, 'Miami', 'San Francisco', 180, 'Michael', 'Johnson', '2024-04-15'),
(5, 'San Francisco', 'Seattle', 90, 'Emily', 'Brown', '2024-04-16'),
(6, 'Seattle', 'Denver', 110, 'Daniel', 'Martinez', '2024-04-17'),
(7, 'Denver', 'Las Vegas', 130, 'Sophia', 'Taylor', '2024-04-18'),
(8, 'Las Vegas', 'Dallas', 140, 'Matthew', 'Anderson', '2024-04-19'),
(9, 'Dallas', 'Houston', 150, 'Olivia', 'Wilson', '2024-04-20'),
(10, 'Houston', 'New Orleans', 160, 'David', 'Lee', '2024-04-21'),
(11, 'New Orleans', 'Atlanta', 170, 'Emma', 'Garcia', '2024-04-22'),
(12, 'Atlanta', 'New York', 200, 'James', 'Lopez', '2024-04-23'),
(13, 'New York', 'Boston', 110, 'Isabella', 'Hernandez', '2024-04-24'),
(14, 'Boston', 'Washington DC', 130, 'Alexander', 'Gonzalez', '2024-04-25'),
(15, 'Washington DC', 'Philadelphia', 120, 'Mia', 'Perez', '2024-04-26');*/



Create Table if not exists AirPort(
id_flight int not null,
id_airline int not null ,
id_Airport Varchar (10) not null,
name_city varchar (20)not null ,
country varchar (20)not null ,
primary key (id_Airport) ,
constraint FK_Airport1 foreign key (id_flight) references Flight(id_flight),
constraint FK_Airport2 foreign key (id_Airline) references Airline (id_airline)
);
/*Insert into Airport (id_flight,id_airline ,id_Airport,name_city,country) Values

(1, 101, 501, 'Santiago', 'Chule'),
(2, 102, 502, 'Buenos Aires', 'Argentina'),
(3, 103, 503, 'Chicago', 'USA'),
(4, 104, 504, 'Miami', 'USA'),
(5, 105, 505, 'Rio de Janeiro', 'Brazil'),
(6, 106, 506, 'Paris ', 'Francia'),
(7, 107, 507, 'Denver', 'USA'),
(8, 108, 508, 'Puero Natales', 'Chile'),
(9, 109, 509, 'Calama ', 'Chile'),
(10, 110, 510, 'Antofagasta ', 'Chile'),
(11, 111, 511, 'New Orleans', 'USA'),
(12, 112, 512, 'Atlanta', 'USA'),
(13, 113, 513, 'Boston', 'USA'),
(14, 114, 514, 'Mendoza ', 'Argentina '),
(15, 115, 515, 'Caracas', 'Venezuela');*/


Create  Table  if not exists Airline  (
id_airline int not null auto_increment,
id_crew int not null,
primary key (id_airline),
constraint FK_Airline foreign key (id_crew) references Flight_crew (id_crew)
);


/*Insert into Airline (id_airline,id_crew ) Values

(101, 201),
(102, 202),
(103, 203),
(104, 204),
(105, 205),
(106, 206),
(107, 207),
(108, 208),
(109, 209),
(110, 210),
(111, 211),
(112, 212),
(113, 213),
(114, 214),
(115, 215);*/



Create Table  Flight_crew(
id_crew int not null Auto_Increment,
id_flight int not null,
rut_crew varchar (30) not null,
first_name Varchar (30) not null,
last_name Varchar (30) not null,
Phone_number varchar (20) not null,
email Varchar (30) not null,
birthday date,
primary key (id_crew),
constraint FK_Flight_crew foreign key (id_flight) references Flight(id_flight)
);

/*
ALTER TABLE Flight_crew
RENAME COLUMN birthdate TO birthday = DONE ;
*/

/*Insert into Flight_crew (id_crew,id_flight,rut_crew,first_name,last_name,Phone_number,email,birthday ) Values

(201, 1, '12345678-9', 'John', 'Doe', '123-456-7890', 'john.doe@example.com', '1990-05-15'),
(202, 2, '98765432-1', 'Jane', 'Smith', '987-654-3210', 'jane.smith@example.com', '1988-09-20'),
(203, 3, '56789012-3', 'Alice', 'Johnson', '456-789-0123', 'alice.johnson@example.com', '1995-02-10'),
(204, 4, '34567890-1', 'Michael', 'Johnson', '234-567-8901', 'michael.johnson@example.com', '1987-11-25'),
(205, 5, '90123456-7', 'Emily', 'Brown', '890-123-4567', 'emily.brown@example.com', '1992-04-30'),
(206, 6, '78901234-5', 'Daniel', 'Martinez', '678-901-2345', 'daniel.martinez@example.com', '1998-08-05'),
(207, 7, '23456789-0', 'Sophia', 'Taylor', '345-678-9012', 'sophia.taylor@example.com', '1989-06-12'),
(208, 8, '01234567-8', 'Matthew', 'Anderson', '012-345-6789', 'matthew.anderson@example.com', '1994-03-18'),
(209, 9, '89012345-6', 'Olivia', 'Wilson', '890-123-4567', 'olivia.wilson@example.com', '1991-07-22'),
(210, 10, '45678901-2', 'David', 'Lee', '456-789-0123', 'david.lee@example.com', '1993-10-07'),
(211, 11, '67890123-4', 'Emma', 'Garcia', '678-901-2345', 'emma.garcia@example.com', '1986-12-15'),
(212, 12, '45678901-2', 'James', 'Lopez', '345-678-9012', 'james.lopez@example.com', '1985-08-28'),
(213, 13, '23456789-0', 'Isabella', 'Hernandez', '123-456-7890', 'isabella.hernandez@example.com', '1996-01-03'),
(214, 14, '90123456-7', 'Alexander', 'Gonzalez', '890-123-4567', 'alexander.gonzalez@example.com', '1999-07-17'),
(215, 15, '78901234-5', 'Mia', 'Perez', '678-901-2345', 'mia.perez@example.com', '1997-11-08');*/


Create Table Aircraft (
id_flight int not null,
model varchar (15)not null,
id_plate varchar (15) not null,
flight_hours int not null,
primary key (id_plate),
constraint FK_Aircraft foreign key (id_flight) references Flight(id_flight)
);


/*INSERT INTO Aircraft (id_flight, model, id_plate, flight_hours)
VALUES
(1, 'Boeing 737', 'ABC123', 5000),
(2, 'Airbus A320', 'DEF456', 6000),
(3, 'Boeing 747', 'GHI789', 7000),
(4, 'Airbus A330', 'JKL012', 5500),
(5, 'Boeing 777', 'MNO345', 6500),
(6, 'Airbus A350', 'PQR678', 4800),
(7, 'Boeing 767', 'STU901', 5200),
(8, 'Airbus A380', 'VWX234', 6700),
(9, 'Boeing 787', 'YZA567', 6100),
(10, 'Airbus A310', 'BCD890', 5300),
(11, 'Boeing 737', 'EFG123', 5600),
(12, 'Airbus A320', 'HIJ456', 5900),
(13, 'Boeing 747', 'KLM789', 6800),
(14, 'Airbus A330', 'NOP012', 5400),
(15, 'Boeing 777', 'QRS345', 6300);*/



 












