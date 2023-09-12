-- 1

CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
    SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
    UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
END;

-- on vérifie si le trigger fonctionne bien
insert into lignedecommande(id_commande, id_produit, quantite, prix) VALUES (1, 2, 23, 145);

-- 2

CREATE TRIGGER maj_total_update AFTER UPDATE ON lignedecommande
    FOR EACH ROW
BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
    SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
    UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
END;

-- on modifie le trigger pour modifier un produit et mettre à jour le total

update lignedecommande
set prix = 1222
where id_produit = 2;

-- Pour delete

CREATE TRIGGER maj_total_delete AFTER UPDATE ON lignedecommande
    FOR EACH ROW
BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
    SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
    UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
END;

-- 3

