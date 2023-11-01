require_relative '../lib/decorator/decorator'
require_relative '../lib/decorator/capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the name' do
      allow(nameable).to receive(:name).and_return('john doe')
      allow(nameable).to receive(:correct_name).and_return('John doe')
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
