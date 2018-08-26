require 'sinatra/base'
require_relative './lib/game'
require_relative './lib/player'

class Rps < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/enter_name' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2, session[:game_type])
    @game_type = @game.game_type
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
    @current_player_name = @game.current_player.name
    erb :play
  end

  post '/play' do
    @game = Game.instance
    @game_type = @game.game_type
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name

    if @game.game_type == "STANDARD"
      @game.current_player.standard_game(params[:player_move])
    else
      @game.current_player.extended_game(params[:player_move])
    end

    if @game.current_player == @game.player_1
      @game.switch_player
      @current_player_name = @game.current_player.name
      erb :play
    else
      @result = @game.result([@game.player_1.move, @game.player_2.move])
      @player_1_move = @game.player_1.move
      @player_2_move = @game.player_2.move
      @game.switch_player
      erb :game_result
    end

  end

  post '/player_game_select' do
    session[:players] = params[:player_num]
    session[:game_type] = params[:game_type]
    @players = session[:players]
    erb :enter_name
  end

  get '/replay' do
    @game = Game.instance
    @game_type = @game.game_type
    @current_player_name = @game.current_player.name
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
    erb :play
  end

  run! if app_file == $0
end
