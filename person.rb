class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Randaom.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  private

  def of_age?
    true if @age >= 18
  end

  def can_use_services?
    true if of_age? || @parent_permission
  end
end
