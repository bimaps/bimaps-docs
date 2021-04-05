---
layout: "api"
tags: restapi
title: "REST API documentation"
permalink: /api/restapi
---

### Table des matières

**Application**
* [Paramètres principaux](#paramètres-principaux)
* [Login](#login)

**Site**
* [Liste de tous les sites enregistrés dans l’application](#liste-de-tous-les-sites-enregistrés-dans-lapplication)
* [Recevoir les settings d’un site](#recevoir-les-settings-dun-site)
* [Créer un site](#créer-un-site)
* [Modifier un site](#modifier-un-site)
* [Supprimer un site](#supprimer-un-site)
* [Supprimer les données d’un site](#supprimer-les-données-dun-site)
* [Envoyer un fichier IFC sur un site](#envoyer-un-fichier-ifc-sur-un-site)
* [Liste des objets d’un site](#liste-des-objets-dun-site)
* [Liste des materials d’un site](#liste-des-materials-dun-site)
* [Liste des geometries d’un site](#liste-des-geometries-dun-site)
* [Lien pour le viewer](#lien-pour-le-viewer)

**Checkers**
* [Vue d'ensemble des checkers](#vue-d-ensemble-des-checkers)
* [Créer un Flow](#créer-un-flow)
* [Modifier un Flow](#modifier-un-flow)
* [Supprimer un Flow](#supprimer-un-flow)
* [Créer un module](#créer-un-module)
* [Les types de modules](#les-types-de-modules)
* [Modifier un module](#modifier-un-module)
* [Supprimer un module](#supprimer-un-module)
* [Faire un RUN sur un Flow](#faire-un-run-sur-un-flow)
* [Créer un rapport](#créer-un-rapport)
* [Modifier un rapport](#modifier-un-rapport)
* [Supprimer un rapport](#supprimer-un-rapport)
* [Faire un RUN sur un rapport](#faire-un-run-sur-un-rapport)

### Paramètres principaux

**Host**

Le *host* de chaque requête ci-dessous est définit comme **http://localhost:3001**. Cette valeur peut être changée dans chaque requête pour s'adapter aux besoins.

**apiKey**

De plus, afin d'être reçu par l'API, chaque requête doit contenir une *clé API*. Dans le cas de BIM Etat cette clé API est définie comme suit: **?apiKey=e4be3bd3fb61**

**Format des requêtes**

A titre d'exemple, les requêtes sont écrites en format Java - Unirest.

### Login

* Endpoint: `POST /auth/token`
* Content-Type: `application/json`
* Body: `username` et `password`

Pour utiliser les fonctions privées il est nécessaire de se logger au préalable. La requête de login doit se faire en POST, au format `application/json` et contenir le `username` et `password` dans le BODY de la requête.


**Exemple**

```java
HttpResponse<String> response = Unirest.post("http://localhost:3001/auth/token?apiKey=e4be3bd3fb61")
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

### Liste de tous les sites enregistrés dans l'application

* Endpoint: `GET /three/site`
* Content-Type: `application/json`

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/site?apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

```json
[
  {
    "id": "5dea54857e6ac104dac9fddf",
    /* ommited data */
    "name": "Villa Sextant",
    "originalCameraPosition": {
      "x": 0,
      "y": 0,
      "z": 0
    },
    "originalCameraZoom": 10,
    "originalCameraLookAt": {
      "x": 0,
      "y": 0,
      "z": 0
    }
  },
  {
    "id": "5dea56767e6ac104dac9fde0",
        /* ommited data */
    "name": "Test",
    "originalCameraPosition": {
      "x": 0,
      "y": 0,
      "z": 0
    },
    "originalCameraZoom": 10,
    "originalCameraLookAt": {
      "x": 0,
      "y": 0,
      "z": 0
    }
  }
]
```

Note: les valeurs de `originalCameraPosition`, `originalCameraZoom` et `originalCameraLookAt` ne sont pas encore utilisées. Elles seront destinée à permettre un regard précis au chargement d'un site, cependant actuellement le système détermine automatiquement la meilleure perspective pour l'affichag d'un site.


### Recevoir les settings d'un site

* Endpoint: `GET /three/site/:siteId`
* Content-Type: `application/json`

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/site/5dea54857e6ac104dac9fddf?apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

```json
{
  "id": "5dea54857e6ac104dac9fddf",
  /* ommited data */
  "name": "Villa Sextant",
  "originalCameraPosition": {
    "x": 0,
    "y": 0,
    "z": 0
  },
  "originalCameraZoom": 10,
  "originalCameraLookAt": {
    "x": 0,
    "y": 0,
    "z": 0
  }
}
```

Note: les valeurs de `originalCameraPosition`, `originalCameraZoom` et `originalCameraLookAt` ne sont pas encore utilisées. Elles seront destinée à permettre un regard précis au chargement d'un site, cependant actuellement le système détermine automatiquement la meilleure perspective pour l'affichag d'un site.


### Créer un site

* Endpoint: `POST /three/site`
* Content-Type: `application/json`
* Body: Au minimum le `name`

**Exemple**

```java
HttpResponse<String> response = Unirest.post("http://localhost:3001/three/site?apiKey=e4be3bd3fb61")
  .header("content-type", "application/json")
  .header("authorization", "Bearer 0761528b2a3c1d969d85767c686dafb2")
  .body("{\n\t\"name\": \"New Site\"\n}")
  .asString();
```

**Réponse**

```json
{
  "id": "5e27fd4944657d613a007098",
  "_createdAt": "2020-01-22T07:44:09.211Z",
  "_createdBy": "5dd3b2228ef8350b61c04387",
  "_updatedAt": "2020-01-22T07:44:09.211Z",
  "_updatedBy": "5dd3b2228ef8350b61c04387",
  "name": "New Site",
  "originalCameraPosition": {
    "x": 0,
    "y": 0,
    "z": 0
  },
  "originalCameraZoom": 10,
  "originalCameraLookAt": {
    "x": 0,
    "y": 0,
    "z": 0
  }
}
```

Note: les valeurs de `originalCameraPosition`, `originalCameraZoom` et `originalCameraLookAt` ne sont pas encore utilisées. Elles seront destinée à permettre un regard précis au chargement d'un site, cependant actuellement le système détermine automatiquement la meilleure perspective pour l'affichag d'un site.

### Modifier un site

* Endpoint: `PUT /three/site/:siteId`
* Content-Type: `application/json`
* Body: `name`, `bcfProjectId`

**Exemple**

```java
HttpResponse<String> response = Unirest.put("http://localhost:3001/three/site/5e27fd4944657d613a007098?apiKey=e4be3bd3fb61")
  .header("content-type", "application/json")
  .header("authorization", "Bearer 0761528b2a3c1d969d85767c686dafb2")
  .body("{\n\t\"name\": \"New Site 2\"\n}")
  .asString();
```

**Réponse**

```json
{
  "id": "5e27fd4944657d613a007098",
  "_createdAt": "2020-01-22T07:44:09.211Z",
  "_createdBy": "5dd3b2228ef8350b61c04387",
  "_updatedAt": "2020-01-22T07:44:09.211Z",
  "_updatedBy": "5dd3b2228ef8350b61c04387",
  "name": "New Site 2",
  "originalCameraPosition": {
    "x": 0,
    "y": 0,
    "z": 0
  },
  "originalCameraZoom": 10,
  "originalCameraLookAt": {
    "x": 0,
    "y": 0,
    "z": 0
  }
}
```

### Supprimer un site

* Endpoint: `DELETE /three/site/:siteId`
* Content-Type: `application/json`

Description: Cette requête supprime un site de l'application. Cette opération est irréversible. 

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/site/5e27fd4944657d613a007098?apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

Cette requête renvoie un code 204 (No-Content)


### Supprimer les données d'un site

* Endpoint: `DELETE /three/site/:siteId/delete-data`
* Content-Type: `application/json`
* Body: Le body doit contenir une variable `models` contenant un tableau de string (JSON) décrivant les modèles de données à supprimer. Dans la plupart des cas on voudra supprrimer les `["object", "material", "geometry"]`.

Description: Cette requête supprime les données liées à un site *mais ne supprime pas le site lui-même*. Le but de cette requête est de faire un *clear* des données avant d'en ajouter des nouvelles. 


**Exemple**

```java
HttpResponse<String> response = Unirest.delete("http://localhost:3001/three/site/5e27fd4944657d613a007098/delete-data?apiKey=e4be3bd3fb61")
  .header("content-type", "application/json")
  .header("authorization", "Bearer 0761528b2a3c1d969d85767c686dafb2")
  .body("{\n\t\"models\": [\"object\", \"material\", \"geometry\"]\n}")
  .asString();
```

**Réponse**

```json
[
  {
    "model": "object",
    "nbDeleted": 1069
  },
  {
    "model": "material",
    "nbDeleted": 45
  },
  {
    "model": "geometry",
    "nbDeleted": 1069
  }
]
```



### Envoyer un fichier IFC sur un site

* Endpoint: `POST /three/site/:siteId/import/ifc`
* Content-Type: `multipart/form-data`
* Body: `ifc` contenant le fichier IFC à envoyer

Remarque importante: cette requête n'attend pas la fin de l'importation du fichier pour renvoyer une réponse. Au contraire, si l'API reçoit un fichier correct elle renvoie immédiatement un code 204 (No-Content) pour avertir le client que le ficheir est bien reçu et qu'il est en traitement.

Dans un futur proche la réponse contiendra un ID d'opération et le client pourra effectuer une requête successive pour connaître l'état d'importation du fichier via cet ID.

**Exemple**

Note: cet exemple ne montre pas comment intégrer le fichier à la requête. Pour cela, il faut se référer à la documentation de la librairie utilisée pour l'envoi de la requête. Le fichier doit être envoyé en mode `multipart` et attaché à la requête sous le nom de `ifc`. 

```java
HttpResponse<String> response = Unirest.post("http://localhost:3001/three/site/5dea56767e6ac104dac9fde0/import/ifc?apiKey=e4be3bd3fb61")
  .header("content-type", "multipart/form-data; boundary=---011000010111000001101001")
  .header("authorization", "Bearer 0761528b2a3c1d969d85767c686dafb2")
  .body("-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"ifc\"\r\n\r\n\r\n-----011000010111000001101001--\r\n")
  .asString();
```

**Réponse**

204 (No-Content)


### Liste des objets d'un site

* Endpoint: `GET /three/object`
* Query (pour filtrer): `?siteId=:siteId`
* Content-Type: `application/json`

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/object?siteId=5dea56767e6ac104dac9fde0&apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

```json
[
  {
    "id": "5e20783b91d9184421612b42",
    "_createdAt": "2020-01-16T14:50:42.662Z",
    "_updatedAt": "2020-01-22T08:03:07.397Z",
    "siteId": "5dea56767e6ac104dac9fde0",
    "importId": "db0b952e2e4dca28738e38916386a388",
    "uuid": "D0FC739D-8A1D-4749-AE41-2D6508BF949C",
    "name": "2QODztGTbCLPY_qYcn77ee",
    "type": "Mesh",
    "matrix": [/*...*/],
    "material": "92CC3B3D-0C85-4140-9040-6AD4C19976F1",
    "geometry": "AAD22113-7D36-4F7D-BB44-A7E943D4F80C",
    "layers": 1,
    "userData": {
      "name": "M_Ext-001",
      "type": "IfcWallStandardCase",
      "objectType": "",
      "tag": "9A60DF77-41D9-4C55-98BE-D229B11C7A28",
      "pset": {
        "EnvironmentalClass": "0",
        "FireRating": "Sans",
        "ServiceLife": "0",
        "LifeCycleEnvironmentalLoad": "0",
        "AcousticRating": "Non défini",
        "Combustible": "True",
        "ThermalTransmittance": "0",
        "LoadBearing": "True",
        "IsExternal": "True",
        "FireResistanceRating": "Sans",
        "IsCombustible": "True",
        "Renovation Status": "Existing"
      }
    },
    "childrenIds": [],
    "parentId": "5e20783b91d9184421612b41",
    "_min": {
      "x": 4.074999809265137,
      "y": 5.34499979019165,
      "z": -2.3499999046325684,
      "isVector3": true
    },
    "_max": {
      "x": 8.744999885559082,
      "y": 5.795000076293945,
      "z": 0,
      "isVector3": true
    }
  },
  {
    "id": "5e20783b91d9184421612b43",
    /*...*/
  }
]
```

### Liste des materials d'un site

* Endpoint: `GET /three/material`
* Query (pour filtrer): `?siteId=:siteId`
* Content-Type: `application/json`

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/material?siteId=5dea56767e6ac104dac9fde0&apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

```json
[
  {
    "id": "5e20783b91d9184421612f6f",
    "_createdAt": "2020-01-16T14:50:35.191Z",
    "_updatedAt": "2020-01-16T14:50:35.191Z",
    "siteId": "5dea56767e6ac104dac9fde0",
    "importId": "db0b952e2e4dca28738e38916386a388",
    "uuid": "92CC3B3D-0C85-4140-9040-6AD4C19976F1",
    "name": "surface-style-160-b--ton---brut-de-d--coffrage-(planches)",
    "type": "MeshPhongMaterial",
    "color": 8355960,
    "emissive": 0,
    "specular": 5197647,
    "shininess": 30,
    "depthFunc": 3,
    "depthTest": true,
    "depthWrite": true,
    "stencilWrite": false,
    "stencilFunc": 519,
    "stencilRef": 0,
    "stencilFail": 7680,
    "stencilZFail": 7680,
    "stencilZPass": 7680
  },
  {
    "id": "5e20783b91d9184421612f70",
    /*...*/
  }
]
```

### Liste des geometries d'un site

* Endpoint: `GET /three/geometry`
* Query (pour filtrer): `?siteId=:siteId`
* Content-Type: `application/json`

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/geometry?siteId=5dea56767e6ac104dac9fde0&apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

```json
[
  {
    "id": "5e20783b91d9184421612f6f",
    "_createdAt": "2020-01-16T14:50:35.191Z",
    "_updatedAt": "2020-01-16T14:50:35.191Z",
    "siteId": "5dea56767e6ac104dac9fde0",
    "importId": "db0b952e2e4dca28738e38916386a388",
    "uuid": "92CC3B3D-0C85-4140-9040-6AD4C19976F1",
    "name": "surface-style-160-b--ton---brut-de-d--coffrage-(planches)",
    "type": "MeshPhongMaterial",
    "color": 8355960,
    "emissive": 0,
    "specular": 5197647,
    "shininess": 30,
    "depthFunc": 3,
    "depthTest": true,
    "depthWrite": true,
    "stencilWrite": false,
    "stencilFunc": 519,
    "stencilRef": 0,
    "stencilFail": 7680,
    "stencilZFail": 7680,
    "stencilZPass": 7680
  },
  {
    "id": "5e20783b91d9184421612f70",
    /*...*/
  }
]
```



### Lien pour le viewer


**Afficher un site**

`http://localhost:8080/viewer/:siteId`

Pour automatiquement choisir un theme par défaut dans le viewer il suffit de passer son nom dans le paramètre query: `theme=...`. Attention, le nom doit être formatté pour être une URL valide. Exemple d'un thème qui s'appelle "Sans les murs", devra s'écrire `Sans+les+murs`. 

`http://localhost:8080/viewer/:siteId?theme=Sans+les+murs`

**Admin des sites**

`http://localhost:8080/admin`



### Gestion des thèmes et des styles

* Liste des thèmes: `GET /three/theme`
* Liste des thèmes d'un site: `GET /three/theme?siteId=:siteId`
* Un thème: `GET /three/theme/:themeId`
* Créer un thème: `POST /three/theme` avec le nouveau thème dans le `body` (doit contenir un `siteId`)
* Editer un thème: `PUT /three/theme/:themeId` avec les champs a éditer dans le `body`
* Supprimer un thème: `DELETE /three/theme/:themeId`


* Liste des styles: `GET /three/style`
* Liste des styles d'un site: `GET /three/theme?siteId=:siteId`
* Un style: `GET /three/style/:styleId`
* Créer un style: `POST /three/style` avec le nouveau thème dans le `body` (doit contenir un `siteId`)
* Editer un style: `PUT /three/style/:styleId` avec les champs a éditer dans le `body`
* Supprimer un style: `DELETE /three/style/:styleId`

### Vue d'ensemble des checkers

Le système de checkers est prévu pour être dynamique et offre de nombreuse possibilités de compositions. Pour un rapport complet il y a trois niveaux de configuration.

**Le rapport**

Chaque rapport contient un titre, une description et une liste de flow. Comme cela est expliqué ci-dessous, les Flow contiennent les tests que l'on peut effectuer sur un site. Le rapport agit donc comme un groupe de tests pertinents pour le rapport en question. Les rapports peuvent être générés sous forme de `json` ou `PDF`.

**Les flows**

Afin d'effectuer un test sur un site on a besoin d'un flow. Dans ce flow on ajoutera des modules qui effectueront chacun une opération précise. Par exemple, si nous avons besoin d'obtenir la hauteur maximale des murs d'un batiment, voici un flow qui nous donne la réponse

* Module de filtre: filtrer le site pour ne garder que les murs
* Module d'extraction: extraire la propriété "height" de chaque objet
* Module de réduction: ne garder que la valeur maximale
* Module de sortie: afficher la variable stockée lors de l'opération précédente

Un flow est donc une suite d'opérations menant à un ou plusieurs modules de sortie. Il faut savoir que pour l'affichage dans un rapport, chaque variable pertinente doit être sortie via un module de sortie.

**Les modules**

Les modules sont les opérations spécifiques que l'on peut effectuer dans un flow. L'object de chaque module est de remplir une tâche très précise avec une variable d'entrée et une variable de sortie. Ainsi on peut constuire un flow en alignant les modules.

Exemples de modules [(liste complète ici)](#les-types-de-modules):

* Module de filtre: pour créer un sous-groupe d'objets utilisables dans une opération ultérieure
* Module d'extraction: pour extraire une donnée d'un objet ou d'une liste d'objets. Cela peut être des propriétés dans les `userData` ou des propriétés géométriques comme les `faces`, `edges`, `vertices`.
* Module de réduction: prend un groupe de valeurs et les réduits en une valeur unique selon une opération demandée. Exemple: `count`, `max`, `min`, `average`.
* Module de distance: mesure la distance entre des `vertices`, `edges`, `faces`
* Module de sortie: définit une variable comme une sortie pour le rapport json ou pdf.

### Créer un Flow

* Endpoint: `POST /three/checker/flow`
* Content-Type: `application/json`
* Body: Au minimum le `siteId` et `name`, optionnel: `description`, `modulesIds`

**Exemple**

```java
HttpResponse<String> response = Unirest.post("http://localhost:3001/three/checker/flow?apiKey=e4be3bd3fb61")
  .header("content-type", "application/json")
  .header("authorization", "Bearer 0761528b2a3c1d969d85767c686dafb2")
  .body("{\n\t\"siteId\": \"5e27fd4944657d613a007098\"\n\t\"name\": \"New Flow Name\"\n}")
  .asString();
```

**Réponse**

```json
{
  "id": "5e20783b91d9184421612f6f",
  "_createdAt": "2020-01-16T14:50:35.191Z",
  "_updatedAt": "2020-01-16T14:50:35.191Z",
  "siteId": "5e27fd4944657d613a007098",
  "name": "New Flow Name",
  "description": "",
  "modulesIds": []
}
```

### Liste des flows d'un site

* Endpoint: `GET /three/checker/flow?siteId=:siteId`
* Content-Type: `application/json`
* Query: `siteId` pour filtrer les flow d'un site en particulier

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/checker/flow?siteId=5e27fd4944657d613a007098&apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

```json
[
  {
    "id": "5dea54857e6ac104dac9fddf",
    /* ommited data */
    "name": "New Flow Name",
    "description": "",
    "modulesIds:" []
  },
  {
    /* ... */
  }
]
```

### Modifier un Flow

* Endpoint: `PUT /three/checker/flow/:flowId`
* Content-Type: `application/json`
* Body: identique à la requête pour [créer un Flow](#créer-un-flow)

Cette requête permet aussi d'ajouter un module à un Flow en l'ajoutant à la liste des dans la propriété `modulesIds` qui est un tableau de string. 

**Exemple**

```java
HttpResponse<String> response = Unirest.put("http://localhost:3001/three/checker/flow/5dea54857e6ac104dac9fddf?apiKey=e4be3bd3fb61")
  .header("content-type", "application/json")
  .header("authorization", "Bearer 0761528b2a3c1d969d85767c686dafb2")
  .body("{\n\t\"name\": \"New Name\"\n}")
  .asString();
```

**Réponse**

```json
{
  "id": "5e20783b91d9184421612f6f",
  "_createdAt": "2020-01-16T14:50:35.191Z",
  "_updatedAt": "2020-01-16T14:50:35.191Z",
  "siteId": "5e27fd4944657d613a007098",
  "name": "New Name",
  "description": "",
  "modulesIds": []
}
```

### Supprimer un Flow

* Endpoint: `DELETE /three/checker/flow/5e20783b91d9184421612f6f`
* Content-Type: `application/json`

Description: Cette requête supprime un flow de l'application. Cette opération est irréversible. 

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/checker/flow/5e20783b91d9184421612f6f?apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

Cette requête renvoie un code 204 (No-Content)

### Créer un module

* Endpoint: `POST /three/checker/flow/:flowId/`
* Content-Type: `application/json`
* Body: Au minimum le `siteId`, `moduleType`, `inputVarName` et `outputVarName`

**Exemple**

```java
HttpResponse<String> response = Unirest.post("http://localhost:3001/three/checker/flow?apiKey=e4be3bd3fb61")
  .header("content-type", "application/json")
  .header("authorization", "Bearer 0761528b2a3c1d969d85767c686dafb2")
  .body("{\n\t\"siteId\": \"5e27fd4944657d613a007098\"\n\t\"name\": \"New Module Name\"\n\t\"moduleType\": \"filter\"\n\t\"inputVarName\": \"scene\"\n\t\"outputVarName\": \"filteredScene\"\n}")
  .asString();
```

**Réponse**

```json
{
  "id": "5f72ec774fabac29dc12a4f1",
  "siteId": "5f47b235e0e73100076c8591",
  "allowedInputTypes": ["three-objects", "scene"],
  "moduleType": "filter",
  "name": "New Module Name",
  "inputVarName": "scene",
  "outputVarName": "filteredScene",
  "conditionsOperator": "and",
  "outputType": "three-objects",
  "_createdAt": "2020-09-29T08:12:39.412Z",
  "_createdBy": "5dd3b2228ef8350b61c04387",
  "_updatedAt": "2020-09-29T08:12:39.412Z",
  "_updatedBy": "5dd3b2228ef8350b61c04387"
}
```

### Les types de modules

Chaque type de module requiert un set de paramètre spécifique. Voici les modules disponibles:

Définition de base:

```ts
interface CheckerModuleBase {
  moduleType: CheckerModuleType; // type du module, voir les types disponibles ci-dessous
  name: string; // nom (optionel) du module.
  allowedInputTypes?: Array<CheckerModuleIOType>; // internal use only
  inputVarName?: string; // nom de la variable d'entrée du module
  outputVarName: string; // nom de la variable de sortie du module (ne doit pas contenir d'espace ou caractères spéciaux)
  outputType: CheckerModuleIOType; // internal use only
  outputValue: CheckerModuleIOTypeValue; // internal use only
  outputReference: CheckerModuleIORef | CheckerModuleIORef[]; // internal use only
  outputSummary?: string; // lorsqu'on fait un RUN du flow, un extrait du résultat obtenu par ce module est enregistré ici
}

type CheckerModuleType = 'filter' | 'extract' | 'math' | 'reducer' | 'if' | 'projection' | 'distance' | 'normal-distance' | 'output';
```

**filter**

Filtre une scène (site) ou un groupe d'object (provenant d'un précédent filtre).

Valeurs d'entrée acceptées: `scene` ou une variable provenant d'un autre filtre d'objets

Définition:

```ts
interface CheckerModuleFilter extends CheckerModuleBase {
  moduleType: "normal-distance",
  conditions: Array<CheckerObjectCondition>; // voir ci-dessous
  conditionsOperator: CheckerConditionOperator; // `or` ou `and`
}

type CheckerConditionOperator = 'or' | 'and';

interface CheckerObjectCondition {
  key: string;
  operation: string; // =, !=, <, >, *
  value: string | Date;
}
```

Exemple:

```ts
{
  id: "5f72ec774fabac29dc12a4f1"
  // omitted data
  "conditions": [
    {key: "userData.type", operation: "=", value: "IfcWall"}
    {key: "userData.pset.Level", operation: "=", value: "-1"}
  ],
  "conditionsOperator": "and",
  "inputVarName": "scene",
  "moduleType": "filter",
  "name": "Filtrer les murs du sous-sol",
  "outputType": "three-objects",
  "outputVarName": "MursDuSousSol"
}
```

**extract**

Extrait une propriété (userData, pset, géométrique) d'un objet ou d'un groupe d'objet.

Valeurs d'entrée acceptées: `scene` ou une variable provenant d'un filtre d'objets.

Définition:

```ts
interface CheckerModuleExtract extends CheckerModuleBase {
  moduleType: "extract",
  extractType: CheckerExtractType; // see below
  value: any; // if extractType === 'property', set the json path to the desired property (exemple "userData.pset.height")
  forceOutputAsNumber: boolean; // if the extract property is a string (in data) but you want to ensure a number, this will parse the string and make sure to type it as a number
}

type CheckerExtractType = 'faces' | 'edges' | 'vertices' | 'wireframe' | 'property';

```

Exemple:

```ts
{
  "id": "5f72f0dd4fabac29dc12a4f2",
  // omitted data
  "moduleType": "extract",
  "extractType": "faces",
  "id": "5f72f0dd4fabac29dc12a4f2",
  "inputVarName": "MursDuSousSol",
  "name": "Extraire les faces",
  "outputVarName": "FacesDesMursDuSousSol"
}
```

**normal-distance**

(Le module s'appelle pour le moment "normal-distance" mais pourrait être rennomé en "distance" par la suite)

Ce module mesure la distance entre deux groupe de valeurs géométriques. Il a donc besoin de deux variables en entrée. Ces variables doivent être de type `faces`, `edges` ou `vertices` provenant du module `extract`.

Le module va automatiquement detecter le type de variable en entrée et appliquer la bonne formule.

Il y a deux scénarios légements différents:

* deux variables différentes en entrée: mesure les distances de chaque objet du groupe A avec chaque objet du groupe B
* deux fois la même variable en entrée: mesure les distances entre chaque objet à l'intérieur de ce groupe d'objets

Définition:

```ts
interface CheckerModuleNormalDistance extends CheckerModuleBase {
  moduleType: "normal-distance";
  input2VarName: string;
  operation: 'min' | 'max'; // when mesuring the distance between objects such as faces, should we keep the minimal or maximal distance of any part of the face ? The default is 'min'
}
```

Exemple:

```ts
{
  "id": "5f72f0dd4fabac29dc12a4f3",
  // omitted data
  "inputVarName": "FacesDesMursDuSousSol",
  "input2VarName": "FacesDesMursDuSousSol",
  "moduleType": "normal-distance",
  "name": "Mesure de distance",
  "operation": "min",
  "outputVarName": "DistancesEntreObjetsDesFacesDesMursDuSousSol"
}
```

**reducer**

Calculate a reduced value from a group of value. The reducer can do so by applying one of these operation:

* min (valeur minimale)
* max (valeur maximale)
* average (moyenne)
* count (compter le nombre de valeurs dans le groupe)
* sum (somme de toutes les valeurs dans le groupe)

Définition:

```ts
interface CheckerModuleReducer extends CheckerModuleBase {
  moduleType: "reducer";
  operation: CheckerModuleReducerOperation;
}

type CheckerModuleReducerOperation = 'min' | 'max' | 'average' | 'count' | 'sum';
```

Exemple:

```ts
{
  "id": "5f72f0dd4fabac29dc12a4f4",
  // omitted data
  "moduleType": "reducer",
  "name": "Distance minimale entre les murs du sous-sol",
  "inputVarName": "DistancesEntreObjetsDesFacesDesMursDuSousSol",
  "operation": "min",
  "operation": "min",
  "outputVarName": "DistanceMinimaleEntreObjetsDesFacesDesMursDuSousSol"
}
```

**math**

Effectue une opération mathématique utilisant - ou pas - des variables précédement disponibles dans le Flow.

Définition:

```ts
interface CheckerModuleMath extends CheckerModuleBase {
  moduleType: "math";
  expression: string; // expression à appliquer
}
```

Exemple:

```ts
{
  "id": "5f72f0dd4fabac29dc12a4f4",
  // omitted data
  "moduleType": "math",
  "name": "Doubler la distance minimale",
  "expression": "DistanceMinimaleEntreObjetsDesFacesDesMursDuSousSol * 2",
  "outputVarName": "ValeurDoublee"
}
```

**if**

Renvoie une valeur différente en fonction d'une ou plusieurs conditions. On peut comprendre le module ainsi:

* Si aucune condition n'est remplie, le module renvoie la valeur saisie comme "valeur de sortie par défaut"
* Si une condition est remplie, c'est la valeur de sortie liée à cette condition qui est renvoyée
* Dès qu'une condition est remplie, le module renvoye la valeur, même si une condition ultérieure pourrait être valide également
* Pour chaque valeur de sortie on peut choisir un style. Cela permettra ensuite dans le rapport d'afficher cette valeur avec un style spécial si nécessaire. Par exemple si une valeur ne correspond pas à un critère requit, on peut lui attribuer le style "incorrect"
* Si la valeur par défaut ou la valeur d'une condition est laissée vide, alors dans ce cas la valeur originale d'entrée est renvoyée en sortie

Définition:

```ts
interface CheckerModuleIf extends CheckerModuleBase {
  moduleType: "if";
  operations: CheckerModuleIfOperation[], // tableau d'opérations, chaque opération représente un "cas" du IF
  defaultOutputValue: number | string | boolean; // valeur de sortie par défaut si aucune condition n'est remplie
  defaultOutputStyle: CheckerModuleIOStyle; // style de sortie par défaut
}

type CheckerModuleIfOperation = {
  conditions: Array<CheckerValueCondition>; // tableau de conditions à remplir pour ce cas du IF
  conditionsOperator: CheckerConditionOperator; // operateur entre les conditions ci-dessus (or ou and)
  outputValue: number | string | boolean; // valeur de sortie si la ou les conditions ci-dessus sont remplies
  outputStyle: CheckerModuleIOStyle; // style de sortie pour cette operation
}

```

Exemple:

```ts
{
  "id": "5f72faf84fabac29dc12a4f7",
  // omitted data
  "moduleType": "if",
  "name": "Degré de sécurité",
  "inputVarName": "DistancesEntreObjetsDesFacesDesMursDuSousSol",
  "defaultOutputValue": "Bon"
  "defaultOutputStyle": "correct"
  "operations": [
    {
      "conditions": [
        {
          "operation": "<", 
          "value": "10"
        }, 
        {
          "operation": ">", 
          "value": "5"
        }
      ],
      "conditionsOperator": "and",
      "outputValue": "Moyen",
      "outputTyle": "Danger"
    },
    {
      "conditions": [
        {
          "operation": "<", 
          "value": "5"
        }, 
        {
          "operation": "=", 
          "value": "5"
        }
      ],
      "conditionsOperator": "or",
      "outputValue": "Mauvais",
      "outputTyle": "Incorrect"
    }
  ],
  "outputVarName": "DegreDeSecurite"
}
```

**projection**

Ce module prend une valeur géométrique 3D et la projette sur un axe (X, Y ou Z).

Définition:

```ts
interface CheckerModuleProjection extends CheckerModuleBase {
  moduleType: "projection";
  projectionAxis: 'x' | 'y' | 'z';
}

```

Exemple:

```ts
{
  "id": "5f72faf84fabac29dc12a4f8",
  // omitted data
  "moduleType": "projection",
  "name": "Projection sur l'axe Z",
  "projectionAxis": "z",
  "outputVarName": "ProjectionSurZ"
}
```

**output**

Ce module permet d'afficher des variables dans le JSON final ou dans le PDF

Définition:

```ts
interface CheckerModuleOutput extends CheckerModuleBase {
  moduleType: "output";
  outputs: CheckerOutput[];
}

interface CheckerOutput {
    prefix: string;
    varName: string;
    suffix: string;
    display: 'paragraph' | 'blocks';
}

```

Exemple:

```ts
{
  "id": "5f72faf84fabac29dc12a4f8",
  // omitted data
  "moduleType": "output",
  "outputs": [
    {
      "prefix": "La distance minimale entre les murs du sous-sol est de: ",
      "varName": "DistanceMinimaleEntreObjetsDesFacesDesMursDuSousSol",
      "suffix": "",
      "display": "paragraph"
    }
  ]
}
```

### Modifier un Module

* Endpoint: `PUT /three/checker/flow/:flowId/module/:moduleId`
* Content-Type: `application/json`
* Body: identique à la requête pour [créer un module](#créer-un-module)

**Exemple**

```java
HttpResponse<String> response = Unirest.put("http://localhost:3001/three/checker/flow/5dea54857e6ac104dac9fddf/module/5f72faf84fabac29dc12a4f8?apiKey=e4be3bd3fb61")
  .header("content-type", "application/json")
  .header("authorization", "Bearer 0761528b2a3c1d969d85767c686dafb2")
  .body("{\n\t\"name\": \"New Module Name\"\n}")
  .asString();
```

**Réponse**

```json
{
  // omitted data
  "id": "5f72faf84fabac29dc12a4f8",
  "name": "New Module Name",
  "moduleType": "output",
  "outputs": [
    {
      "prefix": "La distance minimale entre les murs du sous-sol est de: ",
      "varName": "DistanceMinimaleEntreObjetsDesFacesDesMursDuSousSol",
      "suffix": "",
      "display": "paragraph"
    }
  ],
  "_createdAt": "2020-01-16T14:50:35.191Z",
  "_updatedAt": "2020-01-16T14:50:35.191Z"
}
```

### Supprimer un module

* Endpoint: `DELETE /three/checker/flow/:flowId/module/:moduleId`
* Content-Type: `application/json`

Description: Cette requête supprime un flow de l'application. Cette opération est irréversible. 

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/checker/flow/5dea54857e6ac104dac9fddf/module/5f72faf84fabac29dc12a4f8?apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

Cette requête renvoie un code 204 (No-Content)


### Faire un RUN sur un Flow

* Endpoint: `POST /three/checker/flow/:flowId/run`
* Content-Type: `application/json`
* Query: `pdf=1` pour obtenir un fichier PDF

**Exemple**

```java
HttpResponse<String> response = Unirest.post("http://localhost:3001/three/checker/flow/5dea54857e6ac104dac9fddf/run?apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

```json
{
  "description": "La distance doit être d'au moins 1 mètre",
  "name": "Mesures des distances entres les bords des spaces",
  "outputs": [
    // array containing all outputs defined from output modules
  ],
  "summaries": [
    // array containing a brief summary of the output value for each module
  ]
}
```

### Créer un Rapport

* Endpoint: `POST /three/checker/report`
* Content-Type: `application/json`
* Body: Au minimum le `siteId` et `name`, optionnel: `description`, `flows`

**Exemple**

```java
HttpResponse<String> response = Unirest.post("http://localhost:3001/three/checker/flow?apiKey=e4be3bd3fb61")
  .header("content-type", "application/json")
  .header("authorization", "Bearer 0761528b2a3c1d969d85767c686dafb2")
  .body("{\n\t\"siteId\": \"5e27fd4944657d613a007098\"\n\t\"name\": \"Nouveau rapport\"\n}")
  .asString();
```

**Réponse**

```json
{
  "id": "5f7304ba4fabac29dc12a4f9",
  "_createdAt": "2020-01-16T14:50:35.191Z",
  "_updatedAt": "2020-01-16T14:50:35.191Z",
  "siteId": "5e27fd4944657d613a007098",
  "name": "Nouveau rapport",
  "description": "",
  "flows": []
}
```

### Liste des rapports d'un site

* Endpoint: `GET /three/checker/report?siteId=:siteId`
* Content-Type: `application/json`
* Query: `siteId` pour filtrer les flow d'un site en particulier

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/checker/report?siteId=5e27fd4944657d613a007098&apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

```json
[
  {
    "id": "5dea54857e6ac104dac9fddf",
    /* ommited data */
    "name": "Nouveau Rapport",
    "description": "",
    "flows:" []
  },
  {
    /* ... */
  }
]
```

### Modifier un Rapport

* Endpoint: `PUT /three/checker/report/:reportId`
* Content-Type: `application/json`
* Body: identique à la requête pour [créer un Rapport](#créer-un-rapport)

Cette requête permet aussi d'ajouter ou supprimer un flow dans un rapport en modifiant  la propriété `flows` qui est un tableau de string. 

**Exemple**

```java
HttpResponse<String> response = Unirest.put("http://localhost:3001/three/checker/report/5dea54857e6ac104dac9fddf?apiKey=e4be3bd3fb61")
  .header("content-type", "application/json")
  .header("authorization", "Bearer 0761528b2a3c1d969d85767c686dafb2")
  .body("{\n\t\"name\": \"New Name\"\n}")
  .asString();
```

**Réponse**

```json
{
  "id": "5dea54857e6ac104dac9fddf",
    /* ommited data */
    "name": "New Name",
    "description": "",
    "flows:" []
}
```

### Supprimer un Rapport

* Endpoint: `DELETE /three/checker/report/5dea54857e6ac104dac9fddf`
* Content-Type: `application/json`

Description: Cette requête supprime un rapport de l'application. Cette opération est irréversible. 

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/checker/report/5dea54857e6ac104dac9fddf?apiKey=e4be3bd3fb61")
  .asString();
```

**Réponse**

Cette requête renvoie un code 204 (No-Content)

### Faire un RUN sur un rapport

* Endpoint: `POST /three/checker/report/5dea54857e6ac104dac9fddf/run`
* Content-Type: `application/json`
* Query: `pdf=1` pour obtenir un fichier PDF

**Exemple**

```java
HttpResponse<String> response = Unirest.get("http://localhost:3001/three/checker/report/5dea54857e6ac104dac9fddf/run?apiKey=e4be3bd3fb61?pdf=true")
  .asString();
```

**Réponse**

Renvoie un fichier PDF



