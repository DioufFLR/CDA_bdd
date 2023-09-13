---- Exercice 1

-- 1 Liste des français

SELECT customers.CompanyName AS 'Société', customers.ContactName AS 'contact', customers.ContactTitle AS 'Fonction', customers.Phone AS 'Téléphone'
FROM customers
WHERE customers.Country = 'France';

-- 2 Liste des produits vendus par le fournisseur 'Exotic Liquids'

SELECT products.ProductName AS 'Produit', products.UnitPrice AS 'Prix'
FROM products
         JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids';

-- 3 Nombre de produits mis à disposition par les fournisseurs français

SELECT suppliers.CompanyName AS 'Fourinsseur', COUNT(products.SupplierID) AS 'NbreProduits'
FROM suppliers
         JOIN products ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.Country = 'France'
GROUP BY suppliers.CompanyName
ORDER BY NbreProduits DESC;

-- 4 Liste des clients français ayant passé plus de 10 commandes

SELECT customers.CompanyName AS 'Client', COUNT(orders.OrderID) AS 'Nbre commande'
FROM customers
         JOIN orders ON orders.CustomerID = customers.CustomerID
WHERE customers.Country = 'France'
GROUP BY customers.CompanyName
HAVING COUNT(orders.OrderID) > 10;

-- 5 Liste des clients dont le montant cumulé de toutes les commandes passées est supérieur à 3000 $

SELECT  CompanyName as "Client", SUM(UnitPrice * Quantity) as "CA", Country as "Pays"
FROM `customers`
         JOIN `orders` ON orders.CustomerID = customers.CustomerID
         JOIN `order details` ON `order details`.orderID = orders.OrderID
GROUP BY CompanyName HAVING SUM(UnitPrice * Quantity) > 30000
order by CA DESC;

-- 6 Liste des pays dans lesquels des produits fournis par "Exotic liquids"

SELECT ShipCountry
FROM `orders`
         JOIN `order details` ON `order details`.OrderID = orders.OrderID
         JOIN products ON products.ProductID = `order details`.ProductID
         JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids'
GROUP BY ShipCountry;

-- 7 Chiffre d'affaires global sur les ventes de 1997

SELECT SUM(UnitPrice * Quantity) AS "CA"
FROM `order details`
         JOIN orders ON orders.OrderID = `order details`.`OrderID`
WHERE YEAR(OrderDate) = 1997;

-- 8 Chiffre d'affaires détaillé par mois sur les ventes de 1997

SELECT SUM(UnitPrice * Quantity) AS "CA"
FROM `order details`
         JOIN orders ON orders.OrderID = `order details`.`OrderID`
WHERE YEAR(OrderDate) = 1997;


-- 9 A quand remonte la dernière commande du client nommé "Du monde entier"?

SELECT MAX(OrderDate) AS "Date de denière commande"
FROM `orders`
         JOIN customers ON customers.CustomerID = orders.CustomerID
WHERE CompanyName = "Du monde entier";

-- 10 Quel est délai moyen de livraison en jours?

SELECT round(avg(datediff(ShippedDate, OrderDate))) AS "Délai moyen de livraison en jours"
FROM `orders`;

---- Exercice 2

