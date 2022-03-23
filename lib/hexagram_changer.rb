class HexagramChanger
  MAP={
    9 => 8,
    8 => 8,
    7 => 7,
    6 => 7
  }
  def do(hexagram)
    hexagram.map do |l|
      MAP[l]
    end
  end
end
