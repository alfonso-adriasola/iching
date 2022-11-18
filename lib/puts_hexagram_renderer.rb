# frozen_string_literal: true

require_relative './hexagram_renderer'
class PutsHexagramRenderer < HexagramRenderer
  def self.out(reading1, reading2 = nil)
    reading1.flush
    reading2&.flush
  end

  def render_file(linkaddr)
    puts
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", 'r') do |f|
      f.each_line do |line|
        puts line
      end
    end
    puts
    $stdout.flush
  end
end
