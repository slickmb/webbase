rm -rf ./build/public
rm -rf ./build/stage

mkdir -p ./build/stage
cp -rf ./public ./build/stage

./build/compile-less.sh $1
./build/compile-r.sh $1
./build/compile-inc.sh $1

rm -rf ./build/stage/public/js/lib
cp -rf ./build/stage/public ./build
rm -rf ./build/stage