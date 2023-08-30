CREATE TABLE Personne(
   per_num INT AUTO_INCREMENT,
   per_nom VARCHAR(255) ,
   per_prenom VARCHAR(255) ,
   per_adresse VARCHAR(255) ,
   per_ville VARCHAR(255) ,
   PRIMARY KEY(per_num)
);

CREATE TABLE Groupe(
   gro_num INT AUTO_INCREMENT,
   gro_libelle VARCHAR(255) ,
   PRIMARY KEY(gro_num)
);

CREATE TABLE Appartient(
   per_num INT,
   gro_num INT,
   PRIMARY KEY(per_num, gro_num),
   FOREIGN KEY(per_num) REFERENCES Personne(per_num),
   FOREIGN KEY(gro_num) REFERENCES Groupe(gro_num)
);

