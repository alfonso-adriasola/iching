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
    Iching.new.cast(renderer: HtmlHexagramRenderer),
    layout_engine: :erb
  )
end
