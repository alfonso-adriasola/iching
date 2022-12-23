# frozen_string_literal: true

# pu.rb
require 'sinatra'
Encoding.default_external = "UTF-8"

configure do
  set :lock, true
end

get '/' do
  erb :index
end

get '/cast/' do
  load 'iching.rb'
  markdown(
    Iching.cast(renderer: HtmlHexagramRenderer),
    layout_engine: :erb
  )
end

get '/look/:hexagram' do |h|
  return 'no such thing' unless h.to_i > 0 && h.to_i < 65

  load 'iching.rb'
  markdown(
    HtmlHexagramRenderer.new.render_from_number(h.to_i),
    layout_engine: :erb
  )
end
