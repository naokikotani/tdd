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

  describe '#==' do
    it do
      five_a = Dollar.new(5)
      five_b = Dollar.new(5)
      six = Dollar.new(6)

      expect(five_a).to eq(five_b)
      expect(five_a).not_to eq(six)
    end
  end
end
