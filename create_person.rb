require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

def create_person(app)
  puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
  type = gets.chomp.to_i

  puts 'Enter the person\'s name:'
  name = gets.chomp

  puts 'Enter the person\'s age:'
  age = gets.chomp.to_i

  if type == 1
    create_student(app, age, name)
  elsif type == 2
    create_teacher(app, age, name)
  else
    puts 'Invalid person type. Please try again.'
  end
end

def create_student(app, age, name)
  puts 'Enter the person\'s classroom:'
  classroom_label = gets.chomp
  classroom = Classroom.new(classroom_label)
  create_person_with_details(app, age, name, 'student', classroom)
end

def create_teacher(app, age, name)
  puts 'Enter the person\'s specialization:'
  specialization = gets.chomp
  app.create_person(age, name, type: 'teacher', specialization: specialization)
end

def create_person_with_details(app, age, name, type, additional_info)
  puts 'Has parent permission? [y/n]:'
  parent_permission_input = gets.chomp.downcase
  parent_permission = parent_permission_input == 'y'
  app.create_person(age, name, type: type, classroom: additional_info, parent_permission: parent_permission)
end
