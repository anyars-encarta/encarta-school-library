require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age, :rentals
  attr_reader :id

  def correct_name
    @name
  end

  private

  def of_age?
    true if @age >= 18
  end

  def can_use_services?
    true if of_age? || @parent_permission
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
