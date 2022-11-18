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
    @hexagram.map do |l|
      MAP[l]
    end
  end
end
