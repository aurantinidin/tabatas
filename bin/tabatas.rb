require 'rubygems'
require 'httparty'

USAGE_MESSAGE = "Usage: tabatas {list,do,add,mark,unmark,delete} <name>"
BASE_URI = ENV['LOCAL'] ? 'localhost:9292' : 'ove-tabatas.herokuapp.com'
key_file = "#{File.dirname(__FILE__)}/" + (ENV['LOCAL'] ? 'local_key' : 'prod_key')
API_KEY = File.read(key_file).chomp

if ARGV.size == 0
  puts USAGE_MESSAGE
  exit
end

class Api
  include HTTParty
  base_uri BASE_URI
  default_params :key => API_KEY
end

name = ARGV[1..-1].join(' ') if ARGV[1]

case ARGV[0]
when /^list/i
  puts Api.get '/tabatas'
when /^add/i
  puts Api.post '/tabatas/add', :body => { :name => name }
when /^do/i
  puts Api.post '/tabatas/do'
when /^unmark/i
  puts Api.post "/tabatas/unmark", :body => { :name => name }
when /^mark/i
  puts Api.post "/tabatas/mark", :body => { :name => name }
when /^delete/i
  puts Api.delete "/tabatas", :body => { :name => name }
else
  puts USAGE_MESSAGE
end
