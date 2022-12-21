# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/html_hexagram_renderer'

describe HtmlHexagramRenderer do
  before do
    @renderer = HtmlHexagramRenderer.new
  end

  describe "lookup link"  do
    it "finds a link addr for a numer" do
      _(@renderer.linkaddress(2)).must_equal [0,0,0,0,0,0]
      _(@renderer.linkaddress(21)).must_equal [1,0,1,0,0,1]
      _(@renderer.linkaddress(44)).must_equal [1,1,1,1,1,0]
    end
  end

  describe 'when asked to render' do
    it 'can given a good hex' do
      hexagram = Hexagram.new [9, 9, 9, 9, 9, 9]
      expected = [
        '<pre>---ooo--- 6</pre>',
        '<pre>---ooo--- 5</pre>',
        '<pre>---ooo--- 4</pre>',
        '<pre>---ooo--- 3</pre>',
        '<pre>---ooo--- 2</pre>',
        '<pre>---ooo--- 1</pre>'
      ]
      expect(@renderer.changing_art(hexagram)).must_equal expected
    end

    it 'can given a mixed hex' do
      hexagram = Hexagram.new [7, 9, 7, 7, 7, 7]
      expected = [
        '<pre>--------- 6</pre>',
        '<pre>--------- 5</pre>',
        '<pre>--------- 4</pre>',
        '<pre>--------- 3</pre>',
        '<pre>---ooo--- 2</pre>',
        '<pre>--------- 1</pre>'
      ]
      _(@renderer.changing_art(hexagram)).must_equal expected
    end
  end
end
