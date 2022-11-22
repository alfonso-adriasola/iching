# frozen_string_literal: true

class CoinMethodHexagramMaker
  def do(seed: 0)
    hexagram = Hexagram.new
    6.times do
      sleep(0.1 / seed)
      throw = Array.new(3) { SecureRandom.random_number(2); sleep(0.2) }
      hexagram.lines << throw.map { |c| c == 1 ? 3 : 2 }.inject(0, :+)
    end
    hexagram
  end
end
