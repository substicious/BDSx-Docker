#Make sure we're in the correct dir
cd /home/container/

if [ ! -d ./bdsx ]
then
    git clone https://github.com/bdsx/bdsx.git /home/container
fi

Xvfb :0 &
export DISPLAY=:0

npm i
BDSX_YES=true BDSX_PERMANENT=true /home/container/bdsx.sh