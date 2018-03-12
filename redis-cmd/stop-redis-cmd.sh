#!/usr/bin/env bash

echo "Stopping geth"
screen -S redis-cmd -X quit
