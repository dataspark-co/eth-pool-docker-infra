#!/usr/bin/env bash

./redis-cmd/stop-redis-cmd.sh
./pool-payouts/stop-eth-pool-payouts.sh
./pool-ui/stop-pool-ui.sh
./pool/stop-eth-pool.sh
./redis/stop-redis.sh
./geth/stop-geth.sh

exit 0
