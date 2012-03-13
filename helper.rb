require 'bundler/setup'
require 'igo-ruby'
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
  @@igo = Igo::Tagger.new(File.dirname(__FILE__)+'/ipadic')
rescue => e
  STDERR.puts 'mecab error'
  STDERR.puts e
  exit 1
end

def app_root
  "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['SCRIPT_NAME']}"
end

class String
  def escape_cmd
    self.gsub(/[`"'\r\n;]/, '')
  end

  def to_kana
    begin
      return @@igo.parse(self.strip).map{|i|
        kana = i.feature.split(',')[-2].to_s
        kana = i.surface.to_s if kana == nil or kana == '*'
        kana
      }.join('').strip
    rescue => e
      STDERR.puts e
      return ''
    end
  end
end
