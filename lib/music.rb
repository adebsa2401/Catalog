require_relative './item'

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify

  def initialize(publish_date, _on_spotify)
    super(publish_date)
    @on_spotify = false
  end

  def can_be_archived?
    return true if super && on_spotify

    false
  end
end
