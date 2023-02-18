require './app'

def exit_option(app)
  puts "\nThank you for using this app!"
  app.save_data
  exit
end

def process_choice(choice, app)
  case choice
  when '1' then app.list_books
  when '2' then app.list_music_album
  when '3' then app.list_games
  when '4' then app.list_genre
  when '5' then app.list_labels
  when '6' then app.list_authors
  when '7' then app.handle_add_book
  when '8' then app.handle_add_music
  when '9' then app.handle_add_game
  else puts "Invalid input. Please try again\n"
  end
end

def main
  puts "Welcome to catalog app\n"
  app = App.new
  app.read_data
  choice = 0
  while choice != 10
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts "4 - List all genres (e.g 'Comedy', 'Thriller')"
    puts "5 - List all labels (e.g. 'Gift', 'New')"
    puts "6 - List all authors (e.g. 'Stephen King')"
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Exit'
    choice = gets.chomp
    exit_option(app) if choice == '10'
    process_choice(choice, app)
  end
end

main
