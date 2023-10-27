require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

def create_student(name, age)
  puts 'Enter the person\'s classroom:'
  classroom_label = gets.chomp
  classroom = Classroom.new(classroom_label)
  puts 'Has parent permission? [y/n]:'
  parent_permission_input = gets.chomp.downcase
  parent_permission = parent_permission_input == 'y'
  Student.new(age, classroom, name, parent_permission: parent_permission)
end

def create_teacher(name, age)
  puts 'Enter the person\'s specialization:'
  specialization = gets.chomp
  Teacher.new(age, specialization, name, parent_permission: true)
end
