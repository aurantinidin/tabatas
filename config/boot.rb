ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.setup
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require 'sinatra/base'
require 'sinatra/activerecord'
require 'json'

class Tabatas < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database, "sqlite3:///tabatas.sqlite3" if ENV['RACK_ENV'] == 'development'
end

ActiveRecord::Base.establish_connection ENV['DATABASE_URL'] if ENV['RACK_ENV'] == 'production'

%w(models views routes).each do |dir|
  Dir["./#{dir}/**/*.rb"].each { |file| require file }
end
