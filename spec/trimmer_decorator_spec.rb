require_relative '../lib/decorator/decorator'
require_relative '../lib/decorator/trimmer_decorator'

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    it 'trims the name to 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('John Doe is a great person')
      expect(decorator.correct_name).to eq('John Doe i')
    end
  end
end
