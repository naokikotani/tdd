require 'rspec'

RSpec.describe Dollar do
  describe '#times' do
    it do
      five = Dollar.new(5)

      expect(five.times(2)).to eq(Dollar.new(10))
      expect(five.times(3)).to eq(Dollar.new(15))
    end
  end

  describe '#==' do
    it do
      five_a = Dollar.new(5)
      five_b = Dollar.new(5)
      six = Dollar.new(6)

      expect(Dollar.new(5)).to eq(Dollar.new(5))
      expect(Dollar.new(6)).to eq(Dollar.new(6))
      expect(Franc.new(5)).to eq(Franc.new(5))
      expect(Franc.new(6)).to eq(Franc.new(6))
      expect(Franc.new(5)).not_to eq(Dollar.new(5))
    end
  end

  describe '#Franctimes' do
    it do
      five = Franc.new(5)

      expect(five.times(2)).to eq(Franc.new(10))
      expect(five.times(3)).to eq(Franc.new(15))
    end
  end
end
