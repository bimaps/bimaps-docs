---
layout: "guide"
tags: guide
title: "Viewer"
menuOrder: 3
---

# BIM état : Viewer



## Vue d'ensemble

 ![viewer-all.png](/images/old/viewer-all.png)
 
### Barre d'outils (gauche)
1. Recherche : Filtre dynamique par nom ou type d'objet 
2. Afficher la vue de départ (zoom général)
3. Thèmes : sélection de thèmes existant
4. Filtre : filtre avancé par des requêtes sur le méta-data
5. Gestionnaire BCF : créer, editer, exporter

### Zone d'affichage 3D

#### Navigation avec la souris :mouse:
* :repeat: `Clic gauche` Orbite, rotation 3D des objets
* :left_right_arrow: `Clic droite` Déplacer les objets 
* :mag_right: `Roulette` zoom avant/arrière 

#### Navigation tactile :iphone:
* :repeat: `1 doigt` Orbite, rotation 3D des objets 
* :left_right_arrow: `2 doigts` Déplacer les objets 
* :mag_right: `2 doigts, écarter/pincer` zoom avant/arrière 



## Recherche

![viewer-search.png](/images/old/viewer-search.png)

* Saisir le nom ou le type de l'objet pour un filtrage dynamique dans la vue 3D.



## Thèmes

![viewer-theme.png](/images/old/viewer-theme.png)

* Sélection du thème pour afficher des filtres et styles pré-configurés.


## Filtres avancés

![viewer-filter.png](/images/old/viewer-filter.png)

### Créer une condition

1. Ajouter une nouvelle condition :heavy_plus_sign:
2. Choisir la clé (clic sur l'icône à droite pour afficher une liste de valeurs existantes)
3. Choisir l'opérateur (plus grand, contient, égalité, inégalité, plus petit)
4. Saisir la valeur pour que la condition soit vrai

Il est possible d'ajouter plusieurs conditions.


## BCF Manager

### Topics

![viewer-bcf-topic.png](/images/old/viewer-bcf-topic.png)

1. Ajouter un Topic (problème)
2. clic sur le Topic (problème) pour ajouter des commentaires et Viewpoint (point de vue)


### Commentaires

![viewer-bcf-com.png](/images/old/viewer-bcf-com.png)

1. Nouveau commentaire
2. Créer un Viewpoint (point de vue)
3. Clic sur la flèche :arrow_forward: pour démarrer la sélection des objets
4. Si l'objet est un groupe, clic sur la flèche :arrow_heading_down: pour ouvrir le groupe
5. Clic sur les objets 3D pour les ajouters dans le listing
6. Dans le listing : ajouter les objets souhaités avec un clic sur le plus :heavy_plus_sign:
7. Sauver/enregistrer le commentaire


### Export en fichier BCF 2.1

![viewer-bcf-export.png](/images/old/viewer-bcf-export.png)

* Clic sur le bouton Export BCF
* L'exportation permet de télécharger un fichier [BCF selon la version de la norme 2.1](https://github.com/buildingSMART/BCF-XML)

