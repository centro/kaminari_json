require 'rubygems'
require 'bundler/setup'

require 'kaminari_json'
require 'active_support/all'

Kaminari::Hooks.init

RSpec.configure do |config|
  config.mock_with :rspec
end
