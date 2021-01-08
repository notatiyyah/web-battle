require 'sinatra/base'

class BattleApp < Sinatra::Base
  enable :sessions

  get "/test" do
    'Testing infrastructure working!'
  end

  get '/' do
    erb :index
  end

  post '/names' do
    session['P1'] = params["player_1"]
    session['P2'] = params["player_2"]
    redirect "/play"
  end

  get '/play' do
    @P1 = session['P1']
    @P2 = session['P2']
    @hit_points_1 = 100
    @hit_points_2 = 100
    erb :play
  end

  run! if app_file == $0
end
