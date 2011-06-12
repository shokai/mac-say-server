#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

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
  puts m = @@mecab.parse(m).map{|i|
    i.split(/\t/)[1]
  }.delete_if{|i|
    i.to_s.size < 1
  }.join('').chomp.strip
  if m.size > 0
    puts cmd = "#{@@conf['saykana']} '#{m}'"
    puts `#{cmd}`
  end
  redirect app_root+'/'
end

get '/say' do
  redirect app_root+'/'
end
