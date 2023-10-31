require 'json'
require_relative '../nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = nil
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def assign_id(id)
    @id = id
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def to_json(*args)
    {
      id: @id,
      type: self.class.to_s.downcase,
      age: @age,
      name: @name,
      rentals: @rentals.map(&:to_json)
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    person = Person.new(data['age'], data['name'])
    person.assign_id(data['id']) # Assign the ID from the JSON data
    data['rentals'].each do |rental_data|
      rental = Rental.from_json(rental_data)
      rental.person = person
      person.rentals << rental
    end
    person
  end

  private

  def of_age?
    true if @age >= 18
  end

  def can_use_services?
    true if of_age? || @parent_permission
  end
end
