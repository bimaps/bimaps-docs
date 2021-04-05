---
layout: "guide"
tags: guide
title: "Application requirements"
menuOrder: 2
---


## Prérequis de l’application cliente

### Technologies utilisées pour le navigateur internet

Toutes les briques de l'application sont développées sur les standards en vigueur et implémentées dans les navigateurs modernes

1. HTML5
2. JavaScript
3. CSS 
4. WebGL 1+

### Compatibilité des modules par navigateur

Sont listés uniquement les modules spécifiques.

| Module          | Firefox  | Edge     | Chrome   | Chrome mobile | Safari    | Safari mobile |
| --------        | -------- | -------- | -------- | --------      | --------  | --------      |
| Version actuelle (1) | 76+       | 83+       | 83+       | 84+            | 13.1+      | 13.5+          |
| **Version minimale (2)** | **58**       | **79**       | **63**       | **84**            | **11.1**      | **11.3**          |
| [WebGL 1 3D](https://caniuse.com/#feat=webgl)      | 24       | 79       | 33       | 84            | 8        | 8            |
| [CSS Flexible Box](https://caniuse.com/#feat=flexbox)| 28       | 12       | 29       | 84            | 9        | 9            |
| [CSS Grid Layout](https://caniuse.com/#feat=css-grid) | 54       | 16       | 58       | 84            | 10.1        | 10.3            |
| [SVG](https://caniuse.com/#feat=svg) | 3       | 79       | 4       | 84            | 3.2        | 3.2            |
| [Promise finally](https://caniuse.com/#feat=mdn-javascript_builtins_promise_finally) | 58       | 18       | 63       | 84            | 11.1        | 11.3            |



Remarques :
1. Version actuellement testée (juin 2020), par principe les versions suivantes seront également compatible, mais l'application devra éventuellement être adaptée en fonction des évolutions de la technologie des navigateurs.
2. La version est compatible et sans bug selon caniuse.com.


-----

## Architecture

![bim-infrastructure3.png](/images/old/bim-infrastructure5.png)


## Composants de l'API (serveur)


### IfcConvert (IfcOpenShell)

IfcOpenShell is an open source (LGPL) software library that helps users and software developers to work with the IFC file format. The IFC file format can be used to describe building and construction data. The format is commonly used for Building Information Modelling.

[Technical Info](https://github.com/IfcOpenShell/IfcOpenShell/blob/master/README.md)

[Website](http://ifcopenshell.org/index.html)


### GeometryGymIFC

C# classes to generate and parse OpenBIM IFC (Industry Foundation Class) files.
These classes simultaneously support IFC2x3, IFC4 and Infrastructure proposals for IFC5, and are easily extended for experimental extensions.

[Technical Info](https://github.com/GeometryGym/GeometryGymIFC/blob/master/README.md)


### sys.projection (Proj4js)

Proj4js is a JavaScript library to transform point coordinates from one coordinate system to another, including datum transformations. Originally a port of PROJ.4 and GCTCP C it is a part of the MetaCRS group of projects.

[Technical Info](https://github.com/proj4js/proj4js/blob/master/README.md)

[Website](http://proj4js.org)


### three.js

JavaScript 3D library
The aim of the project is to create an easy to use, lightweight, 3D library with a default WebGL renderer. The library also provides Canvas 2D, SVG and CSS3D renderers in the examples.

[Technical Info](https://github.com/mrdoob/three.js/blob/dev/README.md)

### BCF API

BCF is a format for managing issues on a BIM project. The BCF-API supports the exchange of BCF issues between software applications via a RESTful web interface, which means that data is exchanged via Url-encoded query parameters and Json bodies over the Http protocol. Every resource described in this API has a corresponding Json schema (schema version draft-03). Url schemas in this readme are relational to the BCF base servers Url if no absolute values are provided.

[Technical Info](https://github.com/buildingSMART/BCF-API/blob/release_2_1/README.md)

### MongoDB

[Technical Info](https://github.com/mongodb/mongo/blob/master/README)

