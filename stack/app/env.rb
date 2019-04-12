require 'bundler'
Bundler.require :default, :production

CLIENT = Ethereum::HttpClient.new 'http://localhost:8545'
