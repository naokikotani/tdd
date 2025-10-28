class Money
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def ==(object)
    return false unless object.is_a?(Money)

    amount == object.amount && self.class == object.class
  end

  def times(multiplier)
    raise NotImplementedError
  end

  def currency
    @currency
  end

  class << self
    def dollar(amount)
      Dollar.new(amount, 'USD')
    end

    def franc(amount)
      Franc.new(amount, 'CHF')
    end
  end

  protected

  attr_reader :amount
end
