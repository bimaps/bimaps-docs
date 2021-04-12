---
layout: "guide"
tags: guide
title: "Development"
menuOrder: 99
---

# Development

This page is a work in progress overview of BIMaps's architecture.
For more details about each individual component, refer to the doc comments within each module.


## Requirements

BIMaps requires [Node.js](http://nodejs.org/) to be installed on your system. If you haven't done that already, head over to their site and follow their install instructions. (recommended use of NVM : [Linux/OSX](https://github.com/nvm-sh/nvm) or [Windows](https://github.com/coreybutler/nvm-windows) )

BIMaps also needs a MongoDB and Redis database.

## Local installation (preferred)

Firstly clone all the repo. to the same root folder.

```bash
$ git clone https://github.com/bimaps/ 
```

Configure all environment files :
- API : `.env`
- Client App : `config/environment.json`


<br>
<br>
<br>

## Script de déployement

Préparation de l'envrionnement pour API (adapter les repos)
```
cd ..
git clone https://github.com/bimaps/bimaps-api.git
git clone https://github.com/bimaps/deco-bcf.git
git clone https://github.com/bimaps/deco-three.git
git clone https://github.com/bimaps/ifc2json.git
git clone https://github.com/platform5/deco-api.git
cd deco-three
npm i
npm run tsc
cd ../deco-bcf
npm i
npm run tsc
cd ../deco-three
npm i
npm run tsc
cd ../bimaps-api
npm i
npm run tsc
npm link ../deco-api 
npm link ../deco-bcf
npm link ../deco-three
cd ../deco-bcf
npm link ../deco-api
cd ../deco-three
npm link ../deco-api
```

Préparation de l'envrionnement pour le client
```
git clone https://github.com/bimaps/bimaps-app
git clone https://github.com/bimaps/aurelia-bcf
git clone https://github.com/bimaps/aurelia-three
cd bimaps-app
npm install
cd ../aurelia-bcf
npm install
cd ../aurelia-three
npm install
```

