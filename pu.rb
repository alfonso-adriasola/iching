# frozen_string_literal: true

# pu.rb
require 'sinatra'

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
  load 'iching.rb'
  markdown(
    HtmlHexagramRenderer.new.render_from_number(h.to_i),
    layout_engine: :erb
  )
end