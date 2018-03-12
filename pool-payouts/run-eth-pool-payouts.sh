#!/usr/bin/env bash

echo "Starting \"eth-pool-payouts\" Docker container..."
screen -dmS eth-pool-payouts docker run --name eth-pool-payouts --net="host" eth-pool-payouts-image

loop_counter=10
exit_code=1
while [ $exit_code -ne 0 ]; do
    if [ $loop_counter -eq 0 ]
    then
        echo "Error! Timeout reached. Container not started."
        exit 1
    fi

    loop_counter=$(( $loop_counter - 1 ))

    sleep 1
    docker ps --filter "name=eth-pool-payouts" | grep -i "[e]th-pool-payouts" > /dev/null
    exit_code=$?
done

docker ps --filter "name=eth-pool-payouts"
echo "Done."

exit 0
