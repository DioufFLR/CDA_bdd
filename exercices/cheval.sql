CREATE DATABASE cheval;

CREATE TABLE Cheval(
   Id_Cheval COUNTER,
   numero VARCHAR(50),
   date_naissance DATE,
   race VARCHAR(50),
   couleur VARCHAR(50),
   mere VARCHAR(50),
   sexe VARCHAR(50),
   lieu_naissance VARCHAR(50),
   PRIMARY KEY(Id_Cheval)
);

CREATE TABLE Personne(
   Id_Personne COUNTER,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   PRIMARY KEY(Id_Personne)
);

CREATE TABLE Appartient(
   Id_Cheval INT,
   Id_Personne INT,
   date_achat DATE,
   PRIMARY KEY(Id_Cheval, Id_Personne),
   FOREIGN KEY(Id_Cheval) REFERENCES Cheval(Id_Cheval),
   FOREIGN KEY(Id_Personne) REFERENCES Personne(Id_Personne)
);

CREATE TABLE Entraine(
   Id_Cheval INT,
   Id_Personne INT,
   PRIMARY KEY(Id_Cheval, Id_Personne),
   FOREIGN KEY(Id_Cheval) REFERENCES Cheval(Id_Cheval),
   FOREIGN KEY(Id_Personne) REFERENCES Personne(Id_Personne)
);

CREATE TABLE Soigne(
   Id_Cheval INT,
   Id_Personne INT,
   date_soins DATE,
   type_soins VARCHAR(50),
   PRIMARY KEY(Id_Cheval, Id_Personne),
   FOREIGN KEY(Id_Cheval) REFERENCES Cheval(Id_Cheval),
   FOREIGN KEY(Id_Personne) REFERENCES Personne(Id_Personne)
);

