# Concevez la solution technique d’un système de gestion de pizzeria

### Contexte

« **OC Pizza** » est un jeune groupe de pizzeria en plein essor et spécialisé dans les pizzas livrées ou à emporter. Il compte déjà 5 points de vente et prévoit d’en ouvrir au moins 3 de plus d’ici la fin de l’année. Un des responsables du groupe a pris contact avec vous afin de mettre en place un système informatique, déployé dans toutes ses pizzerias et qui lui permettrait notamment :

-   d’être plus efficace dans la **gestion des commandes**, de leur réception à leur livraison en passant par leur préparation ;
-   de suivre en temps réel les commandes passées et en préparation ;
-   de suivre en temps réel le **stock** d’ingrédients restants pour savoir quelles pizzas sont encore réalisables ;
-   de proposer un site Internet pour que les clients puissent :
    -   passer leurs commandes, en plus de la prise de commande par téléphone ou sur place
    -   payer en ligne leur commande s’ils le souhaitent – sinon, ils paieront directement à la livraison
    -   modifier ou annuler leur commande tant que celle-ci n’a pas été préparée
-   de proposer un **aide-mémoire** aux pizzaïolos indiquant la recette de chaque pizza
-   d’informer ou notifier les clients sur l’état de leur commande

### Projet

Pour répondre aux exigences de ce projet, nous nous sommes penchés dans un premier temps sur le **domaine fonctionnel** en nous appuyant notamment sur différents diagrammes **UML**. 
En l'occurrence, pour débuter, le **diagramme de classe** et le **modèle physique de données** (**MPD**).

Pour compléter le document de **spécifications techniques**, nous avons ensuite déterminé l' **architecture technique** par l'intermédiaire d'un **diagramme de composant** et enfin un **diagramme de déploiement**.

Pour terminer, nous avons mis en application le schéma de **base de données**. Pour cela, sous deux machines virtuelles (**Ubuntu Server 18.04**) distinctes, nous avons procédé à l'installation de deux **SGBDR** (**MySQL** et **PostgreSQL**).
En nous appuyant sur le **MPD**, nous avons créé les scripts de création de la structure, différents par la syntaxe pour les deux **SGBDR**.
Une fois les deux bases de données créées, des requêtes d'insertion de données ont été créés pour rendre les interactions côté base le plus crédible possible. A noter que ce script est commun aux deux **SGBDR**.
Suite à cela, nous avons créé des requêtes d'exploitation de la base pour vérifier que la structure correspondait bien aux exigences requises par la demande initiale.
A noter encore que ces requêtes sont également communes aux deux **SGBDR**.

### Ressources

- Les différents diagrammes et le **MPD** sont visibles individuellement dans **./Diagrammes/**
- Ils sont également présents dans le document de spécifications techniques avec leur description (**./specifications_techniques.pdf**)
- Les scripts de création de la structure des bases sont accessibles depuis **./script**
- Les requêtes d'insertion des données sont visibles dans **./script/Requests/Inserts**
- Les requêtes d'exploitation sont visibles dans **./script/Requests/Exploitation**

