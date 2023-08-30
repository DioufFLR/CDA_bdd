CREATE TABLE Station(
   Id_sta INT AUTO_INCREMENT,
   nom_sta VARCHAR(255)  NOT NULL,
   PRIMARY KEY(Id_sta)
);

CREATE TABLE Client(
   Id_cli INT AUTO_INCREMENT,
   nom_cli VARCHAR(255)  NOT NULL,
   prenom_cli VARCHAR(255)  NOT NULL,
   adr_cli VARCHAR(255)  NOT NULL,
   PRIMARY KEY(Id_cli)
);

CREATE TABLE Hotel(
   Id_hot INT AUTO_INCREMENT,
   capa_hot INT NOT NULL,
   cat_hot VARCHAR(255) ,
   nom_hot VARCHAR(255)  NOT NULL,
   adr_hot VARCHAR(255)  NOT NULL,
   Id_sta INT NOT NULL,
   PRIMARY KEY(Id_hot),
   FOREIGN KEY(Id_sta) REFERENCES Station(Id_sta)
);

CREATE TABLE Chambre(
   Id_cha INT AUTO_INCREMENT,
   capa_cham INT NOT NULL,
   comf_cham DECIMAL(4,2)   NOT NULL,
   expo_cham VARCHAR(255) ,
   type_cham VARCHAR(255) ,
   Id_hot INT NOT NULL,
   PRIMARY KEY(Id_cha),
   FOREIGN KEY(Id_hot) REFERENCES Hotel(Id_hot)
);

CREATE TABLE Reservation(
   Id_cha INT,
   Id_cli INT,
   date_deb DATE,
   date_fin DATE,
   date_res DATE,
   accompte DECIMAL(6,2)  ,
   prix_tot DECIMAL(6,2)  ,
   PRIMARY KEY(Id_cha, Id_cli),
   FOREIGN KEY(Id_cha) REFERENCES Chambre(Id_cha),
   FOREIGN KEY(Id_cli) REFERENCES Client(Id_cli)
);

