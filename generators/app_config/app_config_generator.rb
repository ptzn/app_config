class AppConfigGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.template 'config.yml',
        File.join('config', 'config.yml')
    end
  end
end
