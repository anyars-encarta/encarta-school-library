require_relative '../lib/person/student'
require_relative '../lib/person/teacher'

def load_poeple
  file_path = "#{DATA_PATH}/people.json"
  return unless File.exist?(file_path)

  json_data = File.read(file_path)
  return if json_data.empty?

  @people = JSON.parse(json_data).map do |data|
    case data['type']
    when 'student'
      create_student(data['name'], data['age'])
    when 'teacher'
      create_teacher(data['name'], data['age'])
    end
  end
end
