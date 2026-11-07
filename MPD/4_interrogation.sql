USE f1DB;

-- Projections et selections --

-- liste des pilotes
SELECT Nom_du_pilote, Prenom_du_pilote, Nationalite_du_pilote
FROM Pilote;

-- pilotes de 25 ans ou plus, du plus jeune au plus age
SELECT Nom_du_pilote, Prenom_du_pilote, Age_du_pilote
FROM Pilote
WHERE Age_du_pilote >= 25
ORDER BY Age_du_pilote ASC;

-- les nationalites representees
SELECT DISTINCT Nationalite_du_pilote
FROM Pilote
ORDER BY Nationalite_du_pilote;

-- pilotes dont le nom commence par M
SELECT Nom_du_pilote, Prenom_du_pilote
FROM Pilote
WHERE Nom_du_pilote LIKE 'M%'
ORDER BY Nom_du_pilote;

-- pilotes de nationalite francaise, italienne ou britannique
SELECT Nom_du_pilote, Prenom_du_pilote, Nationalite_du_pilote
FROM Pilote
WHERE Nationalite_du_pilote IN ('Française', 'Italienne', 'Britannique')
ORDER BY Nationalite_du_pilote, Nom_du_pilote;

-- pilotes de sexe F avec au moins 150 points
SELECT Nom_du_pilote, Prenom_du_pilote, score_actuel_du_championnat
FROM Pilote
WHERE Sexe_du_pilote = 'F' AND score_actuel_du_championnat >= 150
ORDER BY score_actuel_du_championnat DESC;




-- fonction d'agrégation --

-- nombre de pilotes par sexe
SELECT Sexe_du_pilote, COUNT(*) AS nombre_pilotes
FROM Pilote
GROUP BY Sexe_du_pilote;

-- age moyen des pilotes par sexe
SELECT Sexe_du_pilote, ROUND(AVG(Age_du_pilote), 2) AS age_moyen
FROM Pilote
GROUP BY Sexe_du_pilote;

-- nombre de Grands Prix par saison
SELECT Annee_saison, COUNT(*) AS nombre_grands_prix
FROM Grand_Prix
GROUP BY Annee_saison
ORDER BY Annee_saison;

-- nombre de pilotes ayant participe a chaque saison
SELECT Annee_saison, COUNT(DISTINCT Numero_de_licence) AS nombre_pilotes
FROM participer
GROUP BY Annee_saison
ORDER BY Annee_saison;

-- pilotes ayant au moins 100 points cumules
SELECT Sexe_du_pilote, COUNT(*) AS nombre_pilotes
FROM Pilote
GROUP BY Sexe_du_pilote
HAVING AVG(score_actuel_du_championnat) >= 100;




-- jointures --

-- jointure interne : pilote et son ecurie pour 2026
SELECT p.Nom_du_pilote, p.Prenom_du_pilote, e.nom_ecurie
FROM Pilote p
INNER JOIN Engager e ON p.Numero_de_licence = e.Numero_de_licence
WHERE e.Annee_saison = 2026
ORDER BY e.nom_ecurie, p.Nom_du_pilote;

-- jointure interne multiple : pilote, Grand Prix et resultat
SELECT p.Nom_du_pilote, p.Prenom_du_pilote, gp.nom_officiel_GP, gp.Annee_saison, r.pole_arrivee, r.points
FROM Pilote p
INNER JOIN participer r ON p.Numero_de_licence = r.Numero_de_licence
INNER JOIN Grand_Prix gp ON r.Annee_saison = gp.Annee_saison AND r.Numero_de_course = gp.Numero_de_course
WHERE gp.Annee_saison = 2026
ORDER BY gp.Numero_de_course, r.pole_arrivee;

-- jointure externe gauche : toutes les ecuries et leurs pilotes 2026
SELECT e.nom_ecurie, p.Nom_du_pilote, p.Prenom_du_pilote, p.Sexe_du_pilote
FROM Ecurie e
LEFT JOIN Engager eg ON e.nom_ecurie = eg.nom_ecurie AND eg.Annee_saison = 2026
LEFT JOIN Pilote p ON eg.Numero_de_licence = p.Numero_de_licence
ORDER BY e.nom_ecurie, p.Sexe_du_pilote;

