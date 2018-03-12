#!/usr/bin/env bash

echo "Stopping redis-cmd"
screen -S redis-cmd -X quit
