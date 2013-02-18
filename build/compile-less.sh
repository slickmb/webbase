echo expanding less source
mkdir -p ./build/stage/less
unzip -q -o -d ./build/stage/less -- ./lib/Less/less.js-master.zip

./bin/NodeJS/node.exe ./build/stage/less/less.js-master/bin/lessc --x ./build/stage/public/css/less/main.less > ./build/stage/public/css/main.css

echo removing less files.
rm -rf ./build/stage/public/css/less

echo removing lib script
rm -f ./build/stage/public/js/lib/less-1.3.3.min.js

echo running sed
sed -i -e "s/\"stylesheet\/less\"/\"stylesheet\"/" -e "s/css\/less\/main\.less/css\/main.css/" -e "/<script.*js\/lib\/less[^\"]*\.js/d" ./build/stage/public/inc/head.inc