
echo compiling server side includes
for inc in `find ./build/stage/public -type f -iregex '.*\(inc\|inc\.html\)'`
do
    sedInc=${inc##./build/stage/public/}
    echo $sedInc
    sedInc=`echo $sedInc | sed -e 's/[]\/()$*.^|[]/\\\&/g'`
    sedInc="virtual=\"\\/\\?${sedInc}"
    find ./build/stage -type f -iregex '.*\(html\|inc\)' | xargs -i{} sed -i -e "/$sedInc/{
                s/.*//
                r $inc
            }" {}
done

echo adjusting relative links
for html in `find ./build/stage/public -type f -iregex '.*\(html\|css\)'`
do
    depth=`echo $html | perl -ne '$count=0; while(/\//g){++$count}; print "$count";'`
    depth=$((depth-4))
    if [ "$depth" = "0" ]; then
        replace=".\\/"
    else
        replace=`for ((i=0;i<$depth;++i)); do echo -n ..\\\\/; done;`
    fi

    echo $html $depth $replace
    sed -i -e "s/\"\/\(\\w\|\"\|'\)/\"$replace\\1/g" -e "s/'\/\(\\w\|\"\|'\)/'$replace\\1/g" $html
done

rm -rf ./build/stage/public/inc
