---
layout: "guide"
tags: guide
title: "Installation"
menuOrder: 1
---



# Déploiement Docker


## Requirements
- Docker
- Linux file system (docker shared path)


### Host Path structure
User : current user

```
mkdir ~/sdio
mkdir ~/sdio/mongodb
mkdir ~/sdio/mongodb/db
mkdir ~/sdio/mongodb/log
mkdir ~/sdio/mongodb/backup
mkdir ~/sdio/redis
mkdir ~/sdio/apps
mkdir ~/sdio/apps/uploads-files
mkdir ~/sdio/apps/uploads
mkdir ~/sdio/apps/temp-files
mkdir ~/sdio/apps/logs
mkdir ~/sdio/apps/nginx
mkdir ~/sdio/apps/ssl-private
mkdir ~/sdio/backups

```


-----


## Initialisation de l'environnement

Les points **Docker network** et **Jeu de données Bim-état** concernant uniquement la 1re mise en place de l'environnement (100% vierge).


### Docker network
`docker network create --driver bridge sdionet`

### Jeu de données Bim-état

Le jeu de données (dump mongo) peut être obtenu sur demande. Procédure à effectuer après la mise en place du Container MongoDB.

Procédure pour restaurer le jeu de donnée :

1. Placer le jeu de données dans le dossier (décompresser) : `~/sdio/mongodb`
2. Rentrer dans le Docker :  `docker exec -it sdiomongo bash`
3. Lancer la restauration :
    - environnement **Prod** : `mongorestore --db sdioprod --drop ~/sdio/mongodb/*dossier-dump*`
    - environnement **Dev** : `mongorestore --db sdio --drop ~/sdio/mongodb/*dossier-dump*`
4. Sortir du Docker `exit`


-----

## MongoDB

`docker run --restart always --name sdiomongo -p 27017:27017 -d -v ~/sdio/mongodb:/data -v ~/sdio/mongodb/db:/data/db --network=sdionet mongo:3.4`


-----




## API

### Prod (default)
`docker run --restart always --name sdioapi -p 3000:3000 -d --network=sdionet -v ~/sdio/apps/uploads:/home/swissdata.api.ts/uploads -v ~/sdio/apps/uploads-files:/home/swissdata.api.ts/uploads-files -v ~/sdio/apps/temp-files:/home/swissdata.api.ts/ignored -v ~/sdio/apps/logs:/home/swissdata.api.ts/logs --env DBNAME=sdio --env NODE_ENV=production platform5/swissdata:latest`


### Dev
`docker run --restart always --name sdioapi -p 3000:3000 -d --network=sdionet -v ~/sdio/apps/uploads:/home/swissdata.api.ts/uploads -v ~/sdio/apps/uploads-files:/home/swissdata.api.ts/uploads-files -v ~/sdio/apps/temp-files:/home/swissdata.api.ts/ignored -v ~/sdio/apps/logs:/home/swissdata.api.ts/logs --env DBNAME=sdio --env NODE_ENV=development platform5/swissdata`


#### Update API
[repull-sdioapi.sh](https://git.mintello.com/EPFL/bimetat/src/branch/master/docker-deployment/repull-sdioapi.sh)

-----




## API Client Manager

`docker run --restart always --name sdioclient -p 8000:80 -d --network=sdionet -e HOST=${urlAPI:3000} platform5/swissdata_client`

### Update Host name

`docker exec -it sdioclient sh /docker-entrypoint.sh`



-----



## Bimetat Client Viewer

`docker run --restart always --name bevc -p 80:80 -d --network=sdionet -e HOST=${urlAPI:3000} tamuh/bimetat_viewer_client`

### Update Host name

`docker exec -it bevc sh /docker-host.sh`


#### Update Bimetat Client Viewer
[repull-bevc.sh](https://git.mintello.com/EPFL/bimetat/src/branch/master/docker-deployment/repull-bevc.sh)





