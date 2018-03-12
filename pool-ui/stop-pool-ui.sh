#!/usr/bin/env bash

echo "Stopping \"pool-ui\" Docker container..."
docker stop pool-ui
echo "Removing \"pool-ui\" Docker container..."
docker rm pool-ui
echo "Done."

exit 0
