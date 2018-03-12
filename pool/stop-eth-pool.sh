#!/usr/bin/env bash

echo "Stopping \"eth-pool\" Docker container..."
docker stop eth-pool
echo "Removing \"eth-pool\" Docker container..."
docker rm eth-pool
echo "Done."

exit 0
