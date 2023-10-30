require_relative 'app'

class Main
  def initialize
    @app = App.new
    @choices = {
      1 => -> { @app.list_all_books },
      2 => -> { @app.list_all_people },
      3 => -> { @app.create_person },
      4 => -> { @app.create_book },
      5 => -> { @app.create_rental },
      6 => -> { @app.list_rentals_for_person },
      7 => -> { quit }
    }
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
    if @choices.key?(choice)
      @choices[choice].call
    else
      invalid_choice
    end
  end

  def quit
    puts 'Thank you for using Encarta School Library. Goodbye!'
    exit
  end

  def invalid_choice
    puts 'Invalid choice. Please try again.'
  end
end

Main.new.main
# After checking the main.rb file, it already follows the requirements for this milestone
