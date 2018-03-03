# eth-pool-docker-infra
eth-pool-docker-infra

Instructions on how to use this project:

1. Install Docker. Please [see official instructions](https://docs.docker.com/install/).

2. Install geth. Please [see official instructions](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum).

3. Install [screen](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-screen-on-an-ubuntu-cloud-server) and [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

3. Clone this repository to local drive:

```
git clone https://github.com/valera-rozuvan/eth-pool-docker-infra.git
```

4. Launch a node on the Ethereum mainnet network:

```
cd eth-pool-docker-infra/geth
./run-geth.sh
```

5. Wait for the node to fully synchronize. To check run:

```
./attach-to-geth.sh
```

and then execute the JavaScript command `eth.blockNumber`. If you see a number close
to the current Ethereum block number (see [Etherscan](https://etherscan.io/) to find out the current number), then your node is synced.

6. Launch Redis container:

```
cd eth-pool-docker-infra/redis
./run-redis.sh
```

7. Launch Pool container:

```
cd eth-pool-docker-infra/pool
./build-eth-pool-image.sh
./run-eth-pool.sh
```

8. Build Pool UI web application. Locally clone the [Open Ethereum Pool](https://github.com/sammy007/open-ethereum-pool) project, and follow the instructions
to build the UI found in the [README](https://github.com/sammy007/open-ethereum-pool/blob/master/README.md) file.

9. Transfer build UI app `dist` folder to server:

```
rsync -avz -e 'ssh' ./dist root@94.247.132.203:/root/dev/eth-pool-docker-infra/pool-ui

```

NOTE: Please modify the IP and paths according to your setup!

10. Launch Pool UI container:

```
cd eth-pool-docker-infra/pool-ui
./build-pool-ui-image.sh
./run-pool-ui.sh
```
