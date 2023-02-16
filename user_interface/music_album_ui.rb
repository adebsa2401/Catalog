require_relative '../modules/music_album'

class MusicAlbumUserInterface
  attr_reader :music_albums

  def initialize
    @music_albums = []
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts "No music albums available\n\n"
      return
    end

    @music_albums.each do |music_album|
      puts "On Spotify: #{music_album.on_spotify}\n"
    end
  end

  def add_a_music_album
    on_spotify = handle_on_spotify_input
    @music_albums << MusicAlbum.new(on_spotify)
  end

  def handle_on_spotify_input
    print 'Enter if the album is available on Spotify: '
    gets.chomp.capitalize
  end
end
