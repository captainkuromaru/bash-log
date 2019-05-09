#!/bin/bash
back=".back"
newpost=$1.html
cp $1 drafts/$newpost
touch posts/$newpost

while read LINE; do
    echo $LINE >> posts/$newpost
done < head

echo "<div id='goback'><a href='/index.html'>go back</a></div>" >> posts/$newpost

echo "<div id='content'>" >> posts/$newpost
while read line; do
    echo $line >> posts/$newpost
done < $1
echo "</div>" >> posts/$newpost

echo "</body></html>" >> posts/$newpost
echo "done?"
/bin/bash genIndex.sh
