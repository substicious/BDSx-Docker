#!/bin/sh

if [ ! -f "$DATA_PATH/configs/server.properties" ]; then
  cp -R $DEFAULT_CONFIG_PATH/* $DATA_PATH/configs/

if [ ! -d "$DATA_PATH/worlds" ]; then
  mkdir -p $DATA_PATH/worlds
fi

ln -sb $DATA_PATH/configs/permissions.json $BDS/permissions.json
ln -sb $DATA_PATH/configs/whitelist.json $BDS/whitelist.json
ln -sb $DATA_PATH/configs/server.properties $BDS/server.properties
ln -sb $DATA_PATH/worlds $BDS/worlds

exec "$@"