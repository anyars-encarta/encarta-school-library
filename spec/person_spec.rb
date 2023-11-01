require 'rspec'
require 'json'
require_relative '../lib/person/person' # Make sure to require your Person class
require_relative '../lib/rental' # Include the Rental class for testing
require_relative '../lib/book'

RSpec.describe Person do
  let(:person) { Person.new(25, 'Alice') }
  let(:book) { Book.new('Sample Book', 'John Doe') }
  let(:date) { '2023-11-01' }
  let(:rental) { Rental.new(date, book, person) }

  describe '#to_json' do
    it 'should return a JSON representation of the person' do
      person.rentals << rental
      expected_json = {
        id: nil,
        type: 'person',
        age: 25,
        name: 'Alice',
        rentals: [rental.to_json]
      }.to_json
      expect(person.to_json).to eq(expected_json)
    end
  end

  describe '.from_json' do
    it 'should create a Person object from a JSON string' do
      json_data = person.to_json
      person_from_json = Person.from_json(json_data)
      expect(person_from_json.age).to eq(25)
      expect(person_from_json.name).to eq('Alice')
      expect(person_from_json.rentals.first.book.title).to eq('Sample Book')
    end
  end
end
