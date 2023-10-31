require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_json(*args)
    {
      title: @title,
      author: @author,
      rentals: @rentals.map(&:to_json)
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    book = Book.new(data['title'], data['author'])
    data['rentals'].each do |rental_data|
      rental = Rental.from_json(rental_data)
      rental.book = book
      book.rentals << rental
    end
    book
  end
end
