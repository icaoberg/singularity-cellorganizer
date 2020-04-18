#!/bin/bash

APP="cellorganizer"
VERSION=2.8.1
OS=ubuntu-v16.04
IMAGE=singularity-"$OS"-"$APP"-v"$VERSION".sif
DEFINITION=Singularity

if [ -f $IMAGE ]; then
	rm -fv $IMAGE
fi

sudo singularity build $IMAGE $DEFINITION
