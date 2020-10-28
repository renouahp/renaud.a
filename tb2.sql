create database if not exists DWWW_Renaud;
use DWWW_Renaud;

create table if not exists soldat (
	nom  varchar(32),
    prenom  varchar(32),
    date_naissance  DATE,
	sexe  varchar(1),
	grade int
);

insert into soldat values 
("Dupont","Marc",'2000-04-02',"m",1),          
("Marchand","Paul",'1994-04-02',"m",2),
("Laporte","Marie",'1994-02-20',"f",3),
("Martin","Alex",'1992-06-10',"m",4),
("Dirlos","Benoit",'1982-07-02',"m",5),
("Fergusson","Yohann",'1900-12-02',"m",5),
("Dany","Philipe",'1492-04-02',"m",2),
("Lacour","Suzanne",'1994-04-09',"f",4),
("Dermand","Celine",'1994-11-02',"f",1),
("Laclasse","Anne",'1515-04-02',"f",1),
("Nourri","Charles",'1901-04-02',"m",1),
("Laur","Suze",'1905-04-02',"f",4),
("Demande","Celin",'1700-04-02',"m",1),
("Lac","Annette",'1789-04-02',"f",1),
("Mourri","Chars",'1915-04-02',"m",1),
("Cazan","Bernardo",'700-04-02',"m",2);

SELECT * FROM soldat WHERE sexe = 'm';

SELECT * FROM soldat WHERE date_naissance > '1995';

SELECT UPPER(nom) FROM soldat;

UPDATE soldat SET nom = UPPER(nom);

DELETE FROM soldat WHERE date_naissance IS NOT NULL order by date_naissance asc LIMIT 2;

insert into soldat values
("Laclasse","Anne",'1515-04-02',"f",1),
("Caz","Berno",'700-04-02',"m",2),
("Laclse","An",'1535-04-02',"f",1),
("Ca","Bardo",'740-04-02',"m",2);

UPDATE soldat SET grade = grade + 1 WHERE grade != 5;

UPDATE soldat SET grade = grade - 1 WHERE grade = 3 AND sexe = 'm';

UPDATE soldat SET date_naissance = ADDDATE(date_naissance, INTERVAL 1 DAY) WHERE grade = 4 AND sexe = 'f';

SELECT * FROM soldat;
