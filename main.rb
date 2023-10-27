require_relative 'app'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

class Main
  def initialize
    @app = App.new
  end

  def main
    loop do
      puts
      puts 'Welcome to Encarta School Library!'
      puts '=================================='
      puts 'Please select an option:'
      puts '1. List all books'
      puts '2. List all people'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. List rentals for a person'
      puts '7. Quit'
      puts '=================================='

      choice = gets.chomp.to_i

      case choice
      when 1
        @app.list_all_books
      when 2
        @app.list_all_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rentals_for_person
      when 7
        puts 'Thank you for using the School Management System. Goodbye!'
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end

  private

  def create_person
    puts 'What is the person type? student (1) teacher (2):'
    type = gets.chomp.to_i

    puts 'Enter the person\'s name:'
    name = gets.chomp

    puts 'Enter the person\'s age:'
    age = gets.chomp.to_i

    if type == 1
      puts 'Enter the person\'s classroom:'
      classroom_label = gets.chomp
      classroom = Classroom.new(classroom_label) # Create an instance of Classroom
      puts 'Has parent permission? [y/n]:'
      parent_permission_input = gets.chomp.downcase
      parent_permission = parent_permission_input == 'y'
      @app.create_person(age, name, type: 'student', classroom: classroom, parent_permission: parent_permission)
    elsif type == 2
      puts 'Enter the person\'s specialization:'
      specialization = gets.chomp
      @app.create_person(age, name, type: 'teacher', specialization: specialization)
    else
      puts 'Invalid person type. Please try again.'
    end
  end

  def create_book
    puts 'Enter the book\'s title:'
    title = gets.chomp

    puts 'Enter the book\'s author:'
    author = gets.chomp

    @app.create_book(title, author)
  end

  def create_rental
    puts 'Enter the person\'s ID:'
    person_id = gets.chomp.to_i

    puts 'Enter the book\'s title:'
    book_title = gets.chomp

    puts 'Enter the book\'s author:'
    book_author = gets.chomp

    puts 'Enter the rental date (YYYY-MM-DD):'
    date = gets.chomp

    @app.create_rental(person_id, book_title, book_author, date)
  end

  def list_rentals_for_person
    puts 'Enter the person\'s ID:'
    person_id = gets.chomp.to_i

    @app.list_rentals_for_person(person_id)
  end
end

Main.new.main
