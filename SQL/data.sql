create database vaccination;


use vaccination;

CREATE TABLE MEDECIN(
        Id     Int NOT NULL ,
        nom    Varchar (255) NOT NULL ,
        prenom Varchar (255) NOT NULL
	,CONSTRAINT MEDECIN_PK PRIMARY KEY (Id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CENTRE
#------------------------------------------------------------

CREATE TABLE CENTRE(
        nom     Varchar (255) NOT NULL ,
        adresse Varchar (255) NOT NULL
	,CONSTRAINT CENTRE_PK PRIMARY KEY (nom)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SPECIALITE
#------------------------------------------------------------

CREATE TABLE SPECIALITE(
        Numero Int NOT NULL ,
        nom    Varchar (255) NOT NULL
	,CONSTRAINT SPECIALITE_PK PRIMARY KEY (Numero)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ECOLE
#------------------------------------------------------------

CREATE TABLE ECOLE(
        nom     Varchar (255) NOT NULL ,
        adresse Varchar (255) NOT NULL
	,CONSTRAINT ECOLE_PK PRIMARY KEY (nom)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ENFANT
#------------------------------------------------------------

CREATE TABLE ENFANT(
        Identifiant   Int  Auto_increment  NOT NULL ,
        nom           Varchar (255) NOT NULL ,
        prenom        Varchar (255) NOT NULL ,
        age           Int NOT NULL ,
        sexe          Char (5) NOT NULL ,
        poids         Int NOT NULL ,
        taille        Int NOT NULL ,
        nombreEnfants Int NOT NULL ,
        nom_ECOLE     Varchar (255)
	,CONSTRAINT ENFANT_PK PRIMARY KEY (Identifiant)

	,CONSTRAINT ENFANT_ECOLE_FK FOREIGN KEY (nom_ECOLE) REFERENCES ECOLE(nom)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: VACCINATION
#------------------------------------------------------------

CREATE TABLE VACCINATION(
        numero Int NOT NULL
	,CONSTRAINT VACCINATION_PK PRIMARY KEY (numero)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CATEGORIE
#------------------------------------------------------------

CREATE TABLE CATEGORIE(
        code Varchar (255) NOT NULL
	,CONSTRAINT CATEGORIE_PK PRIMARY KEY (code)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: VACCIN
#------------------------------------------------------------

CREATE TABLE VACCIN(
        id   Int  Auto_increment  NOT NULL ,
        nom  Varchar (255) NOT NULL ,
        code Varchar (255) NOT NULL
	,CONSTRAINT VACCIN_PK PRIMARY KEY (id)

	,CONSTRAINT VACCIN_CATEGORIE_FK FOREIGN KEY (code) REFERENCES CATEGORIE(code)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: centre_medecin
#------------------------------------------------------------

CREATE TABLE centre_medecin(
        nom Varchar (255) NOT NULL ,
        Id  Int NOT NULL
	,CONSTRAINT centre_medecin_PK PRIMARY KEY (nom,Id)

	,CONSTRAINT centre_medecin_CENTRE_FK FOREIGN KEY (nom) REFERENCES CENTRE(nom)
	,CONSTRAINT centre_medecin_MEDECIN0_FK FOREIGN KEY (Id) REFERENCES MEDECIN(Id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: specialite_medecin
#------------------------------------------------------------

CREATE TABLE specialite_medecin(
        Numero Int NOT NULL ,
        Id     Int NOT NULL
	,CONSTRAINT specialite_medecin_PK PRIMARY KEY (Numero,Id)

	,CONSTRAINT specialite_medecin_SPECIALITE_FK FOREIGN KEY (Numero) REFERENCES SPECIALITE(Numero)
	,CONSTRAINT specialite_medecin_MEDECIN0_FK FOREIGN KEY (Id) REFERENCES MEDECIN(Id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: medecin_vaccination
#------------------------------------------------------------

CREATE TABLE medecin_vaccination(
        numero Int NOT NULL ,
        Id     Int NOT NULL
	,CONSTRAINT medecin_vaccination_PK PRIMARY KEY (numero,Id)

	,CONSTRAINT medecin_vaccination_VACCINATION_FK FOREIGN KEY (numero) REFERENCES VACCINATION(numero)
	,CONSTRAINT medecin_vaccination_MEDECIN0_FK FOREIGN KEY (Id) REFERENCES MEDECIN(Id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: vaccination_vaccin
#------------------------------------------------------------

CREATE TABLE vaccination_vaccin(
        id     Int NOT NULL ,
        numero Int NOT NULL
	,CONSTRAINT vaccination_vaccin_PK PRIMARY KEY (id,numero)

	,CONSTRAINT vaccination_vaccin_VACCIN_FK FOREIGN KEY (id) REFERENCES VACCIN(id)
	,CONSTRAINT vaccination_vaccin_VACCINATION0_FK FOREIGN KEY (numero) REFERENCES VACCINATION(numero)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: vaccination_enfant
#------------------------------------------------------------

CREATE TABLE vaccination_enfant(
        numero      Int NOT NULL ,
        Identifiant Int NOT NULL
	,CONSTRAINT vaccination_enfant_PK PRIMARY KEY (numero,Identifiant)

	,CONSTRAINT vaccination_enfant_VACCINATION_FK FOREIGN KEY (numero) REFERENCES VACCINATION(numero)
	,CONSTRAINT vaccination_enfant_ENFANT0_FK FOREIGN KEY (Identifiant) REFERENCES ENFANT(Identifiant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ecole_medecin
#------------------------------------------------------------

CREATE TABLE ecole_medecin(
        nom Varchar (255) NOT NULL ,
        Id  Int NOT NULL
	,CONSTRAINT ecole_medecin_PK PRIMARY KEY (nom,Id)

	,CONSTRAINT ecole_medecin_ECOLE_FK FOREIGN KEY (nom) REFERENCES ECOLE(nom)
	,CONSTRAINT ecole_medecin_MEDECIN0_FK FOREIGN KEY (Id) REFERENCES MEDECIN(Id)
)ENGINE=InnoDB;

