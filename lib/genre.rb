class Genre
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_items(item)
    @items << item
    item.genre = self
  end
end
