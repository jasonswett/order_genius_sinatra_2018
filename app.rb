require 'sinatra'
require 'active_record'
require_relative 'config/database'
require_relative 'models/restaurant'

get '/' do
  erb :index, views: 'views/restaurants', locals: { restaurants: Restaurant.all }
end

get '/restaurants/:id' do
  restaurant = Restaurant.find(params['id'])
  erb :show, views: 'views/restaurants', locals: { restaurant: restaurant }
end
