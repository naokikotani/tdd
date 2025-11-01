require 'rspec'

RSpec.describe Money do
  describe '#times' do
    it do
      five = Money.dollar(5)

      expect(five.times(2)).to eq(Money.dollar(10))
      expect(five.times(3)).to eq(Money.dollar(15))
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

    it do
      five = Money.dollar(5)
      sum = five.plus(five)

      expect(sum.augend).to eq(five)
      expect(sum.addend).to eq(five)
    end
  end

  describe '#reduce' do
    it do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      bank = Bank.new
      result = bank.reduce(sum, "USD")

      expect(result).to eq(Money.dollar(7))
    end

    it do
      bank = Bank.new
      result = bank.reduce(Money.dollar(1), 'USD')

      expect(result).to eq(Money.dollar(1))
    end
  end

  describe 'reduceMoneyDifferentCurrency' do
    it do
      bank = Bank.new()
      bank.addRate("CHF", "USD", 2)
      result = bank.reduce(Money.franc(2), "USD")

      expect(result).to eq(Money.dollar(1))
    end
  end

  describe '#rate' do
    it do
      expect(Bank.new.rate('USD', 'USD')).to eq(1)
    end
  end

  describe '#mixedAddition' do
    it do
      fiveBucks = Money.dollar(5)
      tenFranks = Money.franc(10)
      bank = Bank.new
      bank.addRate('CHF', 'USD', 2)
      result = bank.reduce(fiveBucks.plus(tenFranks), 'USD')

      expect(result).to eq(Money.dollar(10))
    end
  end
end
