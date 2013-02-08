
./bin/NodeJS/node.exe ./lib/RequireJS/r.js -o "baseUrl=./build/stage/public" "name=js/require/main" "out=./build/stage/public/js/main.js"

#./bin/NodeJS/node.exe ./lib/RequireJS/r.js -o "cssIn=./build/stage/public/css/main.css" "out=./build/stage/public/css/main.css"
#mv -f ./build/stage/public/css/main-min.css ./build/stage/public/css/main.css
#rm -f ./build/stage/public/css/main-min.css

echo removing require scripts
rm -rf ./build/stage/public/js/require

echo removing lib script
rm -f ./build/stage/public/js/lib/require.js

echo running sed
sed -i -e "s/\sdata-main=\"js\/require\/main\"//" -e "s/\"js\/lib\/require.js\"/\"js\/main.js\"/" ./build/stage/public/inc/scripts.inc