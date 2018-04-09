require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MonoCabinetNew
  class Application < Rails::Application
    config.load_defaults 5.1
    config.autoload_paths += Dir["#{config.root}/app/services", "#{config.root}/app/validators", "#{config.root}/lib"]
    config.i18n.default_locale = :ja
    config.time_zone = 'Asia/Tokyo'
    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework :rspec
    end
  end
end
