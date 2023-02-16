require 'author'

describe Author do
  before :each do
    @author = Author.new('John', 'Doe')
  end

  describe '#new' do
    it 'creates a new instance of the author class' do
      expect(@author).to be_instance_of(Author)
    end
  end

  describe '#add_item' do
    it 'exists' do
      expect(@author).to respond_to(:add_item)
    end
  end
end
