#!/bin/bash

PUB=`cd www;pwd;cd ..`
CHANGED=0

cd www-repo
LASTREV=`git log -1 --format=format:%H`
git pull
REV=`git log -1 --format=format:%H`
cd ..
if [ "$LASTREV" != "$REV" ]
then
  echo "updating aspect www"
  cp -r www-repo/* www/
  chmod u+x www/*html
  CHANGED=1
fi

cd aspect-repo
LASTREV=`git log -1 --format=format:%H`
git pull
REV=`git log -1 --format=format:%H`
if [ "$LASTREV" != "$REV" ]
then
    echo "Updating Aspect: to $REV at `date`"

    # build documentation
    docker run --rm -v "$(pwd):/home/bob/source"  tjhei/dealii-doc-gen /bin/bash -c "cd source/doc; make aspect.tag"
    
    rm -rf $PUB/doc/
    tar cf - doc | (cd $PUB ; tar xf -)    

    CHANGED=1
fi    
cd ..

if [ "$CHANGED" == "1" ]
then
    # build www/publications.html
    cp aspect-repo/doc/manual/citing_aspect.bib publication-list/
    cp www-repo/
    docker run --rm -v "$(pwd)/publication-list:/home/bob/source" tjhei/dealii-java-jabref
    cp publication-list/output.html www/publication-list.html
fi
