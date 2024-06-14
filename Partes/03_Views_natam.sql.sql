use natam;

-- VISTAS--

-- Muestra el número total de pasajeros por vuelo.--

CREATE OR REPLACE VIEW  vw_n_total_pasajeros as
select
    flight.id_flight,
    flight.origen,
    flight.destination,
    flight.date_flight,
    COUNT(fp.id_passenger) AS total
from
    flight 
join
    flight_passenger fp ON flight.id_flight = fp.id_flight AND flight.date_flight = fp.date_flight
group by
    flight.id_flight, flight.origen, flight.destination, flight.date_flight;
    
    
    -- Vista: Muestra el peso total del equipaje por pasajero.
    
CREATE OR REPLACE VIEW  vw_p_total_equipaje_pasajero as
select
    luggage.id_passenger,
    passenger.first_name,
    passenger.last_name,
    luggage.flight_number,
    SUM(luggage.weight) AS total_peso
from 
    luggage 
join 
    passenger  ON luggage.id_passenger = passenger.id_passenger
group by 
    luggage.id_passenger, passenger.first_name, passenger.last_name, luggage.flight_number;
    
    -- Vista : Muestra el número de vuelos asignados a cada miembro de la tripulación.--

CREATE OR REPLACE VIEW  vw_n_vuelos_tripulacion  as
Select 
    flight_crew.id_crew,
   flight_crew.first_name,
flight_crew.last_name,
    COUNT(flight_crew.id_flight) AS contado_vuelos
from
    flight_crew 
group by
   flight_crew.id_crew, flight_crew.first_name, flight_crew.last_name;
   
   -- Vista : Muestra las horas de vuelo acumuladas por cada aeronave.
   
   CREATE OR REPLACE VIEW  vw_horas_vuelo_acumuladas  as
select  
    aircraft.id_flight,
    aircraft.model,
    aircraft.id_plate,
    SUM(aircraft.flight_hours) AS total_horas
from 
    aircraft 
group by 
    aircraft.id_flight, aircraft.model, aircraft.id_plate 
    ORDER BY 
    total_horas ASC;

    
    -- Vista:  participacion de tripulación por vuelo
    
   CREATE OR REPLACE VIEW  vw_participacion_crew  as
   select 
    flight_crew.id_crew,
	flight_crew.first_name,
     flight_crew.last_name,
    COUNT( flight_crew.id_flight) AS total_vuelos
from
    flight_crew 
group by
     flight_crew.id_crew,  flight_crew.first_name,  flight_crew.last_name;
     
     
     -- vistas : muestra el número de tickets vendidos por cada vuelo.
     
	
     
   CREATE OR REPLACE VIEW Contador_Tickets AS
SELECT 
    flight_ticket.flight_number,
    flight_ticket.date_flight,
    COUNT( flight_ticket.id_ticket) AS Total_tickets_vendidos
FROM 
    flight_ticket
GROUP BY 
     flight_ticket.flight_number,  flight_ticket.date_flight;
     
     select  *from flight;
  