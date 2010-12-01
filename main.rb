#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'yaml'

begin
  @@conf = YAML::load open(File.dirname(__FILE__)+'/config.yaml').read
  p @@conf
rescue => e
  STDERR.puts 'config.yaml load error!'
  STDERR.puts e
end


@@saykana = 

def app_root
  "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['SCRIPT_NAME']}"
end

get '/' do
<<EOS
<h1>say server</h1>
<form method="post" action="#{app_root}/say" id="say">
<input type="text" name="message" size="60"> <input type="submit" name="say" value="say">
</form>
<h2>API</h2>
HTTP-POST #{app_root}/say<br />
post parameter "message"
EOS
end

post '/say' do
  m = params['message']
  m = m.gsub(/[`"'\r\n;]/, '').chomp.strip
  puts m
  puts cmd = "#{@@conf['saykana']} '#{m}'"
  system cmd
  redirect '/'
end

get '/say' do
  redirect '/'
end
