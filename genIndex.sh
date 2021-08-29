#!/bin/bash
back=".back"
cp index.html back/index.html
rm index.html
cp -R posts ./back/posts
cp -R drafts ./back/drafts
indexFile="index.html"
declare -a posts
declare -i cunt=0
posts=()
while read LINE; do
    echo $LINE >> $indexFile
done < head
dirn="posts"
for entry in `ls -t $dirn`; do
        posts[$cunt]=$entry
    ((cunt=$cunt+1))
done
echo "<div id='content'>" >> index.html
echo "<h3> my posts </h3>" >> index.html
echo "<ul>" >> index.html
arrLen=${#posts[@]}
for (( j=0; j<= arrLen-1; j++ ));
do
	echo "<li><a href='./$dirn/${posts[$j]}'>${posts[$j]}</a></li>" >> index.html
done
echo "</ul>" >> index.html
echo "</div>" >> index.html
echo "<div id='goback'><a href='/'> main page </a></div>" >> index.html
echo "</body></html>" >> index.html
