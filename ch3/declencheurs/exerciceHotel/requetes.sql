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

DELIMITER $$

    CREATE TRIGGER `insert_reservation` BEFORE INSERT ON `reservation`
        FOR EACH ROW
    BEGIN
        DECLARE num_reservations INT;
        SELECT COUNT(*) INTO num_reservations
        FROM reservation
        WHERE res_cha_id = NEW.res_cha_id;

        IF num_reservations >= 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Ajout de réservation interdit : l''hôtel possède déjà 10 réservations.";
    END IF;
END$$

DELIMITER ;

-- insert_reservation2

DELIMITER $$

    CREATE TRIGGER insert_reservation2 BEFORE INSERT ON reservation FOR EACH ROW
    BEGIN
        DECLARE num_reservations INT;
        SELECT COUNT(*) INTO num_reservations
        FROM reservation
        WHERE res_cli_id = NEW.res_cli_id;

        IF num_reservations >= 3 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ajout de réservation interdit : le client possède déjà 3 réservations.';
    END IF;
    END$$

DELIMITER ;

-- insert_chambre

ALTER TABLE chambre ENGINE=InnoDB;

DELIMITER $$

    CREATE TRIGGER insert_chambre BEFORE INSERT ON chambre FOR EACH ROW
    BEGIN
        DECLARE total_capacite INT;
        SELECT SUM(cha_capacite) INTO total_capacite
        FROM chambre
        WHERE cha_hot_id = NEW.cha_hot_id;

        IF total_capacite + NEW.cha_capacite > 50 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Ajout de chambre interdit : la capacité totale de l\"hôtel dépasse 50.";
    END IF;
END$$

DELIMITER ;