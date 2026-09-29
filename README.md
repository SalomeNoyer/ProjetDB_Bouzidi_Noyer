#### **Règles métier et le dictionnaire de données.**





###### **Règles métier:**

**Pilotes**

• Chaque pilote est identifié par un numéro de licence unique délivré par la fédération.

• Pour chaque pilote, on enregistre son nom, son prénom, son âge, son sexe (homme ou femme) et sa nationalité.

• Un pilote court pour une seule écurie à la fois durant une saison.

• Un pilote peut changer d'écurie d'une saison à l'autre : on conserve donc l'historique des écuries pour lesquelles il a couru.

• Chaque pilote porte un numéro de course, choisi par lui et valable pour toute sa carrière.

• Certaines pilotes féminines sont issues du programme de formation de la fédération (l'académie) ; on souhaite savoir si c'est le cas et quelle année elles ont intégré ce programme.



**Écuries**

• Le championnat compte 10 écuries au maximum.

• Chaque écurie a un nom unique, un pays d'origine, un directeur d'écurie et une année de création.

• Chaque écurie doit obligatoirement aligner deux pilotes par saison : un homme ET une femme. Elle ne peut en avoir ni plus ni moins.

• Chaque écurie a une couleur officielle, que l'on affiche sur le site. Saisons, Grands Prix et circuits

• Le championnat se déroule par saisons, identifiées par leur année.

• Au cours d'une saison, plusieurs Grands Prix sont organisés, à des dates différentes, dans un ordre précis (numéro de manche).

• Chaque Grand Prix a un nom officiel (par exemple « Grand Prix de France ») et se dispute sur un seul circuit.

• Un même circuit peut accueillir des Grands Prix lors de plusieurs saisons.

• Un circuit est décrit par son nom, sa ville, son pays, sa longueur en kilomètres et le nombre de tours de course.



**Résultats des Grands Prix**

• À l'issue de chaque Grand Prix, on enregistre pour chaque pilote engagé : sa position d'arrivée, son temps de course, ou son abandon éventuel (avec le motif).

• On enregistre aussi la position de départ (grille) de chaque pilote.

• Les points sont attribués selon la position d'arrivée, d'après un barème fixé par la fédération (par exemple 25 points au premier, 18 au deuxième, etc.).

• Un point supplémentaire est accordé au pilote ayant réalisé le meilleur tour en course, s'il termine dans les 10 premiers.

• Un pilote qui n'a pas pris le départ ou qui a été disqualifié n'a pas de position d'arrivée et ne marque aucun point.



**Chronos**

• Pour chaque circuit, on conserve le chrono du meilleur tour jamais réalisé (le record du circuit), avec le pilote qui l'a réalisé et l'année.

• Pour chaque Grand Prix, on enregistre aussi le meilleur tour de la course, le pilote qui l'a réalisé et le numéro du tour.

• Un chrono est exprimé en minutes, secondes et millièmes de seconde.



**Classements**

• Le classement des pilotes est établi après chaque Grand Prix : c'est le total des points marqués par le pilote depuis le début de la saison.

• Le classement des écuries est établi après chaque Grand Prix : c'est le total des points marqués par les deux pilotes de l'écurie depuis le début de la saison.

• En cas d'égalité de points, on départage par le nombre de victoires, puis de deuxièmes places, etc.

• À la fin de la saison, le pilote et l'écurie ayant le plus de points sont sacrés champions du monde.

• On conserve les classements de toutes les saisons passées.



**Publication**

• Le site web de la fédération affiche les résultats, les classements, la fiche de chaque pilote et de chaque écurie, ainsi que les records par circuit.

• Une rubrique dédiée met en avant les pilotes féminines et le programme de formation.





###### **Dictionnaire de données**



***N° \~ Signification de la donnée 						\~ Type 			\~ Taille***

1  \~ Numéro de licence du pilote 						\~ Alphanumérique 	\~ 8 caractères

2  \~ Nom du pilote 								\~ Alphabétique 		\~ 40 caractères

3  \~ Prénom du pilote 								\~ Alphabétique 		\~ 30 caractères

4  \~ Âge du pilote 								\~ Entier 		\~ 2 chiffres

5  \~ Sexe du pilote (H ou F) 							\~ Alphabétique 		\~ 1 caractère

6  \~ Nationalité du pilote 							\~ Alphabétique 		\~ 30 caractères

7  \~ Numéro de course du pilote 						\~ Entier 		\~ 2 chiffres

8  \~ Pilote issu de l'académie (O/N) 						\~ Alphabétique 		\~ 1 caractère

9  \~ Année d'entrée à l'académie 						\~ entier 		\~ 4 chiffres

10 \~ Nom de l'écurie 								\~ Alphanumérique 	\~ 40 caractères

11 \~ Pays d'origine de l'écurie 						\~ Alphabétique 		\~ 30 caractères

12 \~ Nom du directeur d'écurie 							\~ Alphabétique 		\~ 50 caractères

13 \~ Année de création de l'écurie 						\~ Entier 		\~ 4 chiffres

14 \~ Couleur officielle de l'écurie (code hexadécimal) 				\~ Alphanumérique 	\~ 7 caractères

15 \~ Année de la saison 							\~ Entier 		\~ 4 chiffres

16 \~ Numéro de la manche dans la saison 					\~ Entier 		\~ 2 chiffres

17 \~ Nom officiel du Grand Prix 						\~ Alphanumérique 	\~ 60 caractères

18 \~ Date du Grand Prix 							\~ Date (JJ/MM/AAAA) 	\~ 10 caractères

19 \~ Nom du circuit 								\~ Alphanumérique 	\~ 50 caractères

20 \~ Ville du circuit 								\~ Alphabétique 		\~ 40 caractères

21 \~ Pays du circuit 								\~ Alphabétique 		\~ 30 caractères

22 \~ Longueur du circuit en km 							\~ Décimal 		\~ 5 chiffres (dont 3 décimales)

23 \~ Nombre de tours de la course 						\~ Entier \~ 3 chiffres

24 \~ Position de départ (grille) du pilote 					\~ Entier \~ 2 chiffres

25 \~ Position d'arrivée du pilote 						\~ Entier \~ 2 chiffres

26 \~ Temps de course du pilote 							\~ Durée (HH:MM:SS.mmm) \~ 12 caractères

27 \~ Statut du pilote à l'arrivée (classé, abandon, disqualifié, non-partant) 	\~ Alphabétique \~ 15 caractères

28 \~ Motif de l'abandon 							\~ Alphanumérique \~ 100 caractères

29 \~ Points marqués par le pilote sur le Grand Prix 				\~ Décimal \~ 3 chiffres (dont 1 décimale)

30 \~ Chrono du meilleur tour de la course 					\~ Durée (M:SS.mmm) \~ 8 caractères

31 \~ Numéro du tour du meilleur tour 						\~ Entier \~ 3 chiffres

32 \~ Chrono du record du circuit 						\~ Durée (M:SS.mmm) \~ 8 caractères

33 \~ Année du record du circuit 						\~ Entier \~ 4 chiffres

34 \~ Position du pilote au classement général 					\~ Entier \~ 2 chiffres

35 \~ Total de points cumulés (pilote ou écurie) 				\~ Décimal \~ 4 chiffres (dont 1 décimale)

