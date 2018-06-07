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
  restaurants = Restaurant.all

  restaurant_names = restaurants.map do |restaurant|
    %(
      <li>
        <a href="/restaurants/#{restaurant.id}">#{restaurant.name}</a>
      </li>
    )
  end

  %(
    <h1>Restaurants</h1>
    <ul>#{restaurant_names.join}</ul>
  )
end

get '/restaurants/:id' do
  restaurant = Restaurant.find(params['id'])

  %(
    <h1>#{restaurant.name}</h1>
    #{restaurant.phone}
  )
end
