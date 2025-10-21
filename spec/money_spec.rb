require 'rspec'

RSpec.describe Dollar do
  describe '#times' do
    it do
      five = Dollar.new(5)
      result = five.times(2)
      expect(result).to eq(10)
    end
  end
end
