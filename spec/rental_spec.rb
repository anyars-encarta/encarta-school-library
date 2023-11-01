require 'rspec'
require_relative '../lib/rental'

RSpec.describe Rental do
  let(:book) { Book.new('Book Title', 'Author Name') }
  let(:person) { Person.new(25, 'John Doe', parent_permission: true) }
  let(:rental) { Rental.new('2023-01-15', book, person) }

  describe '#initialize' do
    it 'sets the date, book, and person attributes' do
      expect(rental.date).to eq('2023-01-15')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book and person' do
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
