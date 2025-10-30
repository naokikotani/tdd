class Money
  include Expression

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
    Money.new(amount + addend.amount, currency)
  end

  class << self
    def dollar(amount)
      Money.new(amount, 'USD')
    end

    def franc(amount)
      Money.new(amount, 'CHF')
    end
  end

  protected

  attr_reader :amount
end
