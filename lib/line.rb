class Line
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def to_i
    value.to_i
  end

  def changing?
    value == 6 or value == 9
  end
end
