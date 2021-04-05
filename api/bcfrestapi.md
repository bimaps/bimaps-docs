---
layout: "api"
tags: bcfrestapi
title: "BCF REST API documentation"
permalink: /api/bcfrestapi
---


## BCF REST API


* [Paramètres principaux](#paramètres-principaux)
* [Login](#login)
* [Requêtes BCF REST API](#requêtes-bcf-rest-api)
* [Processus pour créer un Site et un Project BCF reliés](#processus-pour-créer-un-site-et-un-project-bcf-reliés)
* [Editer un projet (y.c. extensions)](#editer-un-projet-yc-extensions)
* [Lien pour le viewer](#lien-pour-le-viewer)





### Paramètres principaux

**Host**

Le *host* de chaque requête ci-dessous est définit comme **http://localhost:3001**. Cette valeur peut être changée dans chaque requête pour s'adapter aux besoins.

**apiKey**

De plus, afin d'être reçu par l'API, chaque requête doit contenir une *clé API*. Dans le cas de BIM Etat cette clé API est définie comme suit: **?apiKey=e4be3bd3fb61**

**Format des requêtes**

A titre d'exemple, les requêtes sont écrites en format Java - Unirest.

### Login

* Endpoint: `POST /bcf/2.1/auth/swissdata-auth-token`
* Content-Type: `application/json`
* Body: `username` et `password`

Remarque: cette requête est un alias de `POST /auth/token` de l'API Swissdata. Une implémentation oAuth2 est possible dans le futur.


**Exemple**

```java
HttpResponse<String> response = Unirest.post("http://localhost:3001/bcf/2.1/auth/swissdata-auth-token?apiKey=e4be3bd3fb61")
  .header("content-type", "application/json")
  .body("{\n\t\"username\": \"email@domain.com\",\n\t\"password\": \"my-password\"\n}")
  .asString();
```

**Réponse**

```json
{
  "id": "5e280c24c18733658b3ee360",
  "_createdAt": "2020-01-22T08:47:32.086Z",
  "_updatedAt": "2020-01-22T08:47:32.086Z",
  "type": "access",
  "token": "bf2a80cf46b5475b108bcebd8b067361",
  "refresh": "1de56ce73c807131b50ec6bb27eebbcf",
  "expires": "2020-02-05T09:47:32Z",
  "validity": 1209599
}
```

La réponse contiendra un `token` nécessaire aux requêtes suivantes.

### Requêtes BCF REST API

Cette API suit strictement la documentation fournie sur [https://github.com/buildingSMART/BCF-API](https://github.com/buildingSMART/BCF-API). Tous les services ne sont pas encore implémentés, voici donc la liste de ce qui est existant à ce jour:

Login

* Authentification: voir [Login](#login)

Projects

* Create a project: `POST /bcf/2.1/projects`
* Get projects list: `GET /bcf/2.1/projects`
* Get one project: `GET /bcf/2.1/projects/:projectId`
* Edit a project: `PUT /bcf/2.1/projects/:projectId`
* Delete a project: `DELETE /bcf/2.1/projects/:projectId`
* Get a project extensions: `GET /bcf/2.1/projects/:projectId/extensions`
* Download a project as a BCF File: `GET /bcf/2.1/projects/:projectId/export-file`

Topics

* Create a topic: `POST /bcf/2.1/projects/:projectId/topics`
* Get topics list: `GET /bcf/2.1/projects/:projectId/topics`
* Get one topic: `GET /bcf/2.1/projects/:projectId/topics/:topicId`
* Edit a topic: `PUT /bcf/2.1/projects/:projectId/topics/:topicId`
* Delete a topic: `DELETE /bcf/2.1/projects/:projectId/topics/:topicId`

Comments

* Create a comment: `POST /bcf/2.1/projects/:projectId/topics/:topicId/comments`
* Get comment list: `GET /bcf/2.1/projects/:projectId/topics/:topicId/comments`
* Get one comment: `GET /bcf/2.1/projects/:projectId/topics/:topicId/:topicId/comments/:commentId`
* Edit a comment: `PUT /bcf/2.1/projects/:projectId/topics/:topicId/comments/:commentId`
* Delete a comment: `DELETE /bcf/2.1/projects/:projectId/topics/:topicId/comments/:commentId`

Viewpoint

* Create a viewpoint: `POST /bcf/2.1/projects/:projectId/topics/:topicId/viewpoints`
* Get viewpoint list: `GET /bcf/2.1/projects/:projectId/topics/:topicId/viewpoints`
* Get one viewpoint: `GET /bcf/2.1/projects/:projectId/topics/:topicId/:topicId/viewpoints/:viewpointId`
* Edit a viewpoint: `PUT /bcf/2.1/projects/:projectId/topics/:topicId/viewpoints/:viewpointId`
* Delete a viewpoint: `DELETE /bcf/2.1/projects/:projectId/topics/:topicId/viewpoints/:viewpointId`

### Processus pour créer un Site et un Project BCF reliés

Pour rappel, notre API peut gérer des `Site` (contient des Objets 3D pour affichage dans un viewer) et des tickets `BCF`. Ces deux concepts sont autonome et peuvent fonctionner de manière indépendante. Un `site` n'a pas besoin d'être lié à un projet `BCF` et l'inverse non plus.

En revanche, il est intéressant de lier les deux API pour le suivi d'un projet complet. Cela se fait en indiquant dans l'objet `Site` de le `bcfProjectId`. Le processus est le suivant:

1. Création d'un site => on obtient un `siteId`
2. Création d'un projet BCF => on obtient un `projectId`
3. Renseigner le site avec le `project_id` du `BCF`


```
# 1. Création d'un site
POST /three/site
{
  name: "Nouveau Site"
}
```

```js
/* Réponse */
{
  id: "5e27fd4944657d613a007098",
  name: "Nouveau Site",
  /* ... */
}
```

```
# 2. Création d'un project BCF
POST /bcf/2.1/projects
{
  name: "Nouveau Projet"
}
```

```js
/* Réponse */
{
  project_id: "5e27fd4944657d613a007099",
  name: "Nouveau Projet",
  /* ... */
}
```


```
# 3. Renseigner le site avec le project_id
PUT /three/site/5e27fd4944657d613a007098
{
  bcfProjectId: "5e27fd4944657d613a007099"
}
```

```js
/* Réponse */
{
  id: "5e27fd4944657d613a007098",
  name: "Nouveau Site",
  bcfProjectId: "5e27fd4944657d613a007099"
  /* ... */
}
```


### Editer un projet (y.c. extensions)

* Endpoint: `PUT /bcf/2.1/projects/:projectId`
* Content-Type: `application/json`
* Body:
  * `name` (optional, `string`)
  * `topic_type` (optional, `Array<string>`)
  * `topic_status` (optional, `Array<string>`)
  * `topic_label` (optional, `Array<string>`)
  * `snippet_type` (optional, `Array<string>`)
  * `priority` (optional, `Array<string>`)
  * `user_id_type` (optional, `Array<string>`)
  * `stage` (optional, `Array<string>`)
  * `project_actions` (optional, `Array<string>`)
  * `topic_actions` (optional, `Array<string>`)
  * `comment_actions` (optional, `Array<string>`)

Remarque sur la réponse à cette requête: elle ne va retourner que le `project_id` et le `name`. Pour obtenir la valeur mise à jour des champs d'extensions il faut faire un `GET /bcf/2.1/projects/:projectId/extensions`.


**Exemple pour mettre à jour la liste des users**

```java
HttpResponse<String> response = Unirest.post("http://localhost:3001/bcf/2.1/projects/5e280c24c18733658b3ee360")
  .header("content-type", "application/json")
  .body("{\n\t\"user_id_type\": [\"email1@domain.com\", \"email2@domain.com\"]}")
  .asString();
```

**Réponse**

```json
{
  "id": "5e280c24c18733658b3ee360",
  "_createdAt": "2020-01-22T08:47:32.086Z",
  "_updatedAt": "2020-01-22T08:47:32.086Z",
  "name": "Project Name"
}
```



### Lien pour le viewer


**Afficher un Topic d'un BCF**

`http://localhost:8080/viewer/:siteId?topic=:topicId`

Pour sélectionner automatiquement un Topic en relation à un BCF, il suffit de passer son id dans le paramètre query: `topic=...`.

**Afficher un Comment relié à un Topic**

`http://localhost:8080/viewer/:siteId?topic=:topicId&comment=commentId`

Pour sélectionner automatiquement un Comment en relation à un Topic, il suffit de passer son id dans le paramètre query: `comment=...`.

Remarque : Pour un commentaire, il est nécessaire de joindre l'ID du Topic.

Exemple pour un commentaire d'un BCF :
`http://localhost:8080/viewer/5f47b235e0e73100076c8591?topic=5f9c2811570aa81dcbf64825&comment=5f9c2fde570aa81dcbf64831`

