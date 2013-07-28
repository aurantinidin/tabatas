require 'sinatra/activerecord/rake'
require_relative 'config/boot'

task :api_key do
    ApiKey.new.save! if ApiKey.count == 0
    File.open("#{File.dirname(__FILE__)}/bin/local_key", 'w') {|f| f.write ApiKey.first.key } if ENV['LOCAL']
end

task :console do
  binding.pry(quiet: true)
end
task :c => :console
