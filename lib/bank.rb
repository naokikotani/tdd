class Bank
  attr_reader :rates

  def initialize
    @rates = {}
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def addRate(from, to, rate)
    rates[[from, to]] = rate
  end

  def rate(from, to)
    return 1 if from == to

    rates[[from, to]]
  end
end
