#!/usr/bin/env bash

docker ps --filter "name=redisdb" | grep -i "[e]th-pool-payouts" > /dev/null
exit_code=$?
if [ $exit_code -eq 0 ]
then
  echo "Stopping \"redisdb\" Docker container..."
  docker stop redisdb > /dev/null
fi

docker ps -a --filter "name=redisdb" | grep -i "[e]th-pool-payouts" > /dev/null
exit_code=$?
if [ $exit_code -eq 0 ]
then
  echo "Removing \"redisdb\" Docker container..."
  docker rm redisdb > /dev/null
fi

echo "Done."

exit 0
