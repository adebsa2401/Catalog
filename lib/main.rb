def exit_option
  puts "\nThank you for using this app!"
  exit
end

def main
  puts "Welcome to catalog app\n"
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
    exit_option if choice == '10'
  end
end

main
