require 'sinatra/base'
require 'game'

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
    session['P1'] = params["player_1"]
    session['P2'] = params["player_2"]
    redirect "/play"
  end

  get '/play' do
    session[:game] = Game.new if session[:game].nil?
    # ^ Setting up game
    # v Setting up variables for output
    @P1 = session['P1']
    @P2 = session['P2']
    @hit_points_1 = session[:game].p1_health
    @hit_points_2 = session[:game].p2_health
    erb :play
  end

  post '/hit' do
    params["P1_Attack"].nil? ? session[:game].p2_attack : session[:game].p1_attack
    redirect "/play"
  end

  run! if app_file == $0
end
