#!/bin/ash

Xvfb :0 &
export DISPLAY=:0

apk update
apk add --no-cache --update
git npm

# make sure we're in correct dir
if [ ! -d /mnt/server ]; then
    mkdir /mnt/server
fi

cd /mnt/server

# install
if [ ! -d bdsx ]; then
    git clone https://github.com/bdsx/bdsx.git
fi

# update
cd bdsx
git pull --ff-only

./update.sh

# Make sure we're in the correct dir
cd /home/container/

STARTUP=`bdsx/bdsx.sh`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container/$ ${MODIFIED_STARTUP}"

# Run the Server
BDSX_YES=true BDSX_PERMANENT=true ${MODIFIED_STARTUP}
