-- exercice 1

START TRANSACTION;

SELECT nomfou FROM fournis WHERE numfou=120;

UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120

SELECT nomfou FROM fournis WHERE numfou=120


select nomfou from fournis
where numfou= 120

-- Non la transaction n'est pas terminé, pour la terminer il faut faire un commit ou un rollback
-- Pour la rendre permanente il faut faire un commit
-- Pour l'annuler il faut fair un rollback

-- exercice 2

-- Il ne peuvent pas y accéder car la transaction est isolé tant qu'elle n'est pas terminé
