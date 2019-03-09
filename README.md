# new_launchpad

status: WIP

### https://github.com/makevoid/new_launchpad/blob/master/stack/serverless/eth-serverless-fn-rb/try-eth-rb.rb

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

add configuration (serverless.yml for lambda or kubeless)

```
serverless init
sls ...
```

serverless/docker-compose.yml
```
services:
  myfunction:
    image: me/my-launchpad-function1
    environment:
      - RACK_ENV=production
      - PARITY_HOST=xxx #TODO: I need to add an env var for parity - 
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

### Deploy via kubeless

TODO: add kubeless function definition

    kubeless function deploy hello --runtime ruby2.5 \
                                    --from-file my-launchpad-kubeless-fn.rb \
                                    --handler test.hello

### Deploy via serverless

```
# serverless.yml example 
sls deploy -f test.hello 
```


This is all in WIP - please check my other repos 


## http://makevoid.com