-- jointure entre record du circuit et pilote
SELECT c.Nom_du_circuit, p.Nom_du_pilote, p.Prenom_du_pilote, r.chrono_record_tour, r.annee_record
FROM record_du_circuit r
INNER JOIN Circuit c ON r.Nom_du_circuit = c.Nom_du_circuit
INNER JOIN Pilote p ON r.Numero_de_licence = p.Numero_de_licence
ORDER BY r.chrono_record_tour ASC;

-- jointure : pilote, ecurie et resultats de course
SELECT p.Nom_du_pilote, p.Prenom_du_pilote, e.nom_ecurie, r.Annee_saison, r.Numero_de_course, r.pole_arrivee, r.points
FROM Pilote p
INNER JOIN Engager e ON p.Numero_de_licence = e.Numero_de_licence
INNER JOIN participer r ON p.Numero_de_licence = r.Numero_de_licence AND e.Annee_saison = r.Annee_saison
WHERE r.Annee_saison = 2026
ORDER BY r.Numero_de_course, r.pole_arrivee;





-- requêtes imbriquées --

-- NOT IN : pilotes n'ayant jamais abandonne
SELECT p.Nom_du_pilote, p.Prenom_du_pilote
FROM Pilote p
WHERE p.Numero_de_licence NOT IN (
    SELECT r.Numero_de_licence
    FROM participer r
    WHERE r.statut_du_pilote = 'Abandon'
)
ORDER BY p.Nom_du_pilote;

-- EXISTS : pilotes ayant au moins un resultat en 2026
SELECT p.Nom_du_pilote, p.Prenom_du_pilote
FROM Pilote p
WHERE EXISTS (
    SELECT 1
    FROM participer r
    WHERE r.Numero_de_licence = p.Numero_de_licence AND r.Annee_saison = 2026
)
ORDER BY p.Nom_du_pilote;

-- ANY : pilotes ayant plus de points que au moins un pilote de sexe M
SELECT Nom_du_pilote, Prenom_du_pilote, score_actuel_du_championnat
FROM Pilote
WHERE score_actuel_du_championnat > ANY (
    SELECT score_actuel_du_championnat
    FROM Pilote
    WHERE Sexe_du_pilote = 'M'
)
ORDER BY score_actuel_du_championnat DESC;

-- ALL : pilotes ayant plus de points que toutes les pilotes F
SELECT Nom_du_pilote, Prenom_du_pilote, score_actuel_du_championnat
FROM Pilote
WHERE score_actuel_du_championnat > ALL (
    SELECT score_actuel_du_championnat
    FROM Pilote
    WHERE Sexe_du_pilote = 'F'
)
ORDER BY score_actuel_du_championnat DESC;

-- IN imbrique : pilotes ayant participe a un GP de la saison 2025
SELECT Nom_du_pilote, Prenom_du_pilote
FROM Pilote
WHERE Numero_de_licence IN (
    SELECT Numero_de_licence
    FROM participer
    WHERE Annee_saison = 2025
)
ORDER BY Nom_du_pilote;




-- étude du meilleur plan d'exécution --

SELECT e.nom_ecurie, p.Nom_du_pilote, p.Prenom_du_pilote, SUM(r.points) AS total_points
FROM Ecurie e
INNER JOIN Engager eg ON e.nom_ecurie = eg.nom_ecurie
INNER JOIN Pilote p ON eg.Numero_de_licence = p.Numero_de_licence
INNER JOIN participer r ON p.Numero_de_licence = r.Numero_de_licence AND eg.Annee_saison = r.Annee_saison
WHERE eg.Annee_saison = 2026
GROUP BY e.nom_ecurie, p.Numero_de_licence, p.Nom_du_pilote, p.Prenom_du_pilote
ORDER BY total_points DESC;
