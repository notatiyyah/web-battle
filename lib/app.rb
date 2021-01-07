require 'sinatra/base'

class BattleApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names' do
    @P1 = params["player_1"]
    @P2 = params["player_2"]
    erb :play
  end

  run! if app_file == $0
end
