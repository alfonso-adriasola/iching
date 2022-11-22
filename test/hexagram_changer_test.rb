# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/hexagram_changer'
describe HexagramChanger do
  it 'changes array of changing numbers to fixed ones' do
    hex = Hexagram.new [6, 6, 6, 6, 6, 6]
    hex2 = HexagramChanger.new(hex).do
    expect(hex2.lines).must_equal [7, 7, 7, 7, 7, 7]
  end

  it 'changes array of yang change numbers to fixed ones' do
    hex = Hexagram.new [6, 9, 6, 9, 9, 6]
    hex2 = HexagramChanger.new(hex).do
    expect(hex2.lines).must_equal [7, 8, 7, 8, 8, 7]
  end

  it 'produces immutatable hex' do
    hex = Hexagram.new [6, 9, 6, 9, 9, 6]
    hex2 = HexagramChanger.new(hex).do
    expect(HexagramChanger.new(hex2).do.lines).must_equal hex2.lines
  end
end
