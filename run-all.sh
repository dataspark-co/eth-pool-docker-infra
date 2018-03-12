#!/usr/bin/env bash

./geth/run-geth.sh
sleep 3

./redis/run-redis.sh
sleep 3

./pool/run-eth-pool.sh
sleep 2

./pool-ui/run-pool-ui.sh
sleep 2

./pool-payouts/run-eth-pool-payouts.sh
sleep 2

./redis-cmd/run-redis-cmd.sh

exit 0
