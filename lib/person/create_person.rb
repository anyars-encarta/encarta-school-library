require_relative 'student'
require_relative 'teacher'
require_relative '../classroom'

def create_student(name, age)
  puts 'Enter the person\'s classroom:'
  classroom_label = gets.chomp
  classroom = Classroom.new(classroom_label)
  puts 'Has parent permission? [y/n]:'
  parent_permission_input = gets.chomp.downcase
  parent_permission = parent_permission_input == 'y'

  # Load existing people from the JSON file
  existing_ids = @people.map(&:id)

  unique_id = generate_unique_id_for_new_person(existing_ids)

  student = Student.new(age, classroom, name, parent_permission: parent_permission)

  student.assign_id(unique_id)
  student
end

def create_teacher(name, age)
  puts 'Enter the person\'s specialization:'
  specialization = gets.chomp

  # Load existing people from the JSON file
  existing_ids = @people.map(&:id)

  unique_id = generate_unique_id_for_new_person(existing_ids)

  teacher = Teacher.new(age, specialization, name, parent_permission: true)

  teacher.assign_id(unique_id)
  teacher
end

def generate_unique_id_for_new_person(existing_ids)
  new_id = Random.rand(1..1000)

  new_id = Random.rand(1..1000) while existing_ids.include?(new_id)

  new_id
end
