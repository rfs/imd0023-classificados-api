$:.unshift File.expand_path '..', __FILE__

ENV['RACK_ENV'] ||= 'development'

require 'api/env'
require 'api/api'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete]
  end
end

run Pheromone::API
