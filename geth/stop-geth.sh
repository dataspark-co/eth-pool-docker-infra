#!/usr/bin/env bash

echo "Stopping geth..."
screen -S geth -X quit
echo "Done."

exit 0
