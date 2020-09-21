# Concevez la solution technique d’un système de gestion de pizzeria

### Contexte :

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

---

### Projet :


Pour répondre aux exigences de ce projet, nous nous sommes penchés dans un premier temps sur le **domaine fonctionnel** en nous appuyant notamment sur différents diagrammes **UML**. 
En l'occurrence, pour débuter, le **diagramme de classe** et le **modèle physique de données** (**MPD**).

Pour compléter le document de **spécifications techniques**, nous avons ensuite déterminé l' **architecture technique** par l'intermédiaire d'un **diagramme de composant** et enfin un **diagramme de déploiement**.

Pour terminer, nous avons mis en application le schéma de **base de données**. Pour cela, sous deux machines virtuelles (**Ubuntu Server 18.04**) distinctes, nous avons procédé à l'installation de deux **SGBDR** (**MySQL** et **PostgreSQL**).
En nous appuyant sur le **MPD**, nous avons créé les scripts de création de la structure, différents par la syntaxe pour les deux **SGBDR**.
Une fois les deux bases de données créées, des requêtes d'insertion de données ont été créés pour rendre les interactions côté base de données le plus crédible possible. A noter que ce script est commun aux deux **SGBDR**.
Suite à cela, nous avons créé des requêtes d'exploitation de la base pour vérifier que la structure correspondait bien aux exigences requises par la demande initiale.
A noter encore que ces requêtes sont également communes aux deux **SGBDR**.

---

### Ressources :

- Les différents diagrammes et le **MPD** sont visibles individuellement dans **./Diagrammes/**
- Ils sont également présents dans le document de spécifications techniques avec leur description (**./specifications_techniques.pdf**)
- Les scripts de création de la structure des bases sont accessibles depuis **./script**
- Les requêtes d'insertion des données sont visibles dans **./script/Requests/Inserts**
- Les requêtes d'exploitation sont visibles dans **./script/Requests/Exploitation**
- Les sauvegardes des bases de données se trouvent dans **./dumps_db**

---

### Restauration des sauvegardes :

Comme demandé dans le projet et pour faciliter la mise en place de la base de données, il existe dans le répertoire **./dumps_db**, une sauvegarde des deux bases de données (**PostgreSQL** et **MySQL**). Ces sauvegardes comprennent donc la structure des bases, ainsi que les données qu'elles contiennent.

- **MySQL**:

	Le fichier **./dumps_db/dump_oc_pizza_mysql.sql** contient la sauvegarde de la base **MySQL**. 
	Le fichier étant un script SQL, il est possible de l'importer depuis la console **MySQL**. Une fois connectée sur celle-ci : 

		SOURCE dump_oc_pizza_mysql.sql

	Attention, cela nécessite de se retrouver initialement dans le même répertoire que le script SQL. Sinon, préciser le chemin avant le nom du script SQL (  **/(path)/(script_name.sql)** )
	
	Il est également possible d'importer le script en utilisant une application type **PHPMyAdmin**. Dans le cas présent, il suffit de cliquer sur **"Import"**, **"Choisir un fichier"** puis ouvrir alors le script SQL, et enfin **"Exécuter"**.

- **PostgreSQL**:

	La sauvegarde de la base PostgreSQL est-elle contenue dans le fichier **./dumps_db/dump_oc_pizza_psql.dump**.
	Ce fichier étant un dump "**Custom**" de la base, il se comporte différemment de la sauvegarde **MySQL**. En effet, nous aurions pu choisir de créer le même type de fichier SQL, mais l'import depuis **PgAdmin4** ne semble pas fonctionner de cette façon. J'ai donc fait ce choix pour ne pas avoir qu'une seule option de restauration de la base.
	
	Sous linux, et notamment une distribution issue de **Debian**, il est possible de le faire de la façon suivante : 


		sudo su - postgres
		psql -c "CREATE DATABASE oc_pizza"
		pg_restore --dbname oc_pizza dump_oc_pizza_psql.dump

	Bien évidemment, les commandes sont à adapter selon le système d'exploitation utilisé, mais elles resteront très proches de celles-ci.
	De la même façon que précédemment, cette commande nécessite de se trouver dans le même répertoire que le fichier de sauvegarde lui-même. Sinon, il faudra également préciser le chemin avant le nom de la sauvegarde (  **/(path)/(script_name.dump)** )

	Il est également possible de l'importer depuis **PgAdmin**. Pour cela créer une base de données **oc_pizza** en se positionnant sur "**Databases**" ---> clic droit ---> "**Create**" ---> "**Database...**"
	Renseigner ensuite le nom de la base "**oc_pizza**", puis "**Save**". La base est alors créée.
	Clic droit sur "**oc_pizza**" ---> "**Restore...**" 
	Dans la nouvelle boîte de dialogue, sélectionner le fichier "**Filename**", puis "**Role**" (par défaut **Postgres**) et enfin "**Restore**"

---

### Création de la base et insertion des données :

Il est également possible d'utiliser un script afin de créer la structure de la base de données, puis un autre permettant d'insérer les données de démonstration.
Pour cela, nous avons deux scripts de création de structure de la base, un premier pour **MySQL** (**./script/oc_pizza_struct_mysql.sql**), et un autre pour **PostgreSQL** (**./script/oc_pizza_struct_postgres.sql**)
Concernant l'insertion des données, un seul script permet d'alimenter les deux bases.

Nous partons du principe que les commandes sont exécutées à l'intérieur du répertoire contenant les scripts.

- **MySQL** :
	Il est nécessaire d'utiliser le terminal **MySQL**

		SOURCE oc_pizza_struct_mysql.sql;
		SOURCE requete_insert_all.sql;

	Il est également possible d'utiliser **PHPMyAdmin** pour exécuter les scripts depuis l'onglet SQL

- **PostgreSQL** :
	
		sudo su - postgres
		psql -c "CREATE DATABASE oc_pizza"
		psql -d oc_pizza -f oc_pizza_struct_postgres.sql
		psql -d oc_pizza -f requete_insert_all.sql

	De la même façon que **PMA** pour **MySQL**, il est possible d' exécuter les scripts depuis **PgAdmin**. Il faudra préalablement créer la base de données.