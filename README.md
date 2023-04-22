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

Avant toute chose, j'ai utilisé ce que je connaissais le mieux ici à savoir une structure en MVC, tu y trouveras un dossier Model, Vue et Service(Controller). L'avantage ici est celui de pouvoir faire tampon avec les données reçues depuis l'API GraphQL en choississant les données que je veux afficher a mon ecran et de ne pas devoir utiliser tout ce qui est renvoyé. Ce qui est un avantage s'il faut changer le GraphQL en autre chose par exemple ;).

# Questionnement
A l'avant veille de rendre ce projet, une question concernant le système de déployement de l'app en gratuite et payante m'est arrivée. Un appel auprès d'Antoine à été fait pour lui communiquer le fait que j'utilisé un bouton afin de faire le switch mais vraisemblablement il aurait été plus mobile friendly d'utiliser un équivalent de ce qui se fait en web avec webpack notemment. Pour ça je serais partis sur deux dossier au sein de mon projet: l'un FREE et l'autre PERMIUM afin de pouvoir choisir l'unw ou l'autre a l'aide de variable: /freeApp et /paidApp et un :
#if FREE

#elseif PAID

#endif
afin de choisir l'une ou l'autre.
