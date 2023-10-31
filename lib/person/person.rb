require 'json'
require_relative '../nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
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
      age: @age,
      name: @name,
      rentals: @rentals.map(&:to_json)
  }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    person = Person.new(data['age'], data['name'])
    person.instance_variable_set(:@id, data['id'])
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
