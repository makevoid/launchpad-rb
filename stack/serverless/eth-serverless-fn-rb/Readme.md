# ruby-eth-rb example


### install deps

    bundle


### run parity

    docker run -p 8545:8545 appliedblockchain/parity-solo-instant


### run the example

    ruby try-eth-rb.rb


### or

    rake


---

### Notes

This is the output you should get:

```
$ time rake
```

```
/usr/local/bin/ruby try-eth-rb.rb
new contract: 0xdfe3a564bf18f34e2056407d0076f8bc1e20759a
got value: rand-6
got value: rand-3
got value: rand-8
got value: rand-3
got value: rand-4

real	0m0.395s
user	0m0.267s
sys	0m0.044s
```
