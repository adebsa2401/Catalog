require './book'
require 'json'

class App
  def initialize
    @books = []
    @labels = []
  end

  def list_books
    if @books.empty?
      puts "No books saved\n"
    else
      @books.each { |b| puts "Published: #{b.publish_date}, Publisher: #{b.publisher}, Cover state: #{b.cover_state}" }
    end
  end

  def list_labels
    if @labels.empty?
      puts "No labels saved\n"
    else
      @labels.each { |l| puts "Title: #{l.title}, Color: #{l.color}" }
    end
  end

  def add_book(publish_date, publisher, cover_state)
    book = Book.new(publish_date, publisher, cover_state)
    @books << book
    puts "Book added successfully\n"
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

  def save_data
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

  def read_data
    return unless File.exist?('database/books.json')

    content = JSON.parse(File.read('database/books.json'))
    content.each do |item|
      book = Book.new(item['publish_date'], item['publisher'], item['cover_state'])
      @books << book
    end
  end
end
