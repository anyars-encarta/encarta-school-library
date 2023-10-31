require 'json'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals << self
    return unless person

    person.rentals << self
  end

  def to_json(*args)
    {
      date: @date,
      book: @book.to_json,
      person: @person.to_json
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    book = Book.from_json(data['book'])
    person = Person.from_json(data['person'])
    Rental.new(data['date'], book, person)
  end
end
