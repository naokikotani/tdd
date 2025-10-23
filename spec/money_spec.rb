require 'rspec'
require_relative '../lib/dollar'

RSpec.describe Dollar do
  describe '#times' do
    it do
      five = Dollar.new(5)
      result = five.times(2)
      expect(result.amount).to eq(10)

      result = five.times(3);
      expect(result.amount).to eq(15)
    end
  end
end
