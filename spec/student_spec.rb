require 'rspec'
require_relative '../lib/person/student' # Make sure to require your Student class
require_relative '../lib/classroom' # Include the Classroom class for testing

RSpec.describe Student do
  let(:classroom) { Classroom.new('A101') }
  let(:student) { Student.new(16, classroom, 'Alice') }

  describe '#initialize' do
    it 'should set the classroom and call the super constructor' do
      expect(student.age).to eq(16)
      expect(student.name).to eq('Alice')
      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'should return a string representing playing hooky' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    it 'should update the classroom and add the student to the new classroom' do
      new_classroom = Classroom.new('B202')
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end
  end

  describe '#to_json' do
    it 'should return a JSON representation of the student' do
      expected_json = {
        id: nil,
        type: 'student',
        age: 16,
        name: 'Alice',
        rentals: [],
        classroom: classroom.to_json
      }.to_json
      expect(student.to_json).to eq(expected_json)
    end
  end

  describe '.from_json' do
    it 'should create a Student object from a JSON string' do
      json_data = student.to_json
      student_from_json = Student.from_json(json_data)
      expect(student_from_json.age).to eq(16)
      expect(student_from_json.name).to eq('Alice')
      expect(student_from_json.classroom.label).to eq('A101')
    end
  end
end
