class Person
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_accessor :id, :name, :age

  private

  def of_age?
    true if @age >= 18
  end

  def can_use_services?
    true if of_age? || @parent_permission
  end
end
