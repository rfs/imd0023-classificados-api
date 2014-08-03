module Rails
  def self.env
    ActiveSupport::StringInquirer.new(ENV['RACK_ENV'] || 'development')
  end

  def self.application
    Struct.new(:config, :paths) do
    end.new(config, paths)
  end

  def self.config
    db_config = YAML.load(ERB.new(File.read(File.join('config', 'database.yml'))).result)
    Struct.new(:database_configuration).new(db_config)
  end

  def self.paths
    { 'db/migrate' => ["#{root}/db/migrate"] }
  end

  def self.root
    '.'
  end
end
