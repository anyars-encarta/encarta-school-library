require 'json'
require 'rspec'

require_relative '../lib/book' # Make sure to require your Book class

RSpec.describe Book do
  let(:book) { Book.new('Sample Book', 'John Doe') }

  describe '#add_rental' do
    it 'should create a new Rental object and add it to the rentals list' do
      person = 'Alice'
      date = '2023-11-01'
      rental = book.add_rental(person, date)
      expect(book.rentals).to include(rental)
      expect(rental.book).to eq(book)
    end
  end

  describe '#to_json' do
    it 'should return a JSON representation of the book' do
      expected_json = {
        title: 'Sample Book',
        author: 'John Doe',
        rentals: []
      }.to_json
      expect(book.to_json).to eq(expected_json)
    end
  end

  describe '.from_json' do
    it 'should create a Book object from a JSON string' do
      json_data = '{"title": "Sample Book", "author": "John Doe", "rentals": []}'
      book_from_json = Book.from_json(json_data)
      expect(book_from_json.title).to eq('Sample Book')
      expect(book_from_json.author).to eq('John Doe')
      expect(book_from_json.rentals).to be_empty
    end
  end
end
