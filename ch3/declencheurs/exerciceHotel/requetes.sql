ALTER TABLE station ENGINE=InnoDB;

DELIMITER $$

CREATE TRIGGER insert_station AFTER INSERT ON station
    FOR EACH ROW
BEGIN
    DECLARE altitude INT;
        SET altitude = NEW.sta_altitude;
        IF altitude<1000 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion altitude !';
    END IF;
END;

DELIMITER ;

-- modif_reservation

ALTER TABLE reservation ENGINE=InnoDB;

DELIMITER $$

CREATE TRIGGER modif_reservation BEFORE UPDATE ON reservation
    FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Modification des réservations interdite';
END$$

DELIMITER ;

-- insert_reservation

-- insert_reservation2

-- insert_chambre