require_relative '../lib/genre'

describe Genre do
  before :each do
    @genre = Genre.new('pop')
  end

  describe '#new' do
    it 'creates a new instance of the Genre class' do
      expect(@genre).to be_instance_of(Genre)
    end

    it 'has a name attribute' do
      expect(@genre.name).to eql('pop')
    end
  end
end
