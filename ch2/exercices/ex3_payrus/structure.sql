CREATE TABLE produit(
   codart CHAR(4) ,
   libart VARCHAR(30)  NOT NULL,
   stkale INT NOT NULL,
   stkphy INT NOT NULL,
   qteann INT NOT NULL,
   unimes VARCHAR(5)  NOT NULL,
   PRIMARY KEY(codart)
);

CREATE TABLE fournis(
   numfou VARCHAR(25) ,
   nomfou VARCHAR(25)  NOT NULL,
   ruefou VARCHAR(50)  NOT NULL,
   posfou CHAR(5)  NOT NULL,
   confou VARCHAR(15)  NOT NULL,
   satisf TINYINT,
   vilfou VARCHAR(30)  NOT NULL,
   PRIMARY KEY(numfou)
);

CREATE TABLE entcom(
   numcom INT AUTO_INCREMENT,
   obscom VARCHAR(50) ,
   datcom DATE NOT NULL,
   numfou VARCHAR(25) ,
   PRIMARY KEY(numcom),
   FOREIGN KEY(numfou) REFERENCES fournis(numfou)
);

CREATE TABLE ligcom(
   numlig INT AUTO_INCREMENT,
   qtecde INT NOT NULL,
   priuni VARCHAR(50)  NOT NULL,
   qteliv DATE,
   numcom INT,
   codart CHAR(4) ,
   PRIMARY KEY(numlig),
   FOREIGN KEY(numcom) REFERENCES entcom(numcom),
   FOREIGN KEY(codart) REFERENCES produit(codart)
);

CREATE TABLE vente(
   codart CHAR(4) ,
   numfou VARCHAR(25) ,
   delliv SMALLINT NOT NULL,
   qte1 INT NOT NULL,
   prix1 DECIMAL(9,2)   NOT NULL,
   qte2 INT NOT NULL,
   prix2 DECIMAL(9,2)   NOT NULL,
   qte3 INT NOT NULL,
   prix3 DECIMAL(9,2)   NOT NULL,
   PRIMARY KEY(codart, numfou),
   FOREIGN KEY(codart) REFERENCES produit(codart),
   FOREIGN KEY(numfou) REFERENCES fournis(numfou)
);

