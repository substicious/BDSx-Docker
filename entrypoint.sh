cd /home/container/BDSx

if [ ! -d ./bdsx ]
then
    git clone https://github.com/bdsx/bdsx.git /home/container/BDSx
    chmod +x /home/container/BDSx/bdsx.sh
fi
Xvfb :0 &
export DISPLAY=:0
npm i
BDSX_YES=true BDSX_PERMANENT=true ./bdsx.sh