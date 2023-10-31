def save_rentals
  file_path = "#{DATA_PATH}/rentals.json"
  json_data = @rentals.map do |rental|
    {
      'date' => rental.date,
      'book_title' => rental.book.title,
      'person_id' => rental.person.id
    }
  end.to_json
  File.write(file_path, json_data)
end
