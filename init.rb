require 'ostruct'
require 'yaml'

if File.exist?("#{RAILS_ROOT}/config/config.yml")
  config = YAML.load_file("#{RAILS_ROOT}/config/config.yml")
  env_config = config[RAILS_ENV]
  common = config['common'] || {}
  common.update(env_config) unless env_config.nil?
  ::AppConfig = OpenStruct.new(common)
else
  puts <<MSG
Application config file is missing.
You can create it using ./script/generate app_config 
or create config.yml file by hand, see #{File.join(File.dirname(__FILE__), 'README')}
MSG
end
