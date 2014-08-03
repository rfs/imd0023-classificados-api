ENV['RACK_ENV'] ||= 'development'

require 'active_record'
require File.expand_path('../../rails.rb', __FILE__)

Rake.load_rakefile 'active_record/railties/databases.rake'

namespace :db do
  include ActiveRecord::Tasks
  DatabaseTasks.database_configuration = YAML.load(ERB.new(File.read(File.join('config', 'database.yml'))).result)
  DatabaseTasks.db_dir = 'db'
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection ActiveRecord::Base.configurations[ENV['RACK_ENV']]
end

task :environment do
end
