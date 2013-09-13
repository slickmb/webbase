
./bin/NodeJS/node.exe ./lib/RequireJS/r.js -o ./build/stage/public/js/require/build.js

echo removing require scripts
rm -rf ./build/stage/public/js/require

echo removing lib script
rm -f ./build/stage/public/js/lib/require.js

echo running sed
sed -i -e "s/\sdata-main=\"js\/require\/main\"//" -e "s/\"\/js\/lib\/require.js\"/\"\/js\/main.js\"/" ./build/stage/public/inc/scripts.inc