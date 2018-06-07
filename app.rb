require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  host:     'localhost',
  database: 'order_genius'
)

class Restaurant < ActiveRecord::Base
end

get '/' do
  erb :index, views: 'views/restaurants', locals: { restaurants: Restaurant.all }
end

get '/restaurants/:id' do
  restaurant = Restaurant.find(params['id'])
  erb :show, views: 'views/restaurants', locals: { restaurant: restaurant }
end
