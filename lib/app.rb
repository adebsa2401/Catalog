require './book'
require './game'
require 'json'
require './music'
require './genre'

class App
  def initialize
    @books = []
    @labels = []
    @authors = []
    @games = []
    @music_album = []
    @genre = []
  end

  def list_books
    if @books.empty?
      puts "No books saved\n"
    else
      @books.each { |b| puts "Published: #{b.publish_date}, Publisher: #{b.publisher}, Cover state: #{b.cover_state}" }
    end
  end

  def list_music_album
    if @music_album.empty?
      puts "No music saved\n"
    else
      @music_album.each do |m|
        puts "
Published: #{m.publish_date}, \
On spotify: #{m.on_spotify}, \
"
      end
    end
  end

  def list_genre
    if @genre.empty?
      puts "No genre found\n"
    else
      @genre.each do |g|
        puts "Name: #{g.name}"
      end
    end
  end

  def list_games
    if @games.empty?
      puts "No games saved\n"
    else
      @games.each do |g|
        puts "
Published: #{g.publish_date}, \
Last played: #{g.last_played_at}, \
Multiplayer: #{g.multiplayer ? 'Yes' : 'No'}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts "No labels saved\n"
    else
      @labels.each { |l| puts "Title: #{l.title}, Color: #{l.color}" }
    end
  end

  def list_authors
    if @authors.empty?
      puts "No authors saved\n"
    else
      @authors.each { |a| puts "First name: #{a.first_name}, Last name: #{a.last_name}" }
    end
  end

  def add_book(publish_date, publisher, cover_state)
    book = Book.new(publish_date, publisher, cover_state)
    @books << book
    puts "Book added successfully\n"
  end

  def add_music(publish_date, on_spotify)
    music = MusicAlbum.new(publish_date, on_spotify)
    @music_album << music
    puts "Music added successfully\n"
  end

  def add_game(publish_date, multiplayer, last_played_at)
    game = Game.new(publish_date, multiplayer, last_played_at)
    @games << game
    puts "Game added successfully\n"
  end

  def handle_add_book
    print 'What year was the book published:'
    publish_date = gets.chomp
    if publish_date.to_i.zero?
      puts "\nPlease enter a valid year E.G 2000"
      return
    end
    print 'Publisher:'
    publisher = gets.chomp
    print 'What state is the cover in. Good or Bad? [G/B]:'
    cover_state = gets.chomp.downcase
    case cover_state
    when 'g'
      add_book(publish_date, publisher, 'good')
    when 'n'
      add_book(publish_date, publisher, 'bad')
    else
      puts "Invalid input, please try again\n"
    end
  end

  def handle_add_music
    print 'What is the music album publish date:'
    publish_date = gets.chomp
    if publish_date.to_i.zero?
      puts "\nPlease enter a valid year E.G 2000"
      return
    end
    print 'On spotify [Y/N]:'
    on_spotify = gets.chomp
    add_music(publish_date, on_spotify)
  end

  def handle_add_game
    print 'What year was the game published:'
    publish_date = gets.chomp
    if publish_date.to_i.zero?
      puts "\nPlease enter a valid year E.G 2000"
      return
    end

    print 'Multiplayer [Y/N]:'
    multiplayer = gets.chomp.downcase

    print 'When is the game played the last time?:'
    last_played_at = gets.chomp

    case multiplayer
    when 'y'
      add_game(publish_date, true, last_played_at)
    when 'n'
      add_game(publish_date, false, last_played_at)
    else
      puts "Invalid input, please try again\n"
    end
  end

  def save_book_data
    arr = []
    @books.each do |book|
      arr << {
        publish_date: book.publish_date,
        publisher: book.publisher,
        cover_state: book.cover_state
      }
    end
    File.write('database/books.json', JSON.generate(arr))
  end

  def save_music_data
    arr = []
    @music_album.each do |music|
      arr << {
        publish_date: music.publish_date,
        on_spotify: music.on_spotify
      }
    end
    File.write('database/music_album.json', JSON.generate(arr))
  end

  def save_game_data
    arr = []
    @games.each do |game|
      arr << {
        publish_date: game.publish_date,
        last_played_at: game.last_played_at,
        multiplayer: game.multiplayer
      }
    end
    File.write('database/games.json', JSON.generate(arr))
  end

  def save_data
    save_book_data
    save_game_data
    save_music_data
  end

  def read_book_data
    return unless File.exist?('database/books.json')

    content = JSON.parse(File.read('database/books.json'))
    content.each do |item|
      book = Book.new(item['publish_date'], item['publisher'], item['cover_state'])
      @books << book
    end
  end

  def read_music_data
    return unless File.exist?('database/music_album.json')

    content = JSON.parse(File.read('database/music_album.json'))
    content.each do |item|
      music = MusicAlbum.new(item['publish_date'], item['on_spotify'])
      @music_album << music
    end
  end

  def read_genre_data
    return unless File.exist?('database/genre.json')

    content = JSON.parse(File.read('database/genre.json'))
    content.each do |item|
      genre = Genre.new(item['name'])
      @genre << genre
    end
  end

  def read_game_data
    return unless File.exist?('database/games.json')

    content = JSON.parse(File.read('database/games.json'))
    content.each do |item|
      game = Game.new(item['publish_date'], item['multiplayer'], item['last_played_at'])
      @games << game
    end
  end

  def read_data
    read_book_data
    read_game_data
    read_music_data
    read_genre_data
  end
end
