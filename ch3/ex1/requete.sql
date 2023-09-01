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







