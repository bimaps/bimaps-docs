---
layout: "guide"
tags: guide
title: "Viewer manager"
menuOrder: 4
---


# BIM état : Manager

## Vue d'ensemble du site

![admin-site.png](/images/old/admin-site.png)

La zone de l'écran est partagées en 4 zones

1. A gauche : Menu de navigation
2. En haut à droite : Toolbar
3. Au milieu à droite : Objet 3D
4. En bas à droite : Barre d'état



## Toolbar


### Navigation

![admin-navigation.png](/images/old/admin-navigation.png)

1. Zoom 3D : zoom sur l'ensemble de l'objet
2. Zoom Top : affichage de l'objet avec une vue 2D (vue d'en haut)

### Sélection

![admin-selection.png](/images/old/admin-selection.png)

1. All : sélectionner tous les objets
2. Clear : effacer la sélection
3. Add : ajouter des objets à la sélection
4. Remove : supprimer des objets de la sélection
5. Style : choix du style de la sélection
6. Children : pour les objets groupe, ouvre le groupe (permet de sélectionner les objets enfants)

### Transform

#### Translate : Déplacer les objets selon un axe

![admin-transform.png](/images/old/admin-transform.png)

#### Rotation / manual : rotation selon un axe et un angle

![admin-rotation.png](/images/old/admin-rotation.png)




## Light & camera

![admin-light-camera.png](/images/old/admin-light-camera.png)

* Configuration des lumières et caméra du site


## Themes

![admin-themes.png](/images/old/admin-themes.png)

* Ajouter un nouveau thèmes

![admin-rules.png](/images/old/admin-rules.png)

* Ajouter une nouvelle règle


![admin-rule.png](/images/old/admin-rule.png)

* Ajouter des conditions (clic sur l'icone à gauche du champ pour charger des valeurs)


![admin-style1.png](/images/old/admin-style1.png)

* Sélectionner un style
* Choisir paramètre (Exclusive, last : éliminatoire,appliquée aux enfants, active)



## Styles

![admin-style2.png](/images/old/admin-style2.png)

* Choix du nom du style
* Choix de l'affichage (Inherit : héritage, Show : affiché, Hide : caché)
* Material : couleur, opacité
* Label : ajout d'une étiquette
* Icon : ajout d'icône
* Geometry : remplacement de la géomètrie

### Label
Pour ajouter un label avec des champs personnalisés saisir les clés dans `Label Template` (le champ est priorités sur `Label Key`)

Exemples de combinaison : `#{object:userData.name}: #{object:userData.pset.Surface:round:2}m²`

**Formatage arrondi >  round:x**
- clé : round
- valeur x: nombre de décimal
- Exemple : `#{object:userData.pset.Surface:round:2}`

**Formatage date > date:dd-mm-yyyy**
- clé : date
- valeur format : selon standard de formatage de date
- Exemple : `#{object:userData.pset.Modified:date:dd-mm-yyyy}`

## Site Settings

![admin-settings.png](/images/old/admin-settings.png)

* Affichage de l'ID du site (lecture seul)
* Affichage du nom du site
* Import / export des configurations du sites (thèmes, styles, check, rapport)
* Ouverture dans le visualisateur (Viewer)


### Import / Export des configurations
![admin-settings-export.png](/images/old/admin-settings-export.png)

* Si les styles/checks existent déjà, ils ne sont pas importés sauf si on les coche (dans ce cas, ils sont mis à jours)

## Checker

### Ajouter un check
![admin-checker-add.png](/images/old/admin-checker-add.png)

1. Titre  du check

2. Condition de sélection (filtre). Les conditions s'additionnent (x et y)

3. Opération du check
   - count : compte le nombre d'objets trouvés
   - compare-key-value : comparaison de valeur d'une clé
   - add-key-value :  addition des valeurs de clés
   - autre à développer ...
   
4. Expression mathématique : une expression mathématique permet de modifier le résultat selon une formule ([voir la documentation de MathJS](https://mathjs.org/docs/expressions/syntax.html))

    Variables disponibles (écriture exact, y compris majuscule) :
    - `value` : valeur de l'opération 
    - `nbValid` ou `nbInvalid` : nombre d'élément valide ou invalide selon l'opération
    - `nbItems` : nombre d'élément total


 
Remarque : Pour télécharger le rapport d'un seul check cliquer sur la flèche à côté du check,sinon aller dans le menu Rapport (Reports).

## Rapports
![admin-reports-add.png](/images/old/admin-reports-add.png)
1. Titre du rapport
2. Description du rapport
3. Ajouter les check qui seront affichés sur le rapport
4. Sauver
5. Cliquer sur la flèche pour télécharger le PDF


## Scene

![admin-scene.png](/images/old/admin-scene.png)

1. Supprimer les objets de la vue (uniquement actif au niveau l'affichage
2. Chargement d'objet en local
3. Importation d'un Cube (exemple de géomètrie)
4. Importation de groupe et cubes (exemple de géomètrie)
5. Importation d'objets (exemple de géomètrie)
6. Supprimer les nuages de points
7. Chargement de nuage de points



## API

![admin-api.png](/images/old/admin-api.png)

1. Download objects : Téléchargement des objets enregistré dans l'API (base de donnée)
2. Upload objects : Envoi des objets pour enregistrer dans l'API (base de donnée)
3. Upload from file : Envoi d'un fichier IFC, après la fin du chargement, clic sur `Download objects` pour afficher les objets dans la vue
4. Delete data : Suppression des données dans l'API
5. Delete site : suppresion de tous le site (Attention)
6. Save : Enregistrer





