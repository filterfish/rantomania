require 'rubygems'
require 'compass'
require 'sinatra'
require 'haml'
require 'pg'
require 'pp'

require 'activerecord'

dbconfig = YAML.load(File.read('config/database.yml'))
pp dbconfig['development']

class Rant < ActiveRecord::Base
end

ActiveRecord::Base.establish_connection(:adapter => 'postgresql', :database => "rantomania_development")

# at a  minimum, the  main  sass file  must reside  within the  ./views
# directory. here, we create a  ./views/stylesheets directory where all of
# the sass files can safely reside.
get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"stylesheets/#{params[:name]}", Compass.sass_engine_options
end

get '/' do
  @rants = Rant.find(:all)
  haml :index
end

post '/rant/' do
  pp params
  if params['rant']
    Rant.create(:rant => params['rant'])
  else
    puts "Where's your data mother fucker"
  end
end
  
not_found do
  content_type 'text/html'
  haml :index
end
