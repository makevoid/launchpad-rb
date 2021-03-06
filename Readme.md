# launchpad.rb

status: WIP

#### https://github.com/makevoid/launchpad-rb/blob/master/stack/app/try-eth-rb.rb

### Step 1) Setup

Deploy an ethereum contract and call it

```rb
require_relative 'env'

contract = Ethereum::Contract.create file: "store.sol", client: CLIENT
address = contract.deploy_and_wait
puts "new contract: #{address}"

5.times do
  contract.transact.set "rand-#{rand 10}"
  value = contract.call.get
  puts "got value: #{value}"
end
```

### Step 2) Configure

serverless/docker-compose.yml
```
services:
  app:
    image: me/my-launchpad-function1
    environment:
      - RACK_ENV=production
      - PARITY_HOST=xxx
    depends_on:
      - parity
    # ports:
    # - 9292:9292
  parity:
    image: appliedblockchain/parity-solo
    environment:
      - NETWORK=mainnet
      #- NETWORK=kovan
```

### Step 3) Deploy

### Deploy via kubernetes

```
docker pull me/my-launchpad-function1
docker stack deploy -c docker-compose.yml my-launchpad-stack --orchestrator=kubernetes
```
