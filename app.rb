require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'create_person'
require_relative 'create_rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts 'List of all books:'
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'List of all people:'
    @people.each do |person|
      puts "[#{person.class}]: Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def create_person()
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    type = gets.chomp.to_i

    puts 'Enter the person\'s name:'
    name = gets.chomp

    puts 'Enter the person\'s age:'
    age = gets.chomp.to_i

    if type == 1
      person = create_student(name, age)
    elsif type == 2
      person = create_teacher(name, age)
    else
      puts 'Invalid person type. Please try again.'
    end

    @people << person
    puts "#{person.class} #{person.name} created with ID: #{person.id}"
  end

  def create_book
    puts 'Enter the book\'s title:'
    title = gets.chomp

    puts 'Enter the book\'s author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book created with title: #{book.title}, author: #{book.author}"
  end

  def create_rental
    list_people_for_selection(@people)
    person_choice = gets.chomp.to_i
    selected_person = @people[person_choice]

    if selected_person.nil?
      puts 'Invalid person selection.'
    else
      list_books_for_selection(@books)
      book_choice = gets.chomp.to_i
      selected_book = @books[book_choice]
    end
    if selected_book.nil?
      puts 'Invalid book selection.'
    else
      puts 'Enter the rental date (YYYY-MM-DD):'
      date = gets.chomp
      rental = Rental.new(date, selected_book, selected_person)
    end
    @rentals << rental
    puts "Rental created for book: #{selected_book.title}, person: #{selected_person.name}, date: #{rental.date}"
  end

  def list_rentals_for_person()
    puts 'Enter the person\'s ID:'
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts 'Person not found'
      return
    end

    puts "Rentals for person #{person.name}:"
    rentals = @rentals.select { |r| r.person == person }
    rentals.each do |rental|
      puts "Book: #{rental.book.title}, Date: #{rental.date}"
    end
  end
end
