# frozen_string_literal: true

class HexagramRenderer
  MAP =
    {
      9 => '███ooo███',
      8 => '███   ███',
      7 => '█████████',
      6 => '███xxx███'
    }.freeze

  def do(hexagram: Hexagram.new, first: true)
    changing_art(hexagram) if first
    render_hexagram(hexagram)
  end

  FILEMAP = {
    9 => 1,
    8 => 0,
    7 => 1,
    6 => 0
  }.freeze

  def make_file_string(hexagram)
    hexagram.lines.map do |l|
      FILEMAP[l.to_i]
    end.reverse
  end

  def self.out(reading1, reading2) end
end
