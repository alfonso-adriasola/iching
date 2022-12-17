# frozen_string_literal: true

require_relative './hexagram_renderer'
class PutsHexagramRenderer < HexagramRenderer
  def self.out(_reading1, _reading2 = nil); end

  def render_file(linkaddr)
    puts
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", 'r') do |f|
      f.each_line do |line|
        puts line
      end
    end
    puts
  end
end
