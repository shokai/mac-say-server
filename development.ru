require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'rack'
require 'sinatra/static_assets'
require 'sinatra/content_for'
require 'sinatra/reloader'
require File.dirname(__FILE__)+'/main'

set :environment, :development

set :port, 8100
set :server, 'webrick'

Sinatra::Application.run
