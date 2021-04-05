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


