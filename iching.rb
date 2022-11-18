# frozen_string_literal: true

Dir.glob("#{__dir__}/lib/*", &method(:require))

class Iching
  def self.cast(maker: SixteenMethodHexagramMaker, renderer: PutsHexagramRenderer)
    hexagram = maker.new.do
    hexagram2 = HexagramChanger.new(hexagram).do
    reading1 = renderer.new.do hexagram: hexagram
    reading2 = renderer.new.do hexagram: hexagram2, first: false if hexagram2 != hexagram
    renderer.out(reading1, reading2)
  end
end

Iching.cast if caller.empty?
