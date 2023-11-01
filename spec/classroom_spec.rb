require 'rspec'
require_relative '../lib/classroom' # Make sure to require your Classroom class

class Student
  attr_accessor :name, :classroom

  def initialize(name)
    @name = name
    @classroom = nil
  end
end

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('A101') }

  describe '#add_student' do
    it 'should add a student to the classroom' do
      student = Student.new('Alice')
      classroom.add_student(student)
      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end

    it 'should handle nil input gracefully' do
      classroom.add_student(nil)
      expect(classroom.students).to be_empty
    end
  end
end
