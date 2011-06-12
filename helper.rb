require 'bundler/setup'
require 'MeCab'
require 'yaml'

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

