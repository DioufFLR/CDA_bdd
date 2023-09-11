---- Exercice 1

-- On crée la procédure stockée

delimiter |

create procedure Lst_fournis()
begin
select numfou, numcom from entcom;
end |

delimiter ;

-- On exécute la procédure stockée

call Lst_fournis();

-- On affiche les informations de la procédure stockée

SHOW CREATE PROCEDURE Lst_fournis;

---- Exercice 2



---- Exercice 3

delimiter |

create procedure CA_Fournisseur(
    in numfou int,
    in datcom char(4)
)
begin
select numfou as 'fournisseur', ((priuni * qtecde)* 1.20) as 'ca'
FROM entcom
         join ligcom on ligcom.numcom = entcom.numcom
group by numfou;
end |

delimiter ;

call CA_Fournisseur(120, '2008');
