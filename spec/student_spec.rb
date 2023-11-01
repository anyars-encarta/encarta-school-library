require 'rspec'
require_relative '../lib/person/student'

RSpec.describe Student do
  let(:classroom) { Classroom.new('Math 101') }
  let(:student) { Student.new(18, classroom, 'Alice', parent_permission: true) }

  describe '#initialize' do
    it 'adds the student to the classroom' do
      expect(classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'returns the shrug emoticon' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    it 'sets the classroom and adds the student to it' do
      new_classroom = Classroom.new('Science 202')
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end
  end
end
