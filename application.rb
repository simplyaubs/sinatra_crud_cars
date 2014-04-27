require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index, locals: { list_of_cars: DB[:cars].to_a }
  end

  get '/cars/new' do
    erb :new
  end

  post '/cars' do
    DB[:cars].insert(make: params[:make], model: params[:model], color: params[:color])
    redirect '/'
  end
end