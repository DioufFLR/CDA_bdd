CREATE USER 'util1'@'localhost' IDENTIFIED BY '0000';
CREATE USER 'util2'@'localhost' IDENTIFIED BY '0001';
CREATE USER 'util3'@'localhost' IDENTIFIED BY '0002';

GRANT ALL PRIVILEGES ON papyrus.* TO 'util1'@'localhost';

GRANT SELECT ON papyrus.* TO 'util2'@'localhost';

GRANT SELECT ON papyrus.fournis TO 'util3'@'localhost';