class CoinMethodHexagramMaker
  def do
    hexagram = []
    6.times do
      sleep(0.2)
      throw = Array.new(3) { Random.new.rand(2); sleep(0.2) }
      hexagram << throw.map { |c| c == 1 ? 3 : 2 }.inject(0, :+)
    end
    hexagram
  end
end
