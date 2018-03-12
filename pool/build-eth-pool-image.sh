#!/usr/bin/env bash

echo "Building \"eth-pool-image\" Docker image..."
docker build -t eth-pool-image .
echo "Done."

exit 0
