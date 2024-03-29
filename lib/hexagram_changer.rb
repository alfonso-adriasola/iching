# frozen_string_literal: true

class HexagramChanger
  MAP = {
    9 => 8,
    8 => 8,
    7 => 7,
    6 => 7
  }.freeze

  def initialize(hexagram)
    @hexagram = hexagram
  end

  def do
    newlines = @hexagram.lines.map do |l|
      MAP[l.to_i]
    end
    Hexagram.new(newlines)
  end
end
