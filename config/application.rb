require_relative 'boot'

require 'rails/all'

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_cable/engine"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MotoApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 6.0
    config.assets.initialize_on_precompile = false
    config.load_defaults 6.0 if Rails.version < "6.1" || Rails.env.development?


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
