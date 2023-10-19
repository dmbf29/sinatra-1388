require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

# "route"
get "/" do
  # "controller"
  "Hello 1388!"
end

# "route"
get "/hello" do
  "Hello from another page!"
end

get '/restaurants' do
  # get all the restaurants from the DB
  # to be able to user a variable in the view, you need to make it an INSTANCE variable
  @restaurants = Restaurant.all
  # give them to the view
  erb :index
end


get '/restaurants/:id' do
  # pull the restaurant from the DB
  @restaurant = Restaurant.find(params[:id])
  # display the view
  erb :show
end

post '/restaurants' do
  # create the instance here
  restaurant = Restaurant.new(name: params[:name], address: params[:address])
  restaurant.save
  redirect '/restaurants'
end
