require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/static_assets'
require 'sinatra/content_for'
require 'rack'
require File.dirname(__FILE__)+'/main'

set :environemt, :production

run Sinatra::Application
