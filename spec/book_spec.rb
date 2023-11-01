require 'rspec'
require_relative '../lib/book'
require_relative '../lib/person/person'

RSpec.describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person1) { Person.new(25, 'John Doe', parent_permission: true) }
  let(:person2) { Person.new(30, 'Jane Smith', parent_permission: true) }

  describe '#initialize' do
    it 'sets the title, author, and rentals attributes' do
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
      expect(book.rentals).to eq([])
    end
  end
end
