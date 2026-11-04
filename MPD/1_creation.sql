DROP DATABASE IF EXISTS f1DB;
CREATE DATABASE f1DB;
USE f1DB;

CREATE TABLE academie (
    id_academie            INT AUTO_INCREMENT,
    annee_entre_academie   SMALLINT,
    annee_sortie_academie  SMALLINT,
    PRIMARY KEY (id_academie)
);

CREATE TABLE Pilote (
    Numero_de_licence           VARCHAR(50),
    Numero_de_course_du_pilote  INT,
    Nom_du_pilote               VARCHAR(50) NOT NULL,
    Prenom_du_pilote            VARCHAR(50),
    Age_du_pilote               TINYINT,
    Sexe_du_pilote              CHAR(1),
    position_classement_general INT,
    Nationalite_du_pilote       VARCHAR(50),
    issu_de_l_academie          BOOLEAN,
    score_actuel_du_championnat INT,
    id_academie                 INT,
    Numero_de_licence_referent  VARCHAR(50),
    PRIMARY KEY (Numero_de_licence),
    FOREIGN KEY (id_academie) REFERENCES academie(id_academie) 
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (Numero_de_licence_referent) REFERENCES Pilote(Numero_de_licence) 
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE saison (
    Annee_saison SMALLINT,
    PRIMARY KEY (Annee_saison)
);

CREATE TABLE Ecurie (
    nom_ecurie                VARCHAR(50),
    Pays_origine              VARCHAR(50),
    Nom_directeur_ecurie      VARCHAR(50),
    Annee_creation_ecurie     SMALLINT,
    Couleur_officielle_ecurie VARCHAR(50),
    PRIMARY KEY (nom_ecurie)
);

CREATE TABLE Engager (
    Numero_de_licence VARCHAR(50),
    nom_ecurie        VARCHAR(50),
    Annee_saison      SMALLINT,
    PRIMARY KEY (Numero_de_licence, nom_ecurie, Annee_saison),
    FOREIGN KEY (Numero_de_licence) REFERENCES Pilote(Numero_de_licence) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (nom_ecurie) REFERENCES Ecurie(nom_ecurie) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Annee_saison) REFERENCES saison(Annee_saison) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE localisation (
    id_ville INT AUTO_INCREMENT,
    ville    VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_ville)
);

CREATE TABLE Circuit (
    Nom_du_circuit      VARCHAR(100),
    pays_circuit        VARCHAR(50),
    nombre_tour_circuit INT,
    longueur_circuit    DECIMAL(6,3),
    id_ville            INT NOT NULL,
    PRIMARY KEY (Nom_du_circuit),
    FOREIGN KEY (id_ville) REFERENCES localisation(id_ville) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE record_du_circuit (
    Numero_de_licence   VARCHAR(50),
    Nom_du_circuit      VARCHAR(100),
    chrono_record_tour  TIME,
    annee_record        SMALLINT,
    PRIMARY KEY (Numero_de_licence, Nom_du_circuit),
    FOREIGN KEY (Numero_de_licence) REFERENCES Pilote(Numero_de_licence) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Nom_du_circuit) REFERENCES Circuit(Nom_du_circuit) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Grand_Prix (
    Annee_saison     SMALLINT,
    Numero_de_course INT,
    nom_officiel_GP  VARCHAR(100) NOT NULL,
    date_GP          DATE,
    Nom_du_circuit   VARCHAR(100) NOT NULL,
    PRIMARY KEY (Annee_saison, Numero_de_course),
    FOREIGN KEY (Annee_saison) REFERENCES saison(Annee_saison) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Nom_du_circuit) REFERENCES Circuit(Nom_du_circuit) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE participer (
    Numero_de_licence VARCHAR(50),
    Annee_saison      SMALLINT,
    Numero_de_course  INT,
    pole_de_depart    INT,
    pole_arrivee      INT,
    chrono_entier     TIME,
    points            INT,
    statut_du_pilote  VARCHAR(50),
    PRIMARY KEY (Numero_de_licence, Annee_saison, Numero_de_course),
    FOREIGN KEY (Numero_de_licence) REFERENCES Pilote(Numero_de_licence) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Annee_saison, Numero_de_course) REFERENCES Grand_Prix(Annee_saison, Numero_de_course) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE meilleur_tour_course (
    Numero_de_licence           VARCHAR(50),
    Annee_saison                SMALLINT,
    Numero_de_course            INT,
    chrono_meilleur_tour_course TIME,
    numero_meilleur_tour_course INT,
    PRIMARY KEY (Numero_de_licence, Annee_saison, Numero_de_course),
    FOREIGN KEY (Numero_de_licence) REFERENCES Pilote(Numero_de_licence) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Annee_saison, Numero_de_course) REFERENCES Grand_Prix(Annee_saison, Numero_de_course) 
        ON DELETE CASCADE ON UPDATE CASCADE
);