def create_book(app)
  puts 'Enter the book\'s title:'
  title = gets.chomp

  puts 'Enter the book\'s author:'
  author = gets.chomp

  app.create_book(title, author)
end
