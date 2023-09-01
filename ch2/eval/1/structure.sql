CREATE TABLE client(
   cli_num INT AUTO_INCREMENT,
   cli_nom VARCHAR(50) ,
   cli_adresse VARCHAR(50) ,
   cli_tel VARCHAR(30) ,
   PRIMARY KEY(cli_num)
);

CREATE TABLE commande(
   com_num INT AUTO_INCREMENT,
   com_date DATETIME,
   com_obs VARCHAR(50) ,
   cli_num INT,
   PRIMARY KEY(com_num),
   FOREIGN KEY(cli_num) REFERENCES client(cli_num)
);

CREATE TABLE produit(
   pro_num INT,
   pro_libelle VARCHAR(50) ,
   pro_description VARCHAR(50) ,
   PRIMARY KEY(pro_num)
);

CREATE TABLE est_compose(
   com_num INT,
   pro_num INT,
   est_qte INT,
   PRIMARY KEY(com_num, pro_num),
   FOREIGN KEY(com_num) REFERENCES commande(com_num),
   FOREIGN KEY(pro_num) REFERENCES produit(pro_num)
);

CREATE INDEX `cli_nom` ON `client` (`cli_nom`);
