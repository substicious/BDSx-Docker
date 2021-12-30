cd /home/container/BDSx
if [ ! -d ./bdsx ]
then
    chown -R container:container /home/container
    chmod 775 -R /home/container
    git pull upstream master
fi
Xvfb :0 &
export DISPLAY=:0
npm i
BDSX_YES=true BDSX_PERMANENT=true ./bdsx.sh