# frozen_string_literal: true

class HexagramRenderer
  def do(hexagram: [], first: true)
    make_line_art(hexagram) if first
    render_hexagram(hexagram)
  end

  def self.out(reading1, reading2) end

  MAP =
    {
      9 => '---ooo---',
      8 => '---   ---',
      7 => '---------',
      6 => '---xxx---'
    }.freeze

  def make_line_art(hexagram)
    art = hexagram.reverse.map do |l|
      MAP[l.to_i]
    end
    art.each_with_index { |l, i| puts "#{6 - i} : #{l}" }
  end

  def render_hexagram(hexagram)
    linkaddr = make_binary_string(hexagram)
    render_file(linkaddr)
  end

  def render_file(linkaddr)
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
    hexagram.map do |l|
      CASTMAP[l.to_i]
    end.reverse
  end
end
