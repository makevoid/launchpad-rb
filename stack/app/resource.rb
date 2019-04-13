require_relative 'env'

contract = Ethereum::Contract.create file: "store.sol", client: CLIENT
address = contract.deploy_and_wait
puts "new contract: #{address}"

5.times do
  contract.transact.set "rand-#{rand 10}"
  value = contract.call.get
  puts "got value: #{value}"
end
