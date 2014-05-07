require 'sinatra'
require ::File.expand_path('../app.rb',  __FILE__)

set :app_file, __FILE__

run Sinatra::Application