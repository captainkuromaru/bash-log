#!/bin/bash
lastPostN=""
if [ ! -f ./index.html ]; then
    touch index.html
fi

if [ ! -f ./lastPost ]; then
    touch lastPost
fi

if [ ! -d ./back ]; then
    mkdir back
fi
back=".back"
newpost=${1%%.*}
newpost=$newpost.html

if [ ! -d ./drafts ]; then
    mkdir drafts
fi

if [ ! -d ./posts ]; then
    mkdir posts
fi

if [ -s ./lastPost ]; then
	while read LINE; do
	    lastPostN=$LINE
	done < lastPost
fi

echo "lastpost is ${lastPostN}"

cp $1 drafts/$newpost
touch posts/$newpost

while read LINE; do
    echo $LINE >> posts/$newpost
done < head

echo "<div id='goback'><a href='/index.html'>go back</a></div>" >> posts/$newpost

echo "<div id='content'>" >> posts/$newpost
regexp="^#.*"
while read line; do
	#if [[ $LINE=~ $regexp ]]; then
	##postTitle= `$LINE | tr -d '#'` && echo $postTitle
	#	echo $LINE;
	#fi
	case "$line" in
		\#*)
			postTitle=$line;;
		*) continue;;
	esac
	if [ ! $line == $postTitle ]; then
		echo $line >> posts/$newpost
	fi
done < $1
postTitle="$(echo $postTitle | tr -d '#')"
echo "<div id='other posts'>" >> posts/$newpost
if [ -s ./lastPost ]; then
	echo "<br><a href='/posts/$lastPostN'>previous post $lastPostN</a>" >> posts/$newpost
fi
echo "</div>" >> posts/$newpost
echo "</div>" >> posts/$newpost
echo "</body></html>" >> posts/$newpost
echo $newpost > lastPost
#/bin/bash genIndex.sh
sed -i "/<head>/a <title>${postTitle}</title>" posts/$newpost
if [ ! $lastPostN == "" ]; then
	/bin/bash retroGenPost0.sh $lastPostN $newpost
fi
