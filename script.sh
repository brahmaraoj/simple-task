#!/bin/sh

total=0

for i in `git ls-files`; do
  for j in `git ls-files -m` ; do
     if [ $i == $j -o $i == $0 -o $i == "README.md" ]
     then	
#	echo "matched strings are $i $j "
	total=1
#	echo "total $total"
	break;
     fi
  done	
if [ $total == 0 ]
then
  echo "if you want to compile $i"
  echo "say y or n"
  read what
  if [ $what == "y" -o $what == "Y" ]
  then
   `gcc $i -o bin-$i` 
  fi
fi
total=0	
done
