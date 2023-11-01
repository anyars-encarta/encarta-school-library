require 'rspec'
require_relative '../lib/classroom'
require_relative '../lib/person/person'


RSpec.describe Classroom do
  let(:classroom) { Classroom.new('Math') }
  let(:student1) { Person.new(16, 'John Doe', parent_permission: true) }
  let(:student2) { Person.new(17, 'Jane Smith', parent_permission: true) }

  describe '#initialize' do
    it 'sets the label and students attributes' do
      expect(classroom.label).to eq('Math')
      expect(classroom.students).to eq([])
    end
  end
end
