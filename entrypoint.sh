#!/bin/ash


# Make sure we're in the correct dir
cd /home/container/

STARTUP=`bdsx/bdsx.sh`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container/$ ${MODIFIED_STARTUP}"

cd /home/container/bdsx
ls
sleep 15

cd /home/container/

Xvfb :0 &
export DISPLAY=:0

# Run the Server
${MODIFIED_STARTUP} BDSX_YES=true BDSX_PERMANENT=true 
