#ruby=2.0.0
#ruby-gemset=tabatas

source 'https://rubygems.org'
ruby '2.0.0'

gem 'sinatra'
gem 'thin'
gem 'sinatra-activerecord'
gem 'activesupport'
gem 'rake'
gem 'json'

group :development do
  gem 'sqlite3'
  gem 'pry'
  gem 'shotgun'
end

group :test do
  gem 'rspec'
  gem 'rack-test', :require => "rack/test"
  gem 'httparty'
end

group :production do
  gem 'pg'
end
