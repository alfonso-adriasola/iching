# frozen_string_literal: true

require 'securerandom'
class SixteenMethodHexagramMaker
  MAP = { old_yin: 6, young_yang: 7, young_yin: 8, old_yang: 9 }.freeze

  def do
    Random.srand
    marbles = []
    marbles += [:old_yin]
    marbles += Array.new(5) { :young_yang }
    marbles += Array.new(7) { :young_yin }
    marbles += Array.new(3) { :old_yang }
    lines = []
    6.times do
      throw = marbles[SecureRandom.random_number(15)]
      lines << throw
    end
    Hexagram.new(lines.map { |e| MAP[e] })
  end
end
