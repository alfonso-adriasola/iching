class Hexagram
  attr_accessor :lines

  def initialize(lines = [])
    @lines = lines
  end

  def size
    @lines.size
  end
end
