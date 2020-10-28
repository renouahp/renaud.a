Select "Bonjour bienvenu dans le monde de SQL" as hello;
create database if not exists DWWW_Renaud;
use DWWW_Renaud;

create table if not exists note (
    num int,
    prenom  varchar(32),
    nom  varchar(32),
    sexe  varchar(1),
    mdp varchar(32),
    age  tinyint,
    Note1 int,
    Note2 int,
    Note3 int
);

insert into note values 
(1,"Marc","Dupont","M","df5sdfs",25,15,11,9),
(2,"Paul","Marchand","M","sf5s",32,8,10,16),
(3,"Marie","Laporte","F","klj8jkA5",15,13,17,11),
(4,"Alex","Martin","M","frg16",23,11,12,16),
(5,"Benoit","Dirlos","M","12345",41,9,14,15),
(6,"Yohann","Fergusson","M","Asde5",39,17,16,13),
(7,"Philipe","Dany","M","htyaz_8",19,19,18,12),
(8,"Suzanne","Lacour","F","de4",43,4,11,16),
(9,"Celine","Dermand","F","aqw65",27,11,16,13),
(10,"Anne","Laclasse","F","ytrc9v6b",18,10,9,12),
(11,"Charles","Nourri","M","i5f6z7q",30,7,11,6),
(12,"Bernard","Cazanne","M","abc",52,9,15,9);

SELECT COUNT(*) FROM note;

SELECT * FROM note
ORDER BY nom;

SELECT * FROM note
ORDER BY age;

SELECT prenom, age FROM note
WHERE age > 20;

SELECT prenom, age FROM note
WHERE age >= 18 and age <= 28
ORDER BY age;

SELECT * FROM note
WHERE nom LIKE "D%";

SELECT * FROM note 
WHERE prenom LIKE "M%"
or prenom LIKE "%e";

SELECT CONCAT(prenom, ' ', UPPER(nom)) AS 'prenom NOM'
FROM note ORDER BY age;

SELECT CONCAT(prenom, ' ', LEFT(nom, 1)) AS 'prenom NOM'
FROM note;

SELECT CONCAT(LEFT(prenom, 1), ' ', LEFT(nom, 1)) AS 'prenom NOM', Note1
FROM note ORDER BY Note1;

SELECT CONCAT(LEFT(prenom, 1), ' ', LEFT(nom, 1)) AS 'prenom NOM', Note1 + Note2 + Note3 AS SOMME
FROM note ORDER BY SOMME DESC;

SELECT CONCAT(prenom, ' ', nom) AS 'prenom NOM', (Note1 + Note2 + Note3)/3 AS "SOMME"
FROM note;

SELECT SUM(Note1 + Note2 + Note3)/3/12 AS "SOMME"
FROM note;

SELECT nom, age
FROM note WHERE Note2 > 12 and prenom LIKE "%n%";

SELECT nom
FROM note WHERE Note3 < 10 AND age < 25;

SELECT nom AS 'Password Faible'
FROM note WHERE LENGTH(mdp) < 6;

SELECT nom, age
FROM note WHERE age IN(15, 25, 50);

SELECT nom
FROM note WHERE Note1 > 10 AND Note2 > 10 AND Note3 > 10;

SELECT nom, age
FROM note WHERE age NOT IN (25-45) AND (Note1 < 10 OR Note2 < 10 OR Note3 < 10);

SELECT sexe, AVG(Note1) AS 'Moyenne'
FROM note
GROUP BY sexe;

SELECT sexe, AVG(Note3) AS 'Moyenne'
FROM note
GROUP BY sexe;