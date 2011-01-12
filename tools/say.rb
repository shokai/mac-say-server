#!/usr/bin/env ruby
require 'net/http'
require 'uri'

message = ARGV.join(' ')

uri = URI.parse('http://localhost:8100/say')
query = {:message => message}.map{|k,v|"#{k}=#{v}"}.join('&')
res = nil
Net::HTTP.start(uri.host, uri.port){|http|
  res = http.post(uri.path, query)
}
puts res.body
