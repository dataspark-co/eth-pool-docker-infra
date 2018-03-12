#!/usr/bin/env bash

echo "Starting redis-cmd..."
screen -dmS redis-cmd redis-commander --redis-port 6379 --redis-host 127.0.0.1 --port 8081 --address 0.0.0.0
echo "Done."

exit 0
