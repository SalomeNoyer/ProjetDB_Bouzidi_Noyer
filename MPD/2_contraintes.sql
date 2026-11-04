USE f1DB;

ALTER TABLE Pilote
ADD CONSTRAINT chk_pilote_age 
CHECK (Age_du_pilote BETWEEN 16 AND 80);

ALTER TABLE Pilote
ADD CONSTRAINT chk_pilote_sexe 
CHECK (Sexe_du_pilote IN ('M', 'F', 'Autre') OR Sexe_du_pilote IS NULL);

ALTER TABLE Pilote
ADD CONSTRAINT chk_pilote_classement 
CHECK (position_classement_general > 0 OR position_classement_general IS NULL);

ALTER TABLE Pilote
ADD CONSTRAINT chk_pilote_score 
CHECK (score_actuel_du_championnat >= 0 OR score_actuel_du_championnat IS NULL);

ALTER TABLE academie
ADD CONSTRAINT chk_academie_annees 
CHECK (annee_sortie_academie >= annee_entre_academie OR annee_sortie_academie IS NULL);

ALTER TABLE Circuit
ADD CONSTRAINT chk_circuit_tours 
CHECK (nombre_tour_circuit > 0);

ALTER TABLE Circuit
ADD CONSTRAINT chk_circuit_longueur 
CHECK (longueur_circuit > 0);

ALTER TABLE record_du_circuit
ADD CONSTRAINT chk_record_annee 
CHECK (annee_record >= 1950);

ALTER TABLE participer
ADD CONSTRAINT chk_participer_positions 
CHECK (pole_de_depart > 0 AND pole_arrivee > 0);

ALTER TABLE participer
ADD CONSTRAINT chk_participer_points 
CHECK (points >= 0);