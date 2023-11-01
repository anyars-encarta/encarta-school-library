require 'rspec'
require_relative '../lib/person/teacher' # Make sure to require your Teacher class

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(30, 'Mathematics', 'Mr. Smith') }

  describe '#initialize' do
    it 'should set the specialization and call the super constructor' do
      expect(teacher.age).to eq(30)
      expect(teacher.name).to eq('Mr. Smith')
      expect(teacher.specialization).to eq('Mathematics')
    end
  end

  describe '#can_use_services' do
    it 'should always return true for teachers' do
      expect(teacher.can_use_services?).to be(true)
    end
  end

  describe '#to_json' do
    it 'should return a JSON representation of the teacher' do
      expected_json = {
        id: nil,
        type: 'teacher',
        age: 30,
        name: 'Mr. Smith',
        rentals: [],
        specialization: 'Mathematics'
      }.to_json
      expect(teacher.to_json).to eq(expected_json)
    end
  end

  describe '.from_json' do
    it 'should create a Teacher object from a JSON string' do
      json_data = teacher.to_json
      teacher_from_json = Teacher.from_json(json_data)
      expect(teacher_from_json.age).to eq(30)
      expect(teacher_from_json.name).to eq('Mr. Smith')
      expect(teacher_from_json.specialization).to eq('Mathematics')
    end
  end
end
