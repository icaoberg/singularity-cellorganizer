Bootstrap: docker
From: murphylab/docker-cellorganizer:v2.7.1

IncludeCmd: yes

%runscript
    exec /usr/bin/python "$@"

%post
    /usr/bin/apt-get update && /usr/bin/apt-get -y upgrade
    /usr/bin/apt-get update --fix-missing
    /usr/bin/apt-get install -y vim wget

    # Make folders for CBD HPC cluster
    if [ ! -d /images ]; then mkdir /images; fi
    if [ ! -d /projects ]; then mkdir /containers; fi
    if [ ! -d /scratch ]; then mkdir /scratch; fi
