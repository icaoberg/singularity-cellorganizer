Bootstrap: docker
From: icaoberg/matlabmcr2017a

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
    
    ln -sf /opt/cellorganizer-binaries/img2slml /usr/local/bin/img2slml && \
    ln -sf /opt/cellorganizer-binaries/slml2img /usr/local/bin/slml2img && \
    ln -sf /opt/cellorganizer-binaries/slml2report /usr/local/bin/slml2report && \
    ln -sf /opt/cellorganizer-binaries/slml2info /usr/local/bin/slml2info && \
    ln -sf /opt/cellorganizer-binaries/slml2slml /usr/local/bin/slml2slml

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
    cell_app=/opt/cellorganizer-binaries/lml2report
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
