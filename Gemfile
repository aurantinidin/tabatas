source 'https://rubygems.org'
ruby '1.9.3'

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
