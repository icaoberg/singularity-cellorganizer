#!/bin/bash

APP="cellorganizer"
VERSION=2.8.1
OS=ubuntu-v16.04
IMAGE=singularity-"$OS"-"$APP"-v"$VERSION".sif
DEFINITION=Singularity
LIST_OF_BINARIES="img2slml slml2img slml2slml slml2info slml2report"

if [ -f $IMAGE ]; then
	rm -fv $IMAGE
fi

#sudo singularity build $IMAGE $DEFINITION

if [ ! -d $APP/v$VERSION ]; then
	mkdir -p $APP/v$VERSION
fi

if [ -f $IMAGE ]; then
	mv -v $IMAGE $APP/v$VERSION/
fi

cp modulefile $APP/v$VERSION/
sed -i 's|NAME_OF_THE_APPLICATION|'$APP'|g' $APP/v$VERSION/modulefile
sed -i 's|VERSION_OF_THE_APPLICATION|'$VERSION'|g' $APP/v$VERSION/modulefile

APPS=($LIST_OF_BINARIES)

for BINARY in "${APPS[@]}"
do
cat << EOF > $APP/v$VERSION/$BINARY
#!/bin/bash

IMAGE=singularity-OPERATING_SYSTEM-NAME_OF_THE_APPLICATION-vVERSION_OF_THE_APPLICATION.sif
DIRECTORY=\$(dirname \$0)
APPLICATION=$BINARY

source /containers/images/other/functions.sh

if is_compute_node; then
	singularity run --app \$APPLICATION \$DIRECTORY/\$IMAGE "\$1"
else
	cat /containers/images/other/MESSAGE
	exit 1
fi
EOF

chmod +x $APP/v$VERSION/$BINARY
sed -i 's|OPERATING_SYSTEM|'$OS'|g' $APP/v$VERSION/$BINARY
sed -i 's|VERSION_OF_THE_APPLICATION|'$VERSION'|g' $APP/v$VERSION/$BINARY
sed -i 's|NAME_OF_THE_APPLICATION|'$APP'|g' $APP/v$VERSION/$BINARY
done

cat << EOF > $APP/v$VERSION/modulefile
#%Module
##
## NAME_OF_THE_APPLICATION modulefile
##
## modulefiles/
##

set ver VERSION_OF_THE_APPLICATION

set msg "This module adds NAME_OF_THE_APPLICATION $ver to various paths\n"

proc ModulesHelp { } {
        puts stderr $msg
}

module-whatis "Use NAME_OF_THE_APPLICATION v$ver"

prepend-path PATH /containers/images/NAME_OF_THE_APPLICATION/vVERSION_OF_THE_APPLICATION/
EOF

sed -i 's|NAME_OF_THE_APPLICATION|'$APP'|g' $APP/v$VERSION/modulefile
sed -i 's|VERSION_OF_THE_APPLICATION|'$VERSION'|g' $APP/v$VERSION/modulefile

if [ -d demos ]; then
	cp -r demos $APP/v$VERSION/
fi
