#!/usr/bin/env bash

docker ps --filter "name=eth-pool-payouts" | grep -i "[e]th-pool-payouts" > /dev/null
exit_code=$?
if [ $exit_code -eq 0 ]
then
  echo "Stopping \"eth-pool-payouts\" Docker container..."
  docker stop eth-pool-payouts > /dev/null
fi

docker ps -a --filter "name=eth-pool-payouts" | grep -i "[e]th-pool-payouts" > /dev/null
exit_code=$?
if [ $exit_code -eq 0 ]
then
  echo "Removing \"eth-pool-payouts\" Docker container..."
  docker rm eth-pool-payouts > /dev/null
fi

echo "Done."

exit 0
