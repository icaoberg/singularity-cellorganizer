Bootstrap:shub
From:murphylab/singularity-matlabmcr2017a



IncludeCmd: yes

%runscript
    exec /bin/bash "$@"

%post
    echo "Update aptitude"
    /usr/bin/apt-get update && /usr/bin/apt-get -y upgrade
    /usr/bin/apt-get update --fix-missing
    /usr/bin/apt-get install -y vim wget


    echo "Create folders"
    # Make folders for CBD HPC cluster
    if [ ! -d /images ]; then mkdir /images; fi
    if [ ! -d /projects ]; then mkdir /containers; fi
    if [ ! -d /scratch ]; then mkdir /scratch; fi

    echo "Download binaries"
    cd /home/murphylab && \
    wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.8.0/docker/cellorganizer-binaries.tgz && \
    tar -xvf cellorganizer-binaries.tgz && \
    rm cellorganizer-binaries.tgz && \
     
    mv cellorganizer-binaries/ /opt/ && \
    chmod +x /opt/cellorganizer-binaries/img2slml && \
    chmod +x /opt/cellorganizer-binaries/slml2img && \
    chmod +x /opt/cellorganizer-binaries/slml2report && \
    chmod +x /opt/cellorganizer-binaries/slml2info && \
    chmod +x /opt/cellorganizer-binaries/slml2slml && \
    
    ln -s /opt/cellorganizer-binaries/img2slml /usr/local/bin/img2slml && \
    ln -s /opt/cellorganizer-binaries/slml2img /usr/local/bin/slml2img && \
    ln -s /opt/cellorganizer-binaries/slml2report /usr/local/bin/slml2report && \
    ln -s /opt/cellorganizer-binaries/slml2info /usr/local/bin/slml2info && \
    ln -s /opt/cellorganizer-binaries/slml2slml /usr/local/bin/slml2slml

    mv /opt/mcr/v92/bin/glnxa64/libexpat.so.1 /opt/mcr/v92/bin/glnxa64/libexpat.so.1.backup
    mv /opt/mcr/v92/bin/glnxa64/libexpat.so.1.5.0 /opt/mcr/v92/bin/glnxa64/libexpat.so.1.5.0.backup


	echo "Installing Update Notebook Script"
	mkdir /opt/cellorganizer-scripts
	cat >> /opt/cellorganizer-scripts/update.sh <<- EOF
	#!/bin/bash
	url='http://www.cellorganizer.org/Downloads/v2.8.0/docker/notebooks.txt'
	wget -nc --quiet -O file.txt \$url
	while read -r line; do
	    wget -nc --quiet -O tarball.tgz \$line
	    tar -xvkf tarball.tgz
	    rm -rf tarball.tgz
	done < file.txt
	rm -rf file.txt
	EOF
	
	cat >> /opt/cellorganizer-scripts/get_images.sh <<- EOF
	#!/bin/bash
	FILE='.succesfully_downloaded_images'
	if [ ! -f "\$FILE" ]; then
	    url='http://murphylab.web.cmu.edu/data/Hela/3D/multitiff/cellorganizer_full_image_collection.zip'
	    DIRECTORY='images'
	    if [ ! -d "\$DIRECTORY" ]; then
	        mkdir images && cd images
	    else
	        cd images
	    fi
	    wget -O image_set.zip $url
	    unzip image_set.zip
	    rm -rf image_set.zip
	    touch ../.succesfully_downloaded_images
	else
	    echo 'Images already downloaded.'
	fi
	EOF
	
	echo "Installing Download Demos Scripts"
	mkdir /opt/cellorganizer-demos

######img2slml############
%appenv img2slml
    cell_app=/opt/cellorganizer-binaries/img2slml/
    export cell_app

%apphelp img2slml
    exec echo "Running app img2slml"

%apprun img2slml
    exec /bin/bash "$@"

######slml2img############
%appenv slml2img
    cell_app=/opt/cellorganizer-binaries/slml2img
    export cell_app

%apphelp slml2img
    exec echo "Running app slml2img"

%apprun slml2img
    exec /bin/bash "$@"

######slml2report############
%appenv slml2report
    cell_app=/opt/cellorganizer-binaries/slml2report
    export cell_app

%apphelp slml2report
    exec echo "Running app slml2report"

%apprun slml2report
    exec /bin/bash "$@"

######slml2info############
%appenv slml2info
    cell_app=s/opt/cellorganizer-binaries/lml2info
    export cell_app

%apphelp slml2info
    exec echo "Running app slml2info"

%apprun slml2info
    exec /bin/bash "$@"

######slml2slml############
%appenv slml2slml
    cell_app=/opt/cellorganizer-binaries/slml2slml
    export cell_app

%apphelp slml2slml
    exec echo "Running app slml2slml"

%apprun slml2slml
    exec /bin/bash "$@"
