# frozen_string_literal: true

Dir.glob("#{__dir__}/lib/*", &method(:require))

class Iching
  def cast(
    maker: SixteenMethodHexagramMaker,
    changer: HexagramChanger,
    renderer: PutsHexagramRenderer,
    seed: 0.39185
  )
    hexagram = maker.new.do(seed: seed)
    hexagram2 = changer.new.do hexagram

    reading1 = renderer.new.do hexagram: hexagram
    reading2 = renderer.new.do hexagram: hexagram2, first: false if hexagram2 != hexagram

    renderer.out(reading1, reading2)
  end
end

Iching.new.cast if caller.empty?
