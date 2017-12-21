#!/bin/bash

# Automated script

# required mounts:
# writable output dir: /home/bob/source/

# example usage:
#   mkdir out
#   docker run --rm -v "$(pwd)/out:/home/bob/source" tjhei/dealii-java-jabref

BIBFILE=`ls ~/source/*bib || echo x`

if [ -s $BIBFILE ]; then
  echo "found $BIBFILE"
else
  echo "ERROR, please mount /home/bob/source"

  echo "usage:"
  echo "  docker run --rm -v \"\$(pwd)/out:/home/bob/source\" tjhei/dealii-java-jabref"
  exit 2
fi

java -jar JabRef-*.jar -o source/output.html,aspect-biblist -n -i $BIBFILE
exit 0
