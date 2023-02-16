require_relative 'item'
require 'date'

class Game < Item
  attr_reader :multiplayer, :last_played_at, :publish_date

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && (Date.today - @last_played_at) > 365 * 2
  end
end
