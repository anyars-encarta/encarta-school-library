DATA_PATH = './data'.freeze

def load_books
  file_path = "#{DATA_PATH}/books.json"
  nil unless File.exist?(file_path)

  json_data = File.read(file_path)
  return if json_data.empty?

  @books = JSON.parse(json_data).map { |data| Book.new(data['title'], data['author']) }
end