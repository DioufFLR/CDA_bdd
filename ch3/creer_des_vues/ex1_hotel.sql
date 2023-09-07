-- 1

CREATE VIEW hotel_station
AS
SELECT * FROM hotel, station

SELECT hot_nom, sta_nom FROM hotel_station

-- 2

CREATE VIEW chambre_hotel
AS
SELECT * FROM hotel, chambre


