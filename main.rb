#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

before do
  @title = 'Mac Say Server'
end

get '/' do
  haml :index
end

post '/say' do
  m = params['message'].gsub(/[`"'\r\n;]/, '').strip.to_kana
  if m.size > 0
    puts cmd = "#{@@conf['saykana']} '#{m}'"
    `#{cmd}`
  end
  redirect app_root+'/'
end
