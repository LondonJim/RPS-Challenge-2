class Player

  attr_reader :move
  attr_accessor :name

  def initialize(name)
    @name = name
    @move = nil
  end

  def standard_game(player_move = "")
    @move = (player_move == "" ? standard_random : player_move)
  end

  def extended_game(player_move = "")
    @move = (player_move == "" ? extended_random : player_move)
  end

  private
  def standard_random
    ['ROCK', 'PAPER', 'SCISSORS'].sample
  end

  def extended_random
    ['ROCK', 'PAPER', 'SCISSORS', 'LIZARD', 'SPOCK'].sample
  end

end
