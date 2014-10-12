require 'sinatra'
require 'sinatra/json'
require 'shotgun'

get '/' do
  'Welcome to Wordinator <br>
  Please type "/input_words" into browser after "localhost:9393", <br>
  and hit return'
end

get '/input_words' do
  erb :input_words
end


def one_length
    (params[:wordone]).length
end

def one_sort
    (params[:wordone]).chars.sort { |a, b| a.casecmp(b) } .join
end

def two_length
     (params[:wordtwo]).length
end

def two_sort
    (params[:wordtwo]).chars.sort { |a, b| a.casecmp(b) } .join
end

post '/input_words' do
    if one_length != two_length
    json "#{params[:wordone]} and #{params[:wordtwo]} are NOT anagrams"
  elsif one_length == two_length && one_sort == two_sort
    json "#{params[:wordone]} and #{params[:wordtwo]} ARE anagrams!!!"
  end
end
