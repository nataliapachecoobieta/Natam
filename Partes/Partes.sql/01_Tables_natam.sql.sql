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

create table if not exists luggage (
id_luggage int not null ,
flight_number varchar (20) not null,
id_passenger int not null,
first_name Varchar (20) not null,
last_name Varchar (20) not null,
weight int not null,
primary key (id_luggage),
foreign key (id_passenger) references passenger(id_passenger)
);

create Table if not exists flight_passenger (
id_flight varchar (10) not null,
date_flight date not null,
id_passenger int not null ,
primary key (id_flight,date_flight,id_passenger),
foreign key (id_flight) references flight (id_flight),
foreign key (date_flight) references flight(date_flight),
foreign key (id_passenger) references passenger(id_passenger)
);


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
foreign key (id_passenger) references passenger(id_passenger),
foreign key (flight_number) references flight(id_flight)
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
primary key (id_crew),
foreign key (id_flight) references flight(id_flight)
);


Create  Table  if not exists airline  (
id_airline int not null auto_increment,
id_crew int not null,
primary key (id_airline),
foreign key (id_crew) references Flight_crew (id_crew)
);

Create Table if not exists airport(
id_flight varchar (10) not null,
id_airline int not null ,
id_Airport Varchar (10) not null,
name_city varchar (20)not null ,
country varchar (20)not null ,
primary key (id_Airport),
foreign key (id_flight) references Flight(id_flight),
foreign key (id_airline) references Airline (id_airline)
);


Create Table aircraft (
id_flight varchar(10) not null,
model varchar (15)not null,
id_plate varchar (15) not null,
flight_hours int not null,
primary key (id_plate),
foreign key (id_flight) references flight(id_flight)
);


/*
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

*/
