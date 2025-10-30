require 'rspec'

RSpec.describe Money do
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
      expect(Money.franc(5)).not_to eq(Money.dollar(5))
    end
  end

  describe '#currency' do
    it do
      expect(Money.dollar(1).currency).to eq('USD')
      expect(Money.franc(1).currency).to eq('CHF')
    end
  end

  describe '#plus' do
    it do
      five = Money.dollar(5)
      sum = five.plus(five)
      bank = Bank.new
      reduce = bank.reduce(sum, 'USD')
      expect(reduce).to eq(Money.dollar(10))
    end
  end
end
