-- PARTIE 1 Exercice Les besoins d'affichage

-- 1

SELECT *
FROM `entcom`
WHERE numfou = 9120;

-- 2

SELECT numfou AS "code fournisseur"
FROM entcom
WHERE numcom;

-- 3

SELECT COUNT(numcom) AS 'nombre de commande', COUNT(DISTINCT(numfou)) AS 'nombre de fournisseurs'
FROM entcom;

-- 4

SELECT codart, libart, stkphy, stkale, qteann
FROM produit
WHERE stkphy <= stkale AND qteann < 1000;

-- 5

SELECT nomfou AS 'nom du fournisseur', posfou AS 'departement'
FROM fournis
WHERE posfou LIKE '75%'
   OR posfou LIKE '78%'
   OR posfou LIKE '92%'
   OR posfou LIKE '77%'
ORDER BY posfou DESC, nomfou ASC;

-- 6

SELECT datcom AS 'commande passées'
FROM entcom
WHERE datcom LIKE '____-03-__%' OR datcom LIKE '____-04-__%';

-- 7

SELECT numcom AS 'numéro de commande', datcom AS 'date de commande'
FROM entcom
WHERE obscom <> '';

-- 8

SELECT numcom AS 'commandes', (qtecde * priuni) AS 'Total'
FROM ligcom
ORDER BY Total DESC;


-- 9

SELECT numcom AS 'numéro de commande', (priuni * qteliv) AS 'total'
FROM ligcom
WHERE (priuni * qteliv) > 10000 AND qteliv >= 1000;

-- 10

SELECT nomfou AS 'nom fournisseur', numcom AS 'numéro de commande', datcom AS 'date de commande'
FROM entcom
         JOIN fournis ON fournis.numfou = entcom.numfou
GROUP BY nomfou;

-- 11

SELECT ligcom.numcom, nomfou, libart, SUM(qtecde * priuni) AS 'Sous total'
FROM produit
         JOIN ligcom ON ligcom.codart = produit.codart
         JOIN entcom ON entcom.numcom = ligcom.numcom
         JOIN fournis ON fournis.numfou = entcom.numfou
WHERE obscom LIKE 'Commande urgente'
GROUP BY libart;

-- 12

SELECT nomfou AS 'nom fournisseur', COUNT(DISTINCT vente.codart) AS 'nombre de commande'
FROM fournis
         JOIN vente ON vente.numfou = fournis.numfou
GROUP BY fournis.nomfou
HAVING COUNT(vente.numfou) > 1;

-- 13

SELECT numcom AS 'numéro de commande', datcom AS 'date commande'
FROM entcom
WHERE numfou IN(
    SELECT numfou
    FROM entcom
    WHERE numcom = 70210
);

-- 14

SELECT codart, prix1 AS 'p1'
FROM vente
WHERE 'p1' < 'p2' AND prix1 IN(
    SELECT prix1 AS 'p2'
    FROM produit
    WHERE codart IN(
        SELECT codart
        FROM produit
        WHERE codart LIKE 'r%'
    )
);

SELECT libart, prix1
FROM produit
         JOIN vente ON vente.codart = produit.codart
WHERE prix1 < 120;

-- 15

SELECT libart AS 'produit', nomfou AS 'fournisseur'
FROM produit
         JOIN vente ON vente.codart = produit.codart
         JOIN fournis ON fournis.numfou = vente.numfou
WHERE produit.stkphy <= (produit.stkale * 1.5);

-- 16

SELECT  nomfou AS 'fournisseur', libart AS 'libelle'
FROM produit
         JOIN vente ON vente.codart = produit.codart
         JOIN fournis ON fournis.numfou = vente.numfou
         JOIN entcom ON entcom.numfou = fournis.numfou
WHERE produit.stkphy <= (produit.stkale * 1.5) AND vente.delliv <= 30;

-- 17

SELECT  nomfou AS 'fournisseur', stkphy AS 'total stock'
FROM produit
         JOIN vente ON vente.codart = produit.codart
         JOIN fournis ON fournis.numfou = vente.numfou
GROUP BY fournisseur
ORDER BY stkphy DESC

-- 18

SELECT libart AS 'produit', qteann AS 'quantité annuelle', qtecde
FROM produit
         JOIN ligcom ON ligcom.codart = produit.codart
WHERE qtecde > (qteann * 0.9)
ORDER BY qteann DESC;

-- 19

SELECT numfou AS 'fournisseur', ((priuni * qtecde)* 1.20) AS 'ca'
FROM entcom
         JOIN ligcom ON ligcom.numcom = entcom.numcom
GROUP BY numfou;

-- PARTIE 2 Mise à jour de données

-- 1

UPDATE vente
SET vente.prix1 = vente.prix1 * 1.04 AND vente.prix2 = vente.prix2 * 1.02
WHERE numfou = 9180;

-- 2

UPDATE vente
SET vente.prix2 = vente.prix1
WHERE vente.prix2 = 0;

-- 3

UPDATE entcom
    JOIN fournis ON fournis.numfou = entcom.numfou
    SET entcom.obscom = '*****'
WHERE fournis.satisf < 5;

-- 4

DELETE FROM vente
WHERE codart
          IN
      (SELECT codart FROM produit
       WHERE (codart LIKE 'I110%'));