CREATE TABLE Abonne(
   Id_Abonne INT AUTO_INCREMENT,
   nom_abo VARCHAR(255) ,
   prenom_abo VARCHAR(255) ,
   adresse_abo VARCHAR(255) ,
   num_abo VARCHAR(10) ,
   created_at DATE,
   PRIMARY KEY(Id_Abonne)
);

CREATE TABLE Theme(
   Id_Theme INT AUTO_INCREMENT,
   couleur_theme VARCHAR(50) ,
   libelle_theme VARCHAR(50) ,
   PRIMARY KEY(Id_Theme)
);

CREATE TABLE Rayon(
   Id_Rayon INT AUTO_INCREMENT,
   coord_livre VARCHAR(50) ,
   PRIMARY KEY(Id_Rayon)
);

CREATE TABLE Cahier(
   Id_Cahier INT AUTO_INCREMENT,
   date_rebut DATE,
   PRIMARY KEY(Id_Cahier)
);

CREATE TABLE Livre(
   Id_Livre INT AUTO_INCREMENT,
   titre_livre VARCHAR(255) ,
   aut_livre VARCHAR(50) ,
   edit_livre VARCHAR(50) ,
   Id_Cahier INT NOT NULL,
   Id_Rayon INT NOT NULL,
   Id_Theme INT NOT NULL,
   PRIMARY KEY(Id_Livre),
   FOREIGN KEY(Id_Cahier) REFERENCES Cahier(Id_Cahier),
   FOREIGN KEY(Id_Rayon) REFERENCES Rayon(Id_Rayon),
   FOREIGN KEY(Id_Theme) REFERENCES Theme(Id_Theme)
);

CREATE TABLE Emprunte(
   Id_Livre INT,
   date_emp_livre DATE,
   Id_Abonne INT NOT NULL,
   PRIMARY KEY(Id_Livre),
   UNIQUE(Id_Abonne),
   FOREIGN KEY(Id_Livre) REFERENCES Livre(Id_Livre),
   FOREIGN KEY(Id_Abonne) REFERENCES Abonne(Id_Abonne)
);

CREATE TABLE Rends(
   Id_Abonne INT,
   date_ret_livre DATE,
   Id_Livre INT NOT NULL,
   PRIMARY KEY(Id_Abonne),
   UNIQUE(Id_Livre),
   FOREIGN KEY(Id_Abonne) REFERENCES Abonne(Id_Abonne),
   FOREIGN KEY(Id_Livre) REFERENCES Livre(Id_Livre)
);

CREATE TABLE Relance(
   Id_Abonne INT,
   date_relance DATE,
   nbr_relance DECIMAL(3,0)  ,
   Id_Livre INT NOT NULL,
   PRIMARY KEY(Id_Abonne),
   UNIQUE(Id_Livre),
   FOREIGN KEY(Id_Abonne) REFERENCES Abonne(Id_Abonne),
   FOREIGN KEY(Id_Livre) REFERENCES Livre(Id_Livre)
);

