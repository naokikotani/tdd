class Money
  def ==(object)
    return false unless object.is_a?(Money)

    amount == object.amount && self.class == object.class
  end

  def times(multiplier)
    raise NotImplementedError
  end

  class << self
    def dollar(amount)
      Dollar.new(amount)
    end

    def franc(amount)
      Franc.new(amount)
    end
  end

  protected

  attr_reader :amount
end
