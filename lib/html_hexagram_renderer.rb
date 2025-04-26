# frozen_string_literal: false

require_relative './hexagram_renderer'

class HtmlHexagramRenderer < HexagramRenderer
  def do(hexagram: Hexagram.new([]), first: true)
    out = ''
    out += "<h2>#{hexagram.number}</h2>" if first
    out += changing_art(hexagram).join('') << "\n" if first
    out += render_hexagram(hexagram)
    out
  end

  def render_hexagram(hexagram)
    linkaddr = make_file_string(hexagram)
    file_lines(linkaddr).join('') << "\n"
  end

  def changing_art(hexagram = Hexagram.new(Array.new(7, 7)))
    i = -1
    o = hexagram.lines.reverse.map do |l|
      line = ''
      line << MAP[l.to_i]
      i += 1
      line << " #{6 - i} \n"
    end
    ['<pre>'] + o + ['</pre>']
  end

  def self.out(reading1, reading2)
    "#{reading1} \n #{reading2}"
  end

  def file_lines(linkaddr)
    lines = []
    i = 0
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", 'r') do |f|
      f.each_line do |line|
        i += 1
        next if i == 1

        line[0] == '#' ? lines.push("\n") : nil
        line[1] == '>' ? lines.push("\n") : nil
        lines << line
      end
    end
    lines.push("\n")
  end

  def render_from_number(num)
    file_lines(linkaddress(num)).join('')
  end

  def linkaddress(num)
    Hexagram::HEXLOOKUP.select { |e| e.match?(/=>#{num}\./) }.first.split('.')[0].chars.map(&:to_i)
  end
end
