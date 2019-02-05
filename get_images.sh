#!/bin/bash

url='http://murphylab.web.cmu.edu/data/Hela/3D/multitiff/cellorganizer_full_image_collection.zip'
DIRECTORY='images'
if [ ! -d "$DIRECTORY" ]; then
	mkdir images && cd images
else
	cd images
fi

wget -nc --quiet -O image_set.zip $url
unzip image_set.zip
rm -rf image_set.zip
