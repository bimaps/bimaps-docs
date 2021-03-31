# BIMaps.io documentation homepage

Holds the contents of https://docs.bimaps.io

## Reporting Issues

Please report issues to the [bimaps/bimaps](https://github.com/bimaps/bimaps) repo for better visibility.

## Writing guides

Guides are stored in the `guides/` directory and written in Markdown. Each file should contain the following header section with an appropriate title and menu order.

```
---
layout: 'guide'
title: 'Installation'
menuOrder: 1
---
```

## Building the site locally

```bash
npm i
npm run build --serve
```

To regenerate the `_site/` folder, clone modules repo in the subfolder, and then run:

```bash
cd ../modules
npm i
npm run build
node bin/typedoc --options ../typedoc.json
```


## Creating documentation for an module

### Configure files in your module.

1. package.json : add package (min. TS 3.9)
    ````
    "typescript": "^3.9.0",
    "typedoc": "^0.20.34",
    ````

2. .gitignore
    ````
    # Documentation
    docs
    ````

3. typedoc.json
    ````
    {
        "out": "docs/",
        "json": "docs/docs.json",
        "name": "BIMaps.io Documentation",
        "excludeExternals": true,
        "includeVersion": true,
        "entryPoints": ["src/index.ts"]
    }
    ````

Full documentation : [Typedoc](https://typedoc.org/guides/installation/)

<br>
<br>
<br>

### Build you Docs

<br>

1. Run `npx typedoc`