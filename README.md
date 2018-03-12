# Open Ethereum Pool Docker infrastructure

Use the awesome [Docker CE](https://www.docker.com/community-edition) to get
[sammy007/open-ethereum-pool](https://github.com/sammy007/open-ethereum-pool) up and running quickly.

## Instructions on how to run this project

1. Install Docker. Please [see official instructions](https://docs.docker.com/install/).

2. Install geth. Please [see official instructions](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum).

3. Install [screen](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-screen-on-an-ubuntu-cloud-server) and [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

4. Clone this repository to local drive:

```
git clone https://github.com/valera-rozuvan/eth-pool-docker-infra.git
```

5. Launch a node on the Ethereum mainnet network:

```
cd eth-pool-docker-infra/geth
./run-geth.sh
```

6. Wait for the node to fully synchronize. To check run:

```
./attach-to-geth.sh
```

and then execute the JavaScript command `eth.blockNumber`. If you see a number close
to the current Ethereum block number (see [Etherscan](https://etherscan.io/) to find out the current number), then your node is synced.

7. Launch Redis container:

```
cd eth-pool-docker-infra/redis
./run-redis.sh
```

8. Launch Pool container:

```
cd eth-pool-docker-infra/pool
./build-eth-pool-image.sh
./run-eth-pool.sh
```

9. Build Pool UI web application. Locally clone the [Open Ethereum Pool](https://github.com/sammy007/open-ethereum-pool) project, and follow the instructions
to build the UI found in the [README](https://github.com/sammy007/open-ethereum-pool/blob/master/README.md) file.

10. Transfer build UI app `dist` folder to server:

```
rsync -avz -e 'ssh' ./dist root@94.247.132.203:/root/dev/eth-pool-docker-infra/pool-ui

```

NOTE: Please modify the IP and paths according to your setup!

11. Launch Pool UI container:

```
cd eth-pool-docker-infra/pool-ui
./build-pool-ui-image.sh
./run-pool-ui.sh
```

12. Launch Pool Payouts module:

```
cd eth-pool-docker-infra/pool-payouts
./build-eth-pool-payouts-image.sh
./run-eth-pool-payouts.sh
```

13. Additionally, you can run [redis-commander](https://github.com/joeferner/redis-commander) to inspect the
state of the Redis database. First install [Node.js](https://nodejs.org/), and then install `redis-commander`.
When done, you can use the shell scripts in the folder `eth-pool-docker-infra/redis-cmd`:

```
# to start:
./run-redis-cmd.sh

# to stop:
./stop-redis-cmd.sh
```

## FAQ

1. How to enable RPC access to geth from anywhere

```
geth {{usual parameters}} --rpc --rpcport 13270 --rpcaddr "0.0.0.0" --rpccorsdomain "*"
```

2. How to create an account using `geth` CLI

```
geth --datadir ./data account new
```

3. How to unlock an account when `geth` launches

```
geth {{usual parameters}} --unlock "0xf5d6ecb770db5a3a9de21e2adc531befa6f2c551" --password passwd.txt
```

where `passwd.txt` is a text file containing the account's password.

4. How to setup a private Ethereum test network

We can permanently disable the built-in Ethereum mainnet bootnodes by commenting
out (deleting) all of the `enode` URIs in the file `params/bootnodes.go` and rebuilding `geth`.

Create a `genesis.json` file with desirable blockchain initialization parameters. For example:

```
{
  "config": {
    "chainId": 847283914,
    "homesteadBlock": 0,
    "eip155Block": 0,
    "eip158Block": 0
  },
  "difficulty": "200000000",
  "gasLimit": "2100000",
  "alloc": {}
}
```

Initialize the private blockchain:

```
geth --datadir ./data init ./genesis.json
```

```
geth {{usual parameters}} --networkid 847283914
```

We can permanently disable the built-in Ethereum mainnet bootnodes by commenting
out (deleting) all of the `enode` URIs in the file `params/bootnodes.go` and rebuilding `geth`.

5. How to launch a second `geth` node, and connect to your private network

Create a copy of the folder `eth-pool-docker-infra/geth` (without the `data` folder, if it's located there).
Initialize the blockchain, and then launch `geth` with the same command you used to launch the first private node,
but use different parameters for `port` and `rpcport`:

```
geth {{usual parameters}} --port 42371 --rpcport 13271
```

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for more details.
