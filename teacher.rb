require './person'

class Teacher < Person
  def initialize(specialization, name = 'unknown')
    super(name, 0)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
