require_relative "./item"

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = false
  end

  def can_be_archived?
    if super && on_spotify
      return true
    else
      return false
    end
  end
end
