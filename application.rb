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

  get '/cars/:id' do
    car_id = params[:id]
    erb :show, locals: { single_car: DB[:cars][id: car_id] }
  end

  put '/cars/:id' do
    car_id = params[:id]
    DB[:cars].where(id: car_id).update(make: params[:make], model: params[:model], color: params[:color])
    redirect "/cars/#{car_id}"
  end
end