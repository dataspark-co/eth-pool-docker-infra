#!/usr/bin/env bash

docker run --name redisdb -v $(pwd)/data:/data --net="host" -d redis redis-server --appendonly yes
