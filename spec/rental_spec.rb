require 'rspec'
require 'json'
require_relative '../lib/rental' # Make sure to require your Rental class
require_relative '../lib/book' # Include the Book and Person classes for testing
require_relative '../lib/person/person'

RSpec.describe Rental do
  let(:book) { Book.new('Sample Book', 'John Doe') }
  let(:person) { Person.new('Alice') }
  let(:date) { '2023-11-01' }
  let(:rental) { Rental.new(date, book, person) }

  describe '#to_json' do
    it 'should return a JSON representation of the rental' do
      expected_json = {
        date: '2023-11-01',
        book: book.to_json,
        person: person.to_json
      }.to_json
      expect(rental.to_json).to eq(expected_json)
    end
  end

  describe '.from_json' do
    it 'should create a Rental object from a JSON string' do
      json_data = rental.to_json
      rental_from_json = Rental.from_json(json_data)
      expect(rental_from_json.date).to eq('2023-11-01')
      expect(rental_from_json.book.title).to eq('Sample Book')
      expect(rental_from_json.person.name).to eq('Alice')
    end
  end
end
