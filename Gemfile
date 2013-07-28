#ruby=2.0.0
#ruby-gemset=tabatas

source 'https://rubygems.org'
ruby '2.0.0'

gem 'sinatra', '~> 1.4.3'
gem 'thin', '~> 1.5.1'
gem 'sinatra-activerecord', '~> 1.2.3'
gem 'activesupport', '~> 4.0.0'
gem 'rake'
gem 'json'

group :development do
  gem 'sqlite3'
  gem 'pry'
  gem 'shotgun'
end

group :test do
  gem 'rspec', '~> 2.12.0'
  gem 'rack-test', :require => "rack/test"
  gem 'httparty', '~> 0.11.0'
end

group :production do
  gem 'pg', '~> 0.14.1'
end
