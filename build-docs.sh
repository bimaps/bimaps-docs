

rm -rf _site
mkdir _site
node typedoc/scripts/generate_options_schema.js _site/schema.json
npm run build

cp -r _site www
zip -r www.zip www
rm -rf www
scp www.zip uf2cq_p5@uf2cq.ftp.infomaniak.com:~/prod/docs.bimaps.io/
ssh uf2cq_p5@uf2cq.ftp.infomaniak.com "cd ~/prod/docs.bimaps.io/
rm -r www
unzip www.zip 
rm www.zip"
rm www.zip



