#/bin/bash

if [ $# -ne 2 ]
then
  echo "Usage: $0 <file> <linkPath>"
fi

pathDotfile=$(realpath "$1")
ln -s "$pathDotfile" $2
