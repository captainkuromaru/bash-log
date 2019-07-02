#!/bin/bash
nextPost=""
nextPost=$2
retroPost=""
retroPost="$1"
#while read line; do
#	if [[ $LINE == *"<div id="article">"* ]]; then
#
#	fi
#done < posts/$retroPost
#echo "<br><a href='/posts/$nextPost.html'>nextPost $nextPost.html</a>" >> posts/$retroPost
sed -i "/<div id='other posts'>/a <br><a href='/posts/${nextPost}'>nextPost ${nextPost}</a>" posts/$retroPost
echo "done"
