-- 1

CREATE VIEW v_GlobalCde
AS
SELECT codart, qtecde AS 'quantitéTotalCde', (qtecde * priuni) AS 'prixTotal' FROM ligcom
ORDER BY `prixTotal` DESC;

-- 2

CREATE VIEW v_VentesI100
AS
SELECT * FROM vente
WHERE codart = 'I100';

-- 3

CREATE VIEW v_VentesI100Grobrigan
AS
SELECT * FROM v_VentesI100
WHERE numfou = 00120;