require_relative 'test_helper'
require_relative '../lib/html_hexagram_renderer'

describe HtmlHexagramRenderer do
  before do
    @renderer = HtmlHexagramRenderer.new
  end

  describe 'when asked to render' do
    it 'can given a good hex' do
      hexagram = [9, 9, 9, 9, 9, 9]
      expected = [
        '<pre>---ooo--- 6</pre>',
        '<pre>---ooo--- 5</pre>',
        '<pre>---ooo--- 4</pre>',
        '<pre>---ooo--- 3</pre>',
        '<pre>---ooo--- 2</pre>',
        '<pre>---ooo--- 1</pre>']
      expect(@renderer.make_line_art(hexagram)).must_equal expected
    end

    it 'can given a mixed hex' do
      hexagram = [7, 9, 7, 7, 7, 7]
      expected = [
        "<pre>--------- 6</pre>",
        "<pre>--------- 5</pre>",
        "<pre>--------- 4</pre>",
        "<pre>--------- 3</pre>",
        "<pre>---ooo--- 2</pre>",
        "<pre>--------- 1</pre>"]
      _(@renderer.make_line_art(hexagram)).must_equal expected
    end
  end
end
