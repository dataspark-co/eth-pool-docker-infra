#!/usr/bin/env bash

echo "Stopping geth-01..."
screen -S geth-01 -X quit
echo "Done."

exit 0
