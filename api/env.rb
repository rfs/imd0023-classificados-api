Bundler.require :default

db_config = YAML.load(ERB.new(File.read(File.join('config', 'database.yml'))).result)
ActiveRecord::Base.establish_connection db_config[ENV['RACK_ENV']]

Dir['api/models/*.rb'].each {|f| require f}
