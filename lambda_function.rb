# frozen_string_literal: true

require 'json'
require_relative './iching'

def lambda_handler(*)
  response = Iching.new.cast(renderer: JsonHexagramRenderer)
  { statusCode: 200 }.merge response
end
