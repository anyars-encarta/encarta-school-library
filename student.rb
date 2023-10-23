require './person'

class Student < Person
  def initialize(classroom, name = 'unknown', parent_permission: true)
    super(name, 0, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
