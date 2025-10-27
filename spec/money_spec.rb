require 'rspec'

RSpec.describe Dollar do
  describe '#times' do
    it do
      five = Money.dollar(5)

      expect(five.times(2)).to eq(Money.dollar(10))
      expect(five.times(3)).to eq(Money.dollar(15))

      five = Money.franc(5)
    end
  end

  describe '#==' do
    it do
      expect(Money.dollar(5)).to eq(Money.dollar(5))
      expect(Money.dollar(6)).to eq(Money.dollar(6))
      expect(Money.franc(5)).to eq(Money.franc(5))
      expect(Money.franc(6)).to eq(Money.franc(6))
      expect(Money.franc(5)).not_to eq(Money.dollar(5))
    end
  end

  describe '#Franctimes' do
    it do
      five = Money.franc(5)

      expect(five.times(2)).to eq(Money.franc(10))
      expect(five.times(3)).to eq(Money.franc(15))
    end
  end
end
