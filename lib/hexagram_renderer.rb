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

  def self.out(reading1, reading2) end

  def changing_art(hexagram)
    art = hexagram.lines.reverse.map do |l|
      MAP[l.to_i]
    end
    art.each_with_index { |l, i| puts "#{6 - i} : #{l}" }
  end

  def render_hexagram(hexagram)
    linkaddr = make_binary_string(hexagram)
    file_lines(linkaddr)
  end

  def file_lines(linkaddr)
    puts
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", 'r') do |f|
      f.each_line do |line|
        puts line
      end
    end
    puts
  end

  CASTMAP = {
    9 => 1,
    8 => 0,
    7 => 1,
    6 => 0
  }.freeze

  def make_binary_string(hexagram)
    hexagram.lines.map do |l|
      CASTMAP[l.to_i]
    end.reverse
  end
end
