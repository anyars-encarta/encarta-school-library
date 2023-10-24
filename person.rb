require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
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
end
