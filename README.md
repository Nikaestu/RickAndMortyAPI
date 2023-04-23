# RickAndMortyAPI

# Les consignes reçues:

Réalisation d’une application fan de la série rick & morty
Un écran d'accueil présentant les personnages de la série, scrollable
Au clic sur un personnage, affichage de son détail - API graphQL à utiliser : https://rickandmortyapi.com/documentation/#graphql (utiliser la version graphql)
Il doit pouvoir être possible de déployer deux applications, l'une "Gratuite" ou les composants sont en noirs et blanc et une "Premium" ou l'appli possède une charte graphique colorée.
Règle métier 1 : les personnages au statut inconnu doivent être enlevés de la liste de résultat
Règle métier 2 : les personnages doivent avoir leur nom affiché en majuscules
Règle métier 3 : pour mettre rick et morty en avant, les personnages dont l’espèce est ‘Human’ doivent aussi avoir leur prénom en majuscules
Règle métier 4 : En mode "Gratuite", l'application affiche l'initiale du prénom du personnage à la place de son image

Dans le but de faire une app pérenne, l’architecture et la qualité de l’application sont primordiales. L’aspect esthétique de l’UI est secondaire ;-)

# Structure

Avant toute chose, j'ai utilisé ce que je connaissais le mieux afin de structurer mon application à savoir une structure en MVC, tu y trouveras un dossier Model, Vue et Service(Controller). L'avantage selon mes connaissances est celui de pouvoir faire tampon avec les données reçues depuis l'API GraphQL en choississant celles que je veux afficher sur ma vue. Ce qui est, pour moi, un avantage s'il faut changer le GraphQL en autre chose: Maintenabilité meilleure je trouve.

Pour info, j'ai également pris connaissance du MVVM mais voulant réussir l'objectif à tout pris j'ai choisi la sécurité.

# Questionnement
A l'avant veille de rendre ce projet, une question concernant le système de déployement de l'app en gratuite et payante à commencer à me trotter dans la tête. Un appel auprès d'Antoine à été fait afin de lui communiquer sur ce que j'ai utilisé: un bouton qui fait le switch d'une version à l'autre mais vraisemblablement il aurait été plus "mobile friendly" d'utiliser un équivalent de ce qui se fait en web avec webpack notamment. 

Ma réflexion sur ce que j'aurais fais (par manque de temps): Deux dossiers (comportants respectivements les différentes versionsd) au sein de mon projet: l'un FREE et l'autre PAID afin de pouvoir choisir l'un ou l'autre a l'aide de variable: if FREE / elseif PAID / endif

Et j'aurais pu utiliser la fonction de préprocesseur OTHER_SWIFT_FLAGS dans les paramètres de build du projet. Par exemple, j'aurais ajouter -DFREE dans les paramètres de build de la version gratuite et -DPAID dans les paramètres de build de la version payante. J'aurais ensuite ciblé les dossiers avec leurs paramètres de build respesctif.

Ceci reste une idé
Et j'aurais pu utiliser la fonction de préprocesseur OTHER_SWIFT_FLAGS dans les paramètres de build du projet. Par exemple, j'aurais ajouter -DFREE dans les paramètres de build de la version gratuite et -DPAID dans les paramètres de build de la version payante. J'aurais ensuite ciblé les dossiers avec leurs paramètres de build respectif. Ceci reste une idée autour de laquelle j'espère pouvoir débattre prochainement.

# Test

Concernant les tests, j'ai commencé par les tests unitaires couvrant: le modele, le service, la liste et le details des personnages a l'aide de fonctions simples retournant true ou false. Puis j'ai appris car tout nouveau pour moi a me servir des tests UI, j'ai procede a l'enregistrement du test via le bouton record et j'ai pu ensuite adapter le test a ce que je voulais tester comme pour les tests unitaires a l'aide d'AssertTrue/False.
