# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/line'
describe Line do
  it 'knows what is changing' do
    _(Line.new(6).changing?).must_equal true
    _(Line.new(7).changing?).must_equal false
  end
end
