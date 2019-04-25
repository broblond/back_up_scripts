#!/bin/sh 
cd /name/of/dir/
cp -r /name/for/file /name/b-up/dir/
tar czvf $1.$(date +%Y%m%d-%H%M%S).tgz $1 
exit $?
