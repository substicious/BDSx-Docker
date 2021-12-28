#Make sure we're in the correct dir
cd /home/container/bdsx

if [ ! -d ./bdsx ]
then
    git init
    git config pull.ff only
    git pull upstream master
    git remote add upstream https://github.com/bdsx/bdsx.git
fi

Xvfb :0 &
export DISPLAY=:0

npm i
BDSX_YES=true BDSX_PERMANENT=true ./bdsx.sh