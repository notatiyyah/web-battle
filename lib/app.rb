require 'sinatra/base'
require_relative 'game.rb'

class BattleApp < Sinatra::Base
  enable :sessions
  set :session_secret, "secret"

  get "/test" do
    'Testing infrastructure working!'
  end

  get '/' do
    erb :index
  end

  post '/names' do
    session[:game] = Game.new(params["player_1"],params["player_2"])
    redirect "/play"
  end

  get '/play' do
    @game = session[:game]
    erb :play
  end

  post '/hit' do
    params["P1_Attack"].nil? ? session[:game].p1_take_damage : session[:game].p2_take_damage
    redirect "/play"
  end

  run! if app_file == $0
end
