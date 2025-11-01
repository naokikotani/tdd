class Pair
  def initialize(from, to)
    @from = from
    @to = to
  end

  def equals(pair)
    from == pair.from && to == pair.to
  end

  def hash_code
    0
  end
end
