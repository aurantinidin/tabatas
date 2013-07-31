require 'rubygems'
gem 'httparty', '~> 0.11.0'
require 'httparty'

USAGE_MESSAGE = "Usage: tabatas {list,do,add,mark,unmark,delete} <name>\nExamples: tabatas add jumping jacks; tabatas list; tabatas do"
BASE_URI = ENV['LOCAL'] ? 'localhost:9292' : 'ove-tabatas.herokuapp.com'
key_file = "#{File.dirname(__FILE__)}/" + (ENV['LOCAL'] ? 'local_key' : 'prod_key')
API_KEY = File.read(key_file).chomp

if ARGV.empty?
  puts USAGE_MESSAGE
  exit
end

class Api
  include HTTParty
  base_uri BASE_URI
  default_params :key => API_KEY
end

name = ARGV[1..-1].join(' ') if ARGV[1]

puts case ARGV[0]
when /^list$/i
  Api.get '/tabatas'
when /^add$/i
  Api.post '/tabatas/add', :body => { :name => name }
when /^do$/i
  mark = ''
  while mark !~ /^[y]/i
    puts (response = Api.post('/tabatas/do'))
    exit if response =~ /No tabatas!/
    print 'Yes? '
    mark = $stdin.gets
  end
  Api.post '/tabatas/mark', :body => { :name => response.sub(/.*do (.*)!/, '\1') }
when /^unmark$/i
  Api.post "/tabatas/unmark", :body => { :name => name }
when /^mark$/i
  Api.post "/tabatas/mark", :body => { :name => name }
when /^delete$/i
  Api.delete "/tabatas", :body => { :name => name }
else
  USAGE_MESSAGE
end
