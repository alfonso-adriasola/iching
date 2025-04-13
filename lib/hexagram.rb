require_relative 'line'

class Hexagram
  attr_accessor :lines

  def initialize(lines = [])
    @lines = lines.map { |n| Line.new(n) }
  end

  def size
    @lines.size
  end

  def ==(other)
    other.lines.map(&:to_i) == lines.map(&:to_i)
  end

  def changes
    changes = []
    self.lines.reverse.each_with_index { |l, i|
      index = 6 - i
      changes << index if l.changing?
    }
    changes.join('.')
  end

  CASTMAP = {
    9 => 1,
    8 => 0,
    7 => 1,
    6 => 0
  }.freeze

  def lookup
    lines.map do |l|
      CASTMAP[l.to_i]
    end.reverse.join
  end

  def number
    main = HtmlHexagramRenderer::HEXLOOKUP.select { |e| e.match? /^#{lookup}/ }.pop.split('=>')[1].split('._')[0]
    return ([main] << changes).join(".") unless changes.empty?
    main
  end

end
