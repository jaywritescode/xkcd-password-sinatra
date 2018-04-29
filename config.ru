require 'rubygems'
require 'bundler/setup'

require 'dotenv/load'

require './app'

run Sinatra::Application
