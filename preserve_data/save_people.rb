def save_people
  file_path = "#{DATA_PATH}/people.json"
  json_data = @people.map do |person|
    {
      'type' => person.instance_of?(Student) ? 'student' : 'teacher',
      'name' => person.name,
      'age' => person.age,
      'id' => person.id
    }
  end.to_json
  File.write(file_path, json_data)
end
