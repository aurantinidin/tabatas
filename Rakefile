require 'sinatra/activerecord/rake'
require './config/boot'

task :api_key do
    ApiKey.new.save! if ApiKey.count == 0
end

task :console do
  binding.pry(quiet: true)
end
task :c => :console
