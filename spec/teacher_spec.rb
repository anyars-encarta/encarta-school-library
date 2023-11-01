require 'rspec'
require_relative '../lib/person/teacher' # Require the Teacher class

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(35, 'Mathematics', 'Mr. Smith', parent_permission: true) }

  describe '#initialize' do
    it 'sets the age, specialization and name attributes' do
      expect(teacher.age).to eq(35)
      expect(teacher.specialization).to eq('Mathematics')
      expect(teacher.name).to eq('Mr. Smith')
    end
  end

  describe '#can_use_services?' do
    it 'returns true, indicating that a teacher can use services' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
