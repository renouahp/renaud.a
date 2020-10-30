DROP DATABASE IF EXISTS sql6;
CREATE DATABASE IF NOT EXISTS sql6;
USE sql6;

CREATE TABLE FILIALEA (
    idpersonnes int(11) not null primary key auto_increment,
    nom  varchar(36) not null,
   prenom  varchar(36) not null,
   email varchar(36) not null,
   numService int,
   numVoiture int
);

INSERT INTO FILIALEA (idpersonnes, nom, prenom, email, numService, numVoiture) VALUES
(1, "Pauland", "Marc", "p.marc@nimps.com", 1, 1), 
(2, "Taralou", "Dimitri", "z.tar.dim@zolka.com", 3, 1), 
(3, "Marchand", "Aline", "m.aline@duvent.fr", 2, 2), 
(4, "Zolak", "Pierre", "z.pierre@purple.com", 1, 1), 
(5, "Laporte", "Martine", "l.martine@free.fr", NULL, NULL);

CREATE TABLE FILIALEB (
    idpersonnes int(11) not null primary key auto_increment,
    nom  varchar(36) not null,
   prenom  varchar(36) not null,
   email varchar(36) not null,
   numService int,
   numVoiture int
);

INSERT INTO FILIALEB (idpersonnes, nom, prenom, email, numService, numVoiture) VALUES
(1, "Marliax", "Jean", "m.jean@nloips.com", 3, 1 ), 
(2, "Zappy", "Claudine", "z.c.200@vayent.fr", 1, 2), 
(3, "Taralou", "Dimitri", "z.tar.dim@zolka.com", 3, 1), 
(4, "Zolak", "Pierre", "z.pierre@purple.com", 1, 1), 
(5, "Fenestry", "Etienne", "Fen_eti_fr@free.fr", NULL, 1);

CREATE TABLE SERVICES (
    idservice int not null primary key auto_increment,
    nom_service varchar(36) not null
);

INSERT INTO SERVICES (idservice,nom_service) VALUES 
(1, "compta"), 
(2, "vente"), 
(3, "support");

CREATE TABLE VOITURES (
    idvoitures int not null primary key auto_increment,
    marque varchar(36) not null,
    matricule varchar(36) not null
);

INSERT INTO VOITURES (idvoitures,marque,matricule) VALUES
(1, "Renault", "951 KIO 45"), 
(2, "Fiat", "741 MIP 65");

-- 1
SELECT CONCAT (prenom, "_", ucase(nom)) as TriePrenomFA FROM FILIALEA ORDER BY prenom;

-- 2
SELECT CONCAT (prenom, "_", ucase(nom)) as TriePrenomFB FROM FILIALEB ORDER BY prenom;

-- 3
SELECT DISTINCT CONCAT(FILIALEA.prenom," ", FILIALEA.nom,"     ", FILIALEB.prenom," ", FILIALEB.nom) as "Tableau des deux filiales" FROM FILIALEA LEFT JOIN FILIALEB ON FILIALEA.idpersonnes = FILIALEB.idpersonnes;

-- 4
SELECT DISTINCT FILIALEA.prenom, FILIALEA.nom, FILIALEB.prenom, FILIALEB.nom from FILIALEA, FILIALEB where isnull(FILIALEA.numService or FILIALEB.numService);

-- 5
SELECT prenom, nom from FILIALEA where CONCAT (prenom, " ", ucase(nom)) NOT IN (SELECT CONCAT (prenom, " ", ucase(nom)) FROM filialeb);

-- 6
SELECT concat(filialea.nom,' ', filialea.prenom) as nom from filialea WHERE concat(filialea.nom,' ', filialea.prenom) NOT IN (select concat(filialeb.nom,' ', filialeb.prenom) from filialeB) union SELECT concat(filialeb.nom,' ', filialeb.prenom) from filialeb WHERE concat(filialeb.nom,' ', filialeb.prenom) NOT IN (select concat(filialea.nom,' ', filialea.prenom) from filialea);

-- 7
SELECT DISTINCT CONCAT(FILIALEA.prenom," ", FILIALEA.nom) as "Personnes", ifnull(nom_service, "pasdeservice") as "NomDuService" FROM FILIALEA LEFT JOIN SERVICES ON idservice = FILIALEA.numService
UNION
SELECT CONCAT(FILIALEB.prenom," ", FILIALEB.nom), ifnull(nom_service, "pasdeservice") as "NomDuService" FROM FILIALEB LEFT JOIN SERVICES ON idservice = FILIALEB.numService;

-- 8
SELECT concat(FILIALEA.prenom,".", LEFT(ucase(FILIALEA.nom),1)) as "Personnes", ifnull(VOITURES.matricule,"PasDeVoiture") as "Matricule" FROM FILIALEA LEFT JOIN VOITURES ON FILIALEA.numVoiture = VOITURES.idvoitures
UNION
SELECT concat(FILIALEB.prenom,".", LEFT(ucase(FILIALEB.nom),1)), ifnull(VOITURES.matricule,"PasDeVoiture") as "Matricule" FROM FILIALEB LEFT JOIN VOITURES ON FILIALEB.numVoiture = VOITURES.idvoitures;

-- 9
SELECT concat(LEFT(ucase(FILIALEA.prenom),1),".", FILIALEA.nom  , " " , ifnull(nom_service, "Pas de service")) as "personne", ifnull(VOITURES.matricule,"PasDeVoiture") as "Matricule" FROM FILIALEA LEFT JOIN VOITURES ON FILIALEA.numVoiture = VOITURES.idvoitures LEFT JOIN SERVICES ON idservice = FILIALEA.numService 
UNION
SELECT concat(LEFT(ucase(FILIALEB.prenom),1),".", FILIALEB.nom  , " " , ifnull(nom_service, "Pas de service")) as "personne", ifnull(VOITURES.matricule,"PasDeVoiture") as "Matricule" FROM FILIALEB LEFT JOIN VOITURES ON FILIALEB.numVoiture = VOITURES.idvoitures LEFT JOIN SERVICES ON idservice = FILIALEB.numService;

-- 10
SELECT concat(marque,' ', matricule) as voiture, ((SELECT COUNT(numVoiture) FROM filialea WHERE numVoiture = idvoitures and concat(filialea.nom,' ', filialea.prenom) NOT IN (select concat(filialeb.nom,' ', filialeb.prenom) from filialeB))) + ((SELECT COUNT(numVoiture) FROM filialeb WHERE numVoiture = idvoitures)) as "NombreDeConducteur" FROM voitures;

-- 11
SELECT nom_service as "NomDuService", ((SELECT COUNT(numService) FROM filialea WHERE numService = idservice and concat(filialea.nom,' ', filialea.prenom) NOT IN (select concat(filialeb.nom,' ', filialeb.prenom) from filialeB))) + ((SELECT COUNT(numService) FROM filialeb WHERE numService = idservice)) as "NombreDePersonnesDansLeService" FROM SERVICES;

-- 12
