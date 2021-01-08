require 'sinatra/base'
require_relative 'game.rb'
require_relative 'player.rb'

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
    p1 = Player.new(params["player_1"])
    p2 = Player.new(params["player_2"])
    # Create player objects
    session[:game] = Game.new(p1,p2)
    # Create game and store in session
    redirect "/play"
  end

  get '/play' do
    @game = session[:game]
    # Extract player data
    erb :play
  end

  post '/hit' do
    session[:game].launch_attack(params.keys[0])
    # Get param for which button was pressed & launch attack
    redirect "/play"
  end

  run! if app_file == $0
end
