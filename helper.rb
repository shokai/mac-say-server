require 'bundler/setup'
require 'MeCab'
require 'yaml'
require 'haml'

begin
  @@conf = YAML::load open(File.dirname(__FILE__)+'/config.yaml').read
  p @@conf
rescue => e
  STDERR.puts 'config.yaml load error!'
  STDERR.puts e
  exit 1
end

begin
  @@mecab = MeCab::Tagger.new('-Ochasen')
rescue => e
  STDERR.puts 'mecab error'
  STDERR.puts e
  exit 1
end

def app_root
  "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['SCRIPT_NAME']}"
end
