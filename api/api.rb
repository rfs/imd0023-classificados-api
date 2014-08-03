module Pheromone
  class API < Grape::API
    format :json
    require_relative 'routes/items'
    require_relative 'routes/users'
  end
end
