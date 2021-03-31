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

