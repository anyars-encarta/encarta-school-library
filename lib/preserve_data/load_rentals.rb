def load_rentals
  file_path = "#{DATA_PATH}/rentals.json"

  File.write(file_path, '[]') unless File.exist?(file_path)

  json_data = File.read(file_path)
  return if json_data.empty?

  @rentals = JSON.parse(json_data).map do |data|
    book_title = data['book_title']
    person_id = data['person_id']

    book = @books.find { |b| b.title == book_title }
    person = @people.find { |p| p.id == person_id }

    Rental.new(data['date'], book, person)
  end
end
