#!/bin/bash

#This scipt update the Singularity notebooks to the latest version available on CellOrganizer.
#Singularity notebooks are workflows that perform multiple functions in the same script. 

url='http://www.cellorganizer.org/Downloads/v2.8.0/docker/notebooks.txt'
DIRECTORY='notebooks'
if [ ! -d "$DIRECTORY" ]; then
	mkdir notebooks && cd notebooks
else
 	echo 'here'
 	cd notebooks
fi

wget -nc --quiet -O file.txt $url
while read -r line; do
	wget -nc --quiet -O tarball.tgz $line
	tar -xvkf tarball.tgz
	rm -rf tarball.tgz
done < file.txt

rm -rf file.txt
