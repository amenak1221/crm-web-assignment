require 'sinatra'
require 'movie'

get '/' do

  'Hello world!'

end

get '/goodbye' do
  'Goodbye Dave.'
end

# get '/movies/lotr'do
#   'lord of the rings'
# end
#
# get 'movies/hp1' do
#   "Happy Potter and the Sorcerer's Stone"
# end

get '/movies/:title' do # ':title' is called a parameter similar to inputting a wildcard. the ':' is the method of whatever I want to input for it to return

  puts params
  s = "<html>" +

  params[:title].upcase + ' , ' + params[:actor]

  "</html"

  @title = params [:title]
  @actor = params [:actor]

  erb(:movie)

end




# get = request and '/' is the homepage
