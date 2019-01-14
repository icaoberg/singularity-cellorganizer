Bootstrap: docker
From: murphylab/docker-cellorganizer:v2.7.1

IncludeCmd: yes


%runscript
    exec /bin/bash "$@"

%post
    echo "apt get update"
    /usr/bin/apt-get update && /usr/bin/apt-get -y upgrade
    /usr/bin/apt-get update --fix-missing
    /usr/bin/apt-get install -y vim wget

    echo "Create Folders"
    # Make folders for CBD HPC cluster
    if [ ! -d /images ]; then mkdir /images; fi
    if [ ! -d /projects ]; then mkdir /containers; fi
    if [ ! -d /scratch ]; then mkdir /scratch; fi
    
    echo "Download"
    cd ~/ && \
    wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/v2.7.2/cellorganizer-v2.7.2-binaries.tgz && \
    tar -xvf cellorganizer-v2.7.2-binaries.tgz && \
    rm cellorganizer-v2.7.2-binaries.tgz && \
    
    mv cellorganizer-binaries/* /opt/cellorganizer-binaries/
    chmod +x /opt/cellorganizer-binaries/img2slml && \
    chmod +x /opt/cellorganizer-binaries/slml2img && \
    chmod +x /opt/cellorganizer-binaries/slml2report && \
    chmod +x /opt/cellorganizer-binaries/slml2info && \
    chmod +x /opt/cellorganizer-binaries/slml2slml && \
    
    ln -sf /opt/cellorganizer-binaries/img2slml /usr/local/bin/img2slml && \
    ln -sf /opt/cellorganizer-binaries/slml2img /usr/local/bin/slml2img && \
    ln -sf /opt/cellorganizer-binaries/slml2report /usr/local/bin/slml2report && \
    ln -sf /opt/cellorganizer-binaries/slml2info /usr/local/bin/slml2info && \
    ln -sf /opt/cellorganizer-binaries/slml2slml /usr/local/bin/slml2slml

    echo "Downloading models" && \
    wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/v2.7.2/cellorganizer-v2.7.2-models.tgz && \
    tar -xvf cellorganizer-v2.7.2-models.tgz && \
    rm -f cellorganizer-v2.7.2-models.tgz

%appenv cellorganizer
   BEST_APP=cellorganizer
   export BEST_APP

%apphelp cellorganizer
    exec echo "For more information visit"

%apprun cellorganizer
    cellorganizer "$@"
    #find /home/murphylab/cellorganizer/demos -name "*.sh" | xargs chmod +x {}  "$@"
