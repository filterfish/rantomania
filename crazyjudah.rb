require 'rubygems'
require 'compass'
require 'sinatra'
require 'haml'

# at a  minimum, the  main  sass file  must reside  within the  ./views
# directory. here, we create a  ./views/stylesheets directory where all of
# the sass files can safely reside.
get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"stylesheets/#{params[:name]}", Compass.sass_engine_options
end

get '/' do
  haml :index
end

not_found do
  content_type 'text/html'
  haml :index
end
