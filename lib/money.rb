class Money
  def ==(object)
    return false unless object.is_a?(Money)

    amount == object.amount
  end

  protected

  attr_reader :amount
end
