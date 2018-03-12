#!/usr/bin/env bash

echo "Starting geth..."
screen -dmS geth /usr/bin/geth --datadir ./data --port 42370 --rpc --rpcport 13270 --cache=1024
echo "Done."

exit 0
