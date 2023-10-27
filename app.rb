require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

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

  def create_person(age, name, options = {})
    parent_permission = options.fetch(:parent_permission, true)
    type = options.fetch(:type, 'student')
    classroom = options.fetch(:classroom, nil)
    specialization = options.fetch(:specialization, nil)

    if type == 'student'
      person = Student.new(age, classroom, name, parent_permission: parent_permission)
    elsif type == 'teacher'
      person = Teacher.new(age, specialization, name, parent_permission: parent_permission)
    else
      puts 'Invalid person type'
      return
    end

    @people << person
    puts "#{person.class} #{person.name} created with ID: #{person.id}"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "Book created with title: #{book.title}, author: #{book.author}"
  end

  def create_rental(person_id, book_title, book_author, date)
    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.title == book_title && b.author == book_author }

    if person.nil? || book.nil?
      puts 'Person or book not found'
      return
    end

    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental created for book: #{book.title}, person: #{person.name}, date: #{rental.date}"
  end

  def list_rentals_for_person(person_id)
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
