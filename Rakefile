$:.unshift File.expand_path '..', __FILE__

ENV['RACK_ENV'] ||= 'development'

require 'api/env'
require 'api/api'

Rake.load_rakefile 'lib/tasks/db.rake'
