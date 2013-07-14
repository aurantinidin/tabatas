require 'sinatra/activerecord/rake'
require './config/boot'

task :post_init_hooks do
  require './post_init_hooks/boot'
  PostInitHooks.run_all
end
