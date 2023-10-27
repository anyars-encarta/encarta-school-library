def create_rental(app)
  puts 'Enter the person\'s ID:'
  person_id = gets.chomp.to_i

  puts 'Enter the book\'s title:'
  book_title = gets.chomp

  puts 'Enter the book\'s author:'
  book_author = gets.chomp

  puts 'Enter the rental date (YYYY-MM-DD):'
  date = gets.chomp

  app.create_rental(person_id, book_title, book_author, date)
end
