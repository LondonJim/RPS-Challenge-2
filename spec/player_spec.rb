require 'player'

describe Player do

  subject(:player_1) { Player.new('Jimmy') }
  subject(:player_2) { Player.new('Kathryn') }

  describe '#name' do

    it 'set player name' do
      expect(player_1.name).to eq 'Jimmy'
    end
  end

  describe '#standard_game' do

    before do
      allow(player_2).to receive(:standard_random).and_return('ROCK')
    end

    it 'records move if player set' do
      expect(player_1.standard_game('ROCK')).to eq 'ROCK'
    end

    it 'records random move if no argument' do
      expect(player_2.standard_game).to eq 'ROCK'
    end
  end

  describe '#extended_game' do

    before do
      allow(player_2).to receive(:extended_random).and_return('ROCK')
    end

    it 'records move if player set' do
      expect(player_1.extended_game('ROCK')).to eq 'ROCK'
    end

    it 'records random move if no argument' do
      expect(player_2.extended_game).to eq 'ROCK'
    end
  end
end
