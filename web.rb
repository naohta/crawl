#coding:utf-8
require 'sinatra'

get '/' do
  content_type:json
  "Hello, yay!"
end

get '/ret' do
  load './retrieve.rb'    
end
