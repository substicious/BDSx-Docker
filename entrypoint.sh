cd /home/container/BDSx
if [ ! -d ./bdsx ]
then
    git pull upstream master
fi
Xvfb :0 &
export DISPLAY=:0
npm i
BDSX_YES=true BDSX_PERMANENT=true ./bdsx.sh