CREATE DATABASE IF NOT EXISTS `LIVRES` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `LIVRES`;
CREATE TABLE `CLIENT` (
    `codec` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `prenom` VARCHAR(42),
    `nom` VARCHAR(42),
    `rue` VARCHAR(42),
    `cpostal` VARCHAR(42),
    `ville` VARCHAR(42)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
CREATE TABLE `EMPRUNT` (
    `codel` INT,
    `codec` INT,
    `date_d'emprunt` VARCHAR(42),
    `durée(j)` VARCHAR(42),
    PRIMARY KEY (`codel`, `codec`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
CREATE TABLE `LIVRE` (
    `codel` INT PRIMARY KEY AUTO_INCREMENT,
    `titre` VARCHAR(42)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
ALTER TABLE `EMPRUNT`
ADD FOREIGN KEY (`codec`) REFERENCES `CLIENT` (`codec`);
ALTER TABLE `EMPRUNT`
ADD FOREIGN KEY (`codel`) REFERENCES `LIVRE` (`codel`);
INSERT INTO CLIENT (prenom, nom, rue, cpostal, ville)
VALUES (
        'Alain',
        'un',
        '1 rue de la paix',
        '02001',
        'Lille-xer'
    ),
    (
        'Robert',
        'deux',
        '2 rue de la joie',
        '02010',
        'Lille-edf'
    ),
    (
        'Marine',
        'trois',
        '3 rue de la peur',
        '02015',
        'Lille-eds'
    ),
    (
        'annie',
        'quatre',
        '4 rue du bonheur',
        '02000',
        'Lille-wse'
    ),
    (
        'christelle',
        'cinq',
        '5 rue de la faiblesse',
        '02001',
        'Lille-poi'
    ),
    (
        'Emmanuelle',
        'six',
        '6 rue des questions',
        '02020',
        'Lille-yhj'
    ),
    (
        'Aurelie',
        'sept',
        '7 rue de la reponses',
        '02111',
        'Lille-frd'
    ),
    (
        'severine',
        'huit',
        '8 rue des doutes',
        '02321',
        'Lille-aze'
    ),
    (
        'guillaume',
        'neuf',
        '9 rue de la certitudes',
        '02951',
        'Lille-wsx'
    ),
    (
        'Francois',
        'dix',
        '10 rue de linterrogation',
        '02123',
        'Lille-fgm'
    ),
    (
        'Claude',
        'onze',
        '11 rue des choix',
        '02852',
        'Lille-apv'
    ),
    (
        'Nathalie',
        'douze',
        '12 rue des positions',
        '02124',
        'Lille-qpb'
    ),
    (
        'Beatrice',
        'treize',
        '13 rue des grimaces',
        '02789',
        'Lille-lep'
    );
INSERT INTO livres (titre)
VALUES ('les oiseaux'),
    ('les chiens'),
    ('les lamas'),
    ('les grenouilles'),
    ('les mouches'),
    ('les lions'),
    ('les chats'),
    ('les lapins'),
    ('les elephants'),
    ('les girafes'),
    ('les poissons');
INSERT INTO emprunt
VALUES (1, 2, '2020-10-10', '1'),
    (1, 4, '2020-10-11', '3'),
    (1, 5, '2020-10-12', '3'),
    (2, 1, '2020-10-10', '2'),
    (3, 2, '2020-10-15', '5'),
    (4, 1, '2020-10-17', '1'),
    (4, 6, '2020-10-10', '2'),
    (5, 2, '2020-10-12', '3'),
    (6, 8, '2020-10-18', '2'),
    (7, 7, '2020-10-10', '1'),
    (7, 9, '2020-10-18', '4');
SELECT titre,
    `date_d'emprunt`
FROM `emprunt`
    JOIN livre
WHERE emprunt.codel = livre.codel
ORDER BY titre;
SELECT client.codec,
    ville,
    IFNULL(codel, `Pas d'emprunt`) as numLivreEmpr
FROM client
    LEFT JOIN emprunt ON client.codec = emprunt.codec
ORDER BY ville;
SELECT client.nom as nomClient,
    livre.titre as titreLivre,
    `date_d'emprunt` as dateDebutEmprunt
FROM `emprunt`
    JOIN client ON emprunt.codec = client.codec
    JOIN livre ON emprunt.codel = livre.codel
ORDER BY nomClient;
SELECT client.nom as nomClient,
    IFNULL(livre.titre, `Pas d'emprunt`) as titreLivre,
    IFNULL(durée, `Pas d'emprunt`) as dureeEmprunt
FROM `emprunts`
    RIGHT JOIN client on emprunt.codec = client.codec
    LEFT JOIN livre ON emprunt.codel = livre.codel
order by nom;