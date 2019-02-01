#!/bin/bash


DIRECTORY=templates
if [ ! -d "$DIRECTORY" ]; then
	mkdir templates && cd templates
	wget -nc --quiet #PLACEHOLDER
else
	cd templates
	wget -nc --quiet #PLACEHOLDER
fi
