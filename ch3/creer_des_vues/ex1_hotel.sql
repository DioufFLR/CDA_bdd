-- 1

CREATE VIEW hotel_station
AS
SELECT * FROM hotel, station

SELECT hot_nom, sta_nom FROM hotel_station

-- 2

CREATE VIEW chambre_hotel
AS
SELECT * FROM hotel, chambre

SELECT cha_numero, hot_nom
FROM chambre_hotel;


-- 3

CREATE VIEW reservation_client
AS
SELECT * FROM client, reservation;

SELECT res_id, cli_nom
FROM reservation_client;

-- 4

CREATE VIEW station_hotel_chambre
AS
SELECT * FROM station, hotel, chambre;

SELECT cha_numero, hot_nom, sta_nom
FROM station_hotel_chambre;

-- 5

CREATE VIEW client_reservation_hotel
AS
SELECT * FROM client, reservation, hotel;

SELECT res_id, cli_nom, hot_nom
FROM client_reservation_hotel;