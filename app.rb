require './person'
require './book'
require './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts 'List of all books:'
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_all_people
    puts 'List of all people:'
    @people.each do |person|
      puts "#{person.name} (#{person.class})"
    end
  end

  def create_person(name, age, role, classroom = nil)
    if role == 'teacher'
      person = Teacher.new(age, name)
    elsif role == 'student'
      person = Student.new(age, classroom, name)
    else
      puts "Invalid role. Please choose 'teacher' or 'student'."
      return
    end

    @people << person
    puts "Created #{person.class}: #{person.name} successfully!"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "Created book: #{book.title} by #{book.author} successfully!"
  end

  def create_rental(person_id, book_id, date)
    person = find_person_by_id(person_id)
    book = find_book_by_id(book_id)

    if person && book
      rental = Rental.new(date, book, person)
      @rentals << rental
      puts "Created rental for #{person.name}: #{book.title} (#{date}) successfully!"
    else
      puts 'Person ID or Book ID not found.'
    end
  end

  def list_rentals_for_person(person_id)
    person = find_person_by_id(person_id)

    if person
      puts "Rentals for #{person.name}:"
      rentals = @rentals.select { |rental| rental.person == person }
      rentals.each do |rental|
        puts "#{rental.book.title} (#{rental.date})"
      end
    else
      puts 'Person ID not found.'
    end
  end

  private

  def find_person_by_id(person_id)
    @people.find { |person| person.id == person_id }
  end

  def find_book_by_id(book_id)
    @books.find { |book| book.id == book_id }
  end
end
