require_relative 'app'
require_relative 'create_person'
require_relative 'create_book'
require_relative 'create_rental'
require_relative 'list_rentals_for_person'

class Main
  def initialize
    @app = App.new
  end

  def main
    loop do
      display_menu
      choice = gets.chomp.to_i
      handle_choice(choice)
    end
  end

  private

  def display_menu
    puts ''
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
  end

  def handle_choice(choice)
    case choice
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      create_person(@app)
    when 4
      create_book(@app)
    when 5
      create_rental(@app)
    when 6
      list_rentals_for_person(@app)
    when 7
      puts 'Thank you for using the School Management System. Goodbye!'
      exit
    else
      puts 'Invalid choice. Please try again.'
    end
  end
end

Main.new.main
