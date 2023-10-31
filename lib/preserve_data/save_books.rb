def save_books
  file_path = "#{DATA_PATH}/books.json"
  json_data = @books.map { |book| { 'title' => book.title, 'author' => book.author } }.to_json
  File.write(file_path, json_data)
end
