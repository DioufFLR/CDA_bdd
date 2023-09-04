-- 1

SELECT * FROM employe

-- 2

SELECT * FROM dept

-- 3

SELECT nom, dateemb, nosup, nodep, salaire FROM employe;

-- 4

SELECT titre FROM employe;

-- 5

SELECT DISTINCT titre FROM employe;

-- 6

SELECT nom, noemp, nodep FROM employe
WHERE titre = 'secrétaire';
SELECT nom, titre, nodep, salaire FROM employe
WHERE (titre = 'représentant' OR titre = 'secrétaire')
AND nodep = '34';

-- 8

SELECT nom, prenom FROM employe WHERE nom < prenom;

-- 9

SELECT employe.nom, employe.salaire, employe.nodep FROM employe
WHERE employe.titre = 'représentant' 
AND employe.nodep = '35' 
AND employe.salaire > 20000;

-- 10

SELECT nom, titre, salaire FROM employe
WHERE employe.titre = 'représentant'
OR employe.titre = 'président';

-- 11

SELECT nom, titre, nodep, salaire FROM employe
WHERE nodep = '34' 
AND (titre = 'représentant' OR titre = 'secrétaire');

-- 12

SELECT nom, titre, nodep, salaire FROM employe
WHERE (titre = 'représentant' OR titre = 'secrétaire')
AND nodep = '34';

-- 13

SELECT nom, salaire FROM employe
WHERE salaire BETWEEN 20000 AND 30000;

-- 14 pas d'énoncé

-- 15

SELECT nom FROM employe
WHERE nom LIKE 'H%';

-- 16

SELECT nom FROM employe
WHERE nom LIKE '%n';

-- 17

SELECT nom FROM employe
WHERE nom LIKE '__u%';

-- 18

SELECT salaire, nom FROM employe
WHERE nodep = 41
ORDER BY salaire ASC;

-- 19

SELECT salaire, nom FROM employe
WHERE nodep = 41
ORDER BY salaire DESC;

-- 20

SELECT titre, salaire, nom FROM employe
GROUP BY titre ASC
ORDER BY salaire DESC;

-- 21

SELECT tauxcom, salaire, nom FROM employe
ORDER BY tauxcom ASC;

-- 22

SELECT tauxcom, salaire, nom FROM employe
WHERE tauxcom IS NULL;

-- 23

SELECT tauxcom, salaire, nom FROM employe
WHERE tauxcom IS NOT NULL;

-- 24

SELECT nom, salaire, tauxcom, titre FROM employe
WHERE tauxcom < 15;

-- 25

SELECT nom, salaire, tauxcom, titre FROM employe
WHERE tauxcom > 15;

-- 26

SELECT nom, salaire, tauxcom, ((tauxcom * salaire) / 100) AS 'commission' FROM employe
WHERE tauxcom IS NOT NULL;

-- 27

SELECT nom, salaire, tauxcom, ((tauxcom * salaire) / 100) AS 'commission' FROM employe
WHERE tauxcom IS NOT NULL
ORDER BY 'commission' ASC;

-- 28

SELECT concat(prenom, ' ', nom) AS 'employés' FROM employe

-- 29



