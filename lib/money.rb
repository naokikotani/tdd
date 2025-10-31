class Money
  include Expression

  attr_reader :amount

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def ==(object)
    return false unless object.is_a?(Money)

    amount == object.amount && currency == object.currency
  end

  def times(multiplier)
    Money.new(amount * multiplier, currency)
  end

  def currency
    @currency
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def reduce(to)
    self
  end

  class << self
    def dollar(amount)
      Money.new(amount, 'USD')
    end

    def franc(amount)
      Money.new(amount, 'CHF')
    end
  end
end
