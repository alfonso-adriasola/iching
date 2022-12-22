require_relative 'test_helper'
require_relative '../lib/hexagram'
class HexagramTest < Minitest::Test
  def test_hexagram_eq
    h1 = Hexagram.new([6, 6, 6, 6, 6, 6])
    h2 = h1.dup
    assert_equal h2, h1
  end

  def test_hexagram_not_equal
    h1 = Hexagram.new([6, 6, 6, 6, 6, 6])
    h2 = Hexagram.new([8, 6, 6, 6, 6, 6])
    refute_equal h2, h1
  end
end
