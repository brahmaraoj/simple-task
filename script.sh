#!/bin/sh

flag=0

for files in `git ls-files`; do
  for modfiles in `git ls-files -m` ; do
     if [ $files == $modfiles -o $files == $0 -o $files == "README.md" ]
     then	
#	echo "matched strings are $i $j "
	flag=1
#	echo "total $total"
	break;
     fi
  done	
if [ $flag == 0 ]
then
  echo "if you want to compile $files"
  echo "say y or n"
  read what
  if [ $what == "y" -o $what == "Y" ]
  then
   `gcc $files -o bin-$files` 
  fi
fi
flag=0	
done
