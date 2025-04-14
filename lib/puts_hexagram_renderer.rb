# frozen_string_literal: true

require_relative './hexagram_renderer'

class PutsHexagramRenderer < HexagramRenderer
  def self.out(_reading1, _reading2 = nil)
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

  def changing_art(hexagram)
    art = hexagram.lines.reverse.map do |l|
      MAP[l.to_i]
    end
    art.each_with_index { |l, i| puts "#{6 - i} : #{l}" }
    puts
    puts hexagram.number
    art
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

  def render_hexagram(hexagram)
    linkaddr = make_file_string(hexagram)
    file_lines(linkaddr)
  end
end
