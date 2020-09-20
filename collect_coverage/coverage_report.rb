
require 'simplecov'
puts Dir["input/*.json"]
SimpleCov.collate Dir["input/*.json"]
