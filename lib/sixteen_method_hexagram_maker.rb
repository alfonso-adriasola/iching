# frozen_string_literal: true

require 'securerandom'
class SixteenMethodHexagramMaker
  MAP = { old_yin: 6, young_yang: 7, young_yin: 8, old_yang: 9 }.freeze

  def do(seed: nil)
    seedme(seed)
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

  def seedme(seed)
    r = Random.new_seed
    h = seed.chars.map(&:bytes).flatten.sum if seed
    factor = r + (h || 0)
    Random.srand(factor)
  end
end
