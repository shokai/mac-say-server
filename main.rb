#!/usr/bin/env ruby
# -*- coding: utf-8 -*-


before do
  @title = 'Mac Say Server'
end

get '/' do
  haml :index
end

post '/say' do
  m = params['message']
  m = m.gsub(/[`"'\r\n;]/, '').chomp.strip
  m = @@mecab.parse(m).map{|i|
    i.split(/\t/)[1]
  }.delete_if{|i|
    i.to_s.size < 1
  }.join('').chomp.strip
  if m.size > 0
    puts cmd = "#{@@conf['saykana']} '#{m}'"
    `#{cmd}`
  end
  redirect app_root+'/'
end

get '/say' do
  redirect app_root+'/'
end
