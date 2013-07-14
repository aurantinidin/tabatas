require 'rack/test'
require './config/boot'

set :environment, :test

RSpec.configure do |conf|
    conf.include Rack::Test::Methods
end
