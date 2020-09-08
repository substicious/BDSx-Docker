#!/bin/sh

if [ ! -f "$BDS/server.properties" ]; then
  cp $DEFAULT_CONFIG_PATH/permissions.json $DATA_PATH/configs/permissions.json
  cp $DEFAULT_CONFIG_PATH/whitelist.json $DATA_PATH/configs/whitelist.json
  cp $DEFAULT_CONFIG_PATH/server.properties $DATA_PATH/configs/server.properties
fi

if [ ! -d "$DATA_PATH/worlds" ]; then
  mkdir -p $DATA_PATH/worlds
fi

ln -sb $DATA_PATH/configs/permissions.json $BDS/permissions.json
ln -sb $DATA_PATH/configs/whitelist.json $BDS/whitelist.json
ln -sb $DATA_PATH/configs/server.properties $BDS/server.properties
ln -sb $DATA_PATH/worlds $BDS/worlds

exec "$@"