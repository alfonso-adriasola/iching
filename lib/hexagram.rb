require_relative 'line'
class Hexagram
  attr_accessor :lines

  def initialize(lines = [])
    @lines = lines.map { |n| Line.new(n) }
  end

  def size
    @lines.size
  end
end
