# Copy Readme Ifc2json
cp ../ifc2json/README.md api/ifc2json.md


# Build home + guides pages
# npm install
rm -rf _site
mkdir _site
npm run build

# API Docs
# node typedoc/scripts/generate_options_schema.js _site/schema.json

## Application cliente

# cd ../bimetat-app/
# npx typedoc
cd ../aurelia-three/
npx typedoc
cd ../aurelia-bcf/
npx typedoc
cd ../aurelia-resources/
npx typedoc
cd ../aurelia-deco/
npx typedoc


cd ../bimaps-docs
mkdir _site/api/bimaps-app
mkdir _site/api/aurelia-three
mkdir _site/api/aurelia-bcf
mkdir _site/api/aurelia-resources
mkdir _site/api/aurelia-deco
cp -r ../bimetat-app/docs/* _site/api/bimaps-app
cp -r ../aurelia-three/docs/* _site/api/aurelia-three
cp -r ../aurelia-bcf/docs/* _site/api/aurelia-bcf
cp -r ../aurelia-resources/docs/* _site/api/aurelia-resources
cp -r ../aurelia-deco/docs/* _site/api/aurelia-deco



## Serveur API
# cd ../bimetat-api/
# npx typedoc
cd ../deco-three
npx typedoc
cd ../deco-bcf
npx typedoc
cd ../ifc2json-wrapper
npx typedoc
cd ../deco-api
npx typedoc

cd ../bimaps-docs
mkdir _site/api/bimaps-api
mkdir _site/api/deco-three
mkdir _site/api/deco-bcf
mkdir _site/api/ifc2json-wrapper
mkdir _site/api/deco-api
cp -r ../bimetat-api/docs/* _site/api/bimaps-api
cp -r ../deco-three/docs/* _site/api/deco-three
cp -r ../deco-bcf/docs/* _site/api/deco-bcf
cp -r ../ifc2json-wrapper/docs/* _site/api/ifc2json-wrapper
cp -r ../deco-api/docs/* _site/api/deco-api
