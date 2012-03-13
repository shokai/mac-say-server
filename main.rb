before do
  @title = 'Mac Say Server'
end

get '/' do
  haml :index
end

post '/say' do
  begin
    m = params['message'].strip.escape_cmd
    if m.size > 0
      puts cmd = "say '#{m}'"
      system cmd
    end
    redirect app_root
  rescue
    status 400
    @mes = 'post parameter "message" is missing'
  end
end

post '/saykana' do
  begin
    m = params['message'].strip.escape_cmd.to_kana
    if m.size > 0
      puts cmd = "#{@@conf['saykana']} '#{m}'"
      system cmd
    end
    redirect app_root
  rescue
    status 400
    @mes = 'post parameter "message" is missing'
  end
end
