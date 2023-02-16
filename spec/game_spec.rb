require 'game'

describe Game do
  before :each do
    @game = Game.new(2012, true, '2018-07-23')
  end

  describe '#new' do
    it 'creates a new instance of the game class' do
      expect(@game).to be_instance_of(Game)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true for a game last played 2 years ago' do
      expect(@game.can_be_archived?).to eql(true)
    end
  end
end
