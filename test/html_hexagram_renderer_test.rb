# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/html_hexagram_renderer'

describe 'lookup link' do
  before do
    @renderer = HtmlHexagramRenderer.new
  end
  it 'finds a link addr for a numer' do
    _(@renderer.linkaddress(2)).must_equal [0, 0, 0, 0, 0, 0]
    _(@renderer.linkaddress(21)).must_equal [1, 0, 1, 0, 0, 1]
    _(@renderer.linkaddress(44)).must_equal [1, 1, 1, 1, 1, 0]
    _(@renderer.linkaddress(3)).must_equal [0, 1, 0, 0, 0, 1]
    _(@renderer.linkaddress(1)).must_equal [1, 1, 1, 1, 1, 1]
    _(@renderer.linkaddress(47)).must_equal [0, 1, 1, 0, 1, 0]
  end
end

describe 'when asked to render' do
  before do
    @renderer = HtmlHexagramRenderer.new
  end
  it 'can given a good hex' do
    hexagram = Hexagram.new [9, 9, 9, 9, 9, 9]
    expected = [
      '<pre>',
      "███ooo███ 6 \n",
      "███ooo███ 5 \n",
      "███ooo███ 4 \n",
      "███ooo███ 3 \n",
      "███ooo███ 2 \n",
      "███ooo███ 1 \n",
      '</pre>'
    ]
    expect(@renderer.changing_art(hexagram)).must_equal expected
  end

  it 'can given a mixed hex' do
    hexagram = Hexagram.new [7, 9, 7, 7, 7, 7]
    expected = [
      '<pre>',
      "█████████ 6 \n",
      "█████████ 5 \n",
      "█████████ 4 \n",
      "█████████ 3 \n",
      "███ooo███ 2 \n",
      "█████████ 1 \n",
      '</pre>'
    ]
    _(@renderer.changing_art(hexagram)).must_equal expected
  end
end
