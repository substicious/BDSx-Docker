#!/bin/bash

if [ ! -f "$BDS/installinfo.json" ]; then
    ln -sb $BASE $DATA
fi

exec "./bdsx.sh"