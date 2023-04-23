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

Avant toute chose, j'ai utilisé ce que je connaissais le mieux afin de structurer mon application à j'ai utilisé le MVC (j'ai etudié le MVVM mais je préfére partir sur ce que je connais afin d'atteindre l'objectif), tu y trouveras un dossier Model, Vue et Service(Controller). L'avantage, selon mes connaissances, est celui de pouvoir faire tampon avec les données reçues depuis l'API GraphQL en choississant celles que je veux afficher dans ma vue. Ce qui est, selon moi un avantage, s'il faut changer le GraphQL par une autre technologie. Anticipation du temps de réalisation d'un changement de technologie au moyen/long terme.

# Questionnement
A l'avant veille de rendre ce projet, une question concernant le système de déployement de l'application en gratuite et payante à commencer à me trotter dans la tête. Un appel auprès d'Antoine aura été nécessaire afin de communiquer sur ce que j'ai utilisé: un bouton qui fait le switch d'une version à l'autre mais vraisemblablement il aurait été plus "mobile friendly" d'utiliser un équivalent de ce qui se fait en web avec webpack notamment. 

Ma réflexion sur ce que j'aurais fais dans ce cas: Deux dossiers (comportants respectivements les différentes versionsd) au sein de mon projet: l'un FREE et l'autre PAID afin de pouvoir choisir l'un ou l'autre a l'aide de variable: if FREE / elseif PAID / endif

Et j'aurais pu utiliser la fonction de préprocesseur OTHER_SWIFT_FLAGS dans les paramètres de build du projet. Par exemple, j'aurais ajouter -DFREE dans les paramètres de build de la version gratuite et -DPAID dans les paramètres de build de la version payante. J'aurais ensuite ciblé les dossiers avec leurs paramètres de build respesctif.

Ceci reste une idée, nous pourrons echanger dessus lors du procain point.

# Couleurs, style et payettes

Pour cette exercice, et comme il me l'a été demandé en consigne je ne me suis pas focus sur le style en tant que tel, pas d'import de police, pas de couleur vert fluo, j'ai voulu faire simple et efficace. Je m'amuserais a améliorer le design une fois l'évaluation terminée afin de me perfectionner.

# Test

Concernant les tests, j'ai commencé par les tests unitaires couvrant: le modèle, le service, la liste et le details des personnages a l'aide de fonctions simples retournant true ou false. Puis j'ai appris car tout nouveau pour moi a me servir des tests UI, j'ai procédé a l'enregistrement du test via le bouton record et j'ai pu ensuite adapter le test a ce que je voulais tester comme pour les tests unitaires à l'aide d'AssertTrue/False.

# Les difficultés

La seule reelle difficulté que j'ai rencontré a été celle de la configuration de projet, j'ai commnencé réellement à coder le 16 avril, j'ai passé presque 1 semaine a regarder des tutoriels Youtube, Stackeoverflow et des forums mais impossible de mettre la main sur de la configuration qui fonctionne. L'intervention d'un expert aura été primordiale au déblocage (premier contact tres enrichissant). J'ai egalement passé 2 semaines en amont a me former sur la plateforme Udemy, oú j'y ai validé mon certificat attestant de la réussite de cette formation SwiftUi/iOS16.

# Conclusion

Quel pied ! Apprentissage, difficultes et plaisir auront été les maitres môts sur ce projet. Repartir à zéro n'est jamais simple mais passant du java au swift on ne peut qu'admirer le confort de travail qui s'offre a nous. Ce projet a confirmé mon choix de me specialiser en swift/swiftui et je remercie Ippon pour cette opportunité de progresser grâce à ce genre de challenge. En attente de pouvoir apprendre je reste a disposition pour un eventuel call afin d'echanger autour de ce sujet.

# Lorsqu’il n’y a pas d’ennemi à l’intérieur, les ennemis de l’extérieur ne peuvent pas t’atteindre (proverbe africain)
