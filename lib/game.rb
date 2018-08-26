class Game

  attr_reader :player_1, :player_2, :current_player, :game_type

  def initialize(player_1, player_2, game_type)
    @player_1 = player_1
    @player_2 = player_2
    @game_type = game_type
    @current_player = player_1
  end

  def switch_player
    @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
  end

  def result(moves)
    return "#{moves[0]} and #{moves[1]}</br>It's a tie!" if moves[0] == moves[1]
    game_outcomes.each do |key, value|
      if moves == key
        return "#{moves[0]} #{value} #{moves[1]}</br>#{player_1_name} wins!"
      elsif moves == key.reverse
        return "#{moves[1]} #{value} #{moves[0]}</br>#{player_2_name} wins!"
      end
    end
  end

  def self.create(player_1, player_2, game_type)
    @game = Game.new(player_1, player_2, game_type)
  end

  def self.instance
    @game
  end

  private
  def player_1_name
    @player_1.name
  end

  def player_2_name
    @player_2.name
  end

  def game_outcomes
    { ['ROCK', 'SCISSORS'] => 'crushes',
      ['SCISSORS', 'PAPER'] => 'cuts',
      ['PAPER', 'ROCK'] => 'covers',
      ['LIZARD', 'SPOCK'] => 'poisons',
      ['ROCK', 'LIZARD'] => 'crushes',
      ['SPOCK', 'SCISSORS'] => 'smashes',
      ['SCISSORS', 'LIZARD'] => 'decapitates',
      ['LIZARD', 'PAPER'] => 'eats',
      ['PAPER', 'SPOCK'] => 'disproves',
      ['SPOCK', 'ROCK'] => 'vaporizes' }
  end

end
