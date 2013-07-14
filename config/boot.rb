ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.setup
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require 'sinatra/base'
require 'sinatra/activerecord'

class Tabatas < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database, "sqlite3:///tabatas.sqlite3"
end

%w(models views routes post_init_hooks).each do |dir|
  Dir["./#{dir}/**/*.rb"].each { |file| require file } 
end
