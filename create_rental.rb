def list_books_for_selection(books)
  puts 'Select a book from the following list by number:'
  books.each_with_index do |book, index|
    puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
  end
end

def list_people_for_selection(peoples)
  puts 'Select a person from the following list by number (not id):'
  peoples.each_with_index do |person, index|
    puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
  end
end
