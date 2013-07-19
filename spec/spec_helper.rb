require 'rack/test'
require './config/boot'
require 'httparty'

set :environment, :test

RSpec.configure do |conf|
    conf.include Rack::Test::Methods
end

class App
  include HTTParty
  base_uri 'localhost:9292'
  default_params :key => ApiKey.first.key
end
