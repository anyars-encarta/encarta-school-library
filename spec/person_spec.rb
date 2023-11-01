require 'rspec'
require_relative '../lib/person/person'

RSpec.describe Person do
  let(:person) { Person.new(25, 'John Doe', parent_permission: true) }

  describe '#initialize' do
    it 'sets the age, name, and rentals attributes.' do
      expect(person.age).to eq(25)
      expect(person.name).to eq('John Doe')
      expect(person.rentals).to eq([])
    end
  end

  describe '#assign_id' do
    it 'assigns the ID to the person' do
      person.assign_id(123)
      expect(person.id).to eq(123)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the person' do
      person.assign_id(123)
      json = person.to_json
      expect(json).to eq('{"id":123,"type":"person","age":25,"name":"John Doe","rentals":[]}')
    end
  end

  describe '.from_json' do
    it 'returns a Person object from a JSON string' do
      json = '{"id":123,"type":"person","age":25,"name":"John Doe","rentals":[]}'
      person = Person.from_json(json)
      expect(person).to be_an_instance_of(Person)
      expect(person.id).to eq(123)
      expect(person.age).to eq(25)
      expect(person.name).to eq('John Doe')
      expect(person.rentals).to eq([])
    end
  end
end
