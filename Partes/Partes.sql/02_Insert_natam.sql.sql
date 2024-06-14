use natam;


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


select * from airport;


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

INSERT INTO flight_ticket (id_flight, id_passenger, flight_code, first_name, last_name, gate, class, seat, flight_date) VALUES 
('1', '1', 'FL123', 'Maria', 'Pinto', 'GATE1', 'ECONOMY', 'A12', '2020-04-05'),
('2', '2', 'FL456', 'Luis', 'Sanchez', 'GATE2', 'BUSINESS', 'C7', '2020-04-06'),
('3', '3', 'FL789', 'Paula', 'Jaraquemada', 'GATE3', 'PREMIUM', 'D15', '2020-04-07'),
('4', '4', 'FL101', 'Manuel', 'Rojas', 'GATE4', 'ECONOMY', 'B3', '2020-04-08'),
('5', '5', 'FL222', 'Carmen', 'Paez', 'GATE5', 'BUSINESS', 'D10', '2020-04-09'),
('6', '6', 'FL444', 'Ignacia', 'Soto', 'GATE6', 'PREMIUM', 'F5', '2020-04-10'),
('7', '7', 'FL228', 'Carla', 'Romero', 'GATE7', 'ECONOMY', 'A7', '2020-04-11'),
('8', '8', 'FL555', 'Marta', 'Jimenez', 'GATE8', 'ECONOMY', 'A2', '2020-04-12'),
('9', '9', 'FL777', 'Luca', 'Gonzalez', 'GATE8', 'BUSINESS', 'C12', '2020-04-13'),
('10', '10', 'FL888', 'Cecilia', 'Perez', 'GATE10', 'ECONOMY', 'B14', '2020-04-14'),
('11', '11', 'FL999', 'Jose', 'Pineda', 'GATE11', 'BUSINESS', 'E9', '2020-04-15'),
('12', '12', 'FL111', 'Sofia', 'Vergara', 'GATE12', 'PREMIUM', 'F2', '2020-04-16'),
('13', '13', 'FL232', 'Vicente', 'Madrid', 'GATE13', 'ECONOMY', 'A20', '2020-04-17'),
('14', '14', 'FL281', 'Carlos', 'Ruiz', 'GATE14', 'BUSINESS', 'C5', '2020-04-18'),
('15', '15', 'FL330', 'Ines', 'Tejeda', 'GATE15', 'PREMIUM', 'D8', '2020-04-19');

