def create_rental(app)
  list_people_for_selection

  person_choice = gets.chomp.to_i
  selected_person = @app.people[person_choice]

  if selected_person.nil?
    puts 'Invalid person selection.'
  else

    list_books_for_selection

    book_choice = gets.chomp.to_i
    selected_book = @app.books[book_choice]

    if selected_book.nil?
      puts 'Invalid book selection.'
    else
      puts 'Enter the rental date (YYYY-MM-DD):'
      date = gets.chomp
      @app.create_rental(selected_person.id, selected_book.title, selected_book.author, date)
    end
  end
end

def list_books_for_selection
  puts 'Select a book from the following list by number:'
  @app.books.each_with_index do |book, index|
    puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
  end
end

def list_people_for_selection
  puts 'Select a person from the following list by number (not id):'
  @app.people.each_with_index do |person, index|
    puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
  end
end
