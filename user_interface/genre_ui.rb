require_relative '../modules/genre'

class GenreUserInterface
  attr_reader :genres

  def initialize
    @genres = []
  end

  def list_all_genres
    if @genres.empty?
      puts "No genres found\n\n"
      return
    end

    @genres.each do |genre|
      puts "Name: #{genre.name}\n"
    end
  end
end
