CREATE TABLE Client(
   Id_Client INT AUTO_INCREMENT,
   num_cli VARCHAR(10) ,
   nom_cli VARCHAR(50) ,
   prenom_cli VARCHAR(50) ,
   PRIMARY KEY(Id_Client)
);

CREATE TABLE Commande(
   Id_Commande INT AUTO_INCREMENT,
   num_com VARCHAR(50) ,
   date_com DATE,
   montant_com DECIMAL(6,2)  ,
   Id_Client INT NOT NULL,
   PRIMARY KEY(Id_Commande),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client)
);

CREATE TABLE Article(
   Id_Article INT AUTO_INCREMENT,
   num_art VARCHAR(50) ,
   design_art VARCHAR(50) ,
   pu_art VARCHAR(6)  COLLATE 2,
   PRIMARY KEY(Id_Article)
);

CREATE TABLE Se_compose_de(
   Id_Commande INT,
   Id_Article INT,
   qte DECIMAL(6,1)  ,
   taux_tva DECIMAL(5,2)  ,
   PRIMARY KEY(Id_Commande, Id_Article),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande),
   FOREIGN KEY(Id_Article) REFERENCES Article(Id_Article)
);

