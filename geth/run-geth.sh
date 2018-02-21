#!/usr/bin/env bash

echo "Starting geth"
screen -dmS geth-00 /usr/bin/geth --datadir ./data --port 42370 --rpcport 13270 --rpc --cache=1024
