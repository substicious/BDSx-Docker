#Make sure we're in the correct dir
cd /home/container/bdsx

if [ ! -d ./bdsx ]
then
    git init
    git config pull.ff only
    git remote add upstream https://github.com/bdsx/bdsx.git
    git pull upstream master
fi

Xvfb :0 &
export DISPLAY=:0

npm i
BDSX_YES=true BDSX_PERMANENT=true /home/container/bdsx/bdsx.sh