class Genre
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_items(item, publish_date)
    item.genre = self
    item.publish_date = publish_date
    @items << item
  end

  def archive_items
    @items.each do |item|
      item.archive if item.can_be_archived?
    end
  end
end
