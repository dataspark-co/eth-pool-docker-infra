#!/usr/bin/env bash

echo "Starting \"redisdb\" Docker container..."
docker run --name redisdb -v $(pwd)/data:/data --net="host" -d redis redis-server --appendonly yes --save "60 1000"

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
    docker ps --filter "name=redisdb" | grep -i "[r]edisdb" > /dev/null
    exit_code=$?
done

docker ps --filter "name=redisdb"
echo "Done."

exit 0
