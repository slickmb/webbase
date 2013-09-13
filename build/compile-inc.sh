
echo compiling server side includes
for inc in `ls ./build/stage/public/inc`
do
    echo $inc
    find ./build/stage -type f -iregex '.*\(html\|inc\)' | xargs -i{} sed -i -e "/$inc/{
                s/.*//
                r ./build/stage/public/inc/$inc
            }" {}
done

echo adjusting relative links
for html in `find ./build/stage/public -type f -iregex '.*\(html\|css\)'`
do
    depth=`echo $html | perl -ne '$count=0; while(/\//g){++$count}; print "$count";'`
    depth=$((depth-4))
    replace=`for ((i=0;i<$depth;++i)); do echo -n ..\\\\/; done;`
    echo $html $depth $replace
    sed -i -e "s/\"\//\"$replace/g" -e "s/'\//'$replace/g" $html
done

rm -rf ./build/stage/public/inc
