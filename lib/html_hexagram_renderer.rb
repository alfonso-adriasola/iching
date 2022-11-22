# frozen_string_literal: false

require_relative './hexagram_renderer'

class HtmlHexagramRenderer < HexagramRenderer
  def do(hexagram: [], first: true)
    out = []
    out += changing_art(hexagram) if first
    out += render_hexagram(hexagram)
    out.join("\n")
  end

  def changing_art(hexagram = Hexagram.new(Array.new(7, 7)))
    i = -1
    hexagram.lines.reverse.map do |l|
      line = '<pre>'
      line << MAP[l]
      i += 1
      line << " #{6 - i}</pre>"
    end
  end

  def self.out(reading1, reading2)
    "#{reading1} \n #{reading2}"
  end

  def render_file(linkaddr)
    lines = []
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", 'r') do |f|
      f.each_line do |line|
        lines << line
      end
    end
    lines
  end
end
