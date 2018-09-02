require 'sinatra/base'
require_relative './lib/game'
require_relative './lib/player'

class Rps < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/enter_name' do
    @game = Game.instance
    @game.player_1.name = params[:player_1_name]
    @game.player_2.name = params[:player_2_name]
    game_variable_set
    @current_player_name = @game.current_player.name
    erb :play
  end

  post '/play' do
    game_variable_set
    @game.player_move_game_type(params[:player_move])
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
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2, params[:game_type])
    @players = params[:player_num]
    erb :enter_name
  end

  get '/replay' do
    game_variable_set
    @current_player_name = @game.current_player.name
    erb :play
  end

  def game_variable_set
    @game = Game.instance
    @game_type = @game.game_type
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
  end

  run! if app_file == $0
end
