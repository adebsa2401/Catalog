require_relative '../lib/book'

describe Book do
  before :each do
    @book = Book.new(2000, 'Microverse', 'good')
  end

  describe '#new' do
    it 'creates a new instance of the book class' do
      expect(@book).to be_instance_of(Book)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true for a book published in the year 2000' do
      expect(@book.can_be_archived?).to eql(true)
    end
  end
end
