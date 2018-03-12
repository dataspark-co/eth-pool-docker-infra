#!/usr/bin/env bash

echo "Building \"pool-ui-image\" Docker image..."
docker build -t pool-ui-image .
echo "Done."

exit 0
