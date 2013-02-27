require 'sinatra'
require_relative 'views/num_to_words'


get '/' do
  erb :show
end

get '/convert' do
  "<h1>#{params[:num]} in words:</h1>
     <h3>#{params[:num].to_i.in_words}</h3>"
end

