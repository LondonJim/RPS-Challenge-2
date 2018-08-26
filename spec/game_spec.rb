require 'game'

describe Game do

  subject(:game) { Game.new('Player', 'COMPUTER', 'STANDARD') }

  describe '#player_1' do
    it 'retrieves player' do
      expect(game.player_1).to eq 'Player'
    end
  end

  describe '#player_2' do
    it 'retrieves player' do
      expect(game.player_2).to eq 'COMPUTER'
    end
  end

  describe '#result' do

    player_1_win_game = ['ROCK', 'SCISSORS']
    player_2_win_game = ['PAPER', 'SCISSORS']
    tie = ['ROCK', 'ROCK']

    before do
      allow(subject).to receive(:player_1_name).and_return('Player 1')
      allow(subject).to receive(:player_2_name).and_return('Player 2')
    end

    describe 'returns a result' do

      it "'ROCK' & 'SCISSORS'" do
        expect(game.result(player_1_win_game)).to eq 'ROCK crushes SCISSORS</br>Player 1 wins!'
      end

      it "'PAPER' & 'SCISSORS'" do
        expect(game.result(player_2_win_game)).to eq 'SCISSORS cuts PAPER</br>Player 2 wins!'
      end

      it "'ROCK' & 'ROCK'" do
        expect(game.result(tie)).to eq "ROCK and ROCK</br>It's a tie!"
      end

    end
  end
end
