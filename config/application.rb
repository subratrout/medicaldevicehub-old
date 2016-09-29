require File.expand_path('../boot', __FILE__)

require 'rails/all'

ActiveRecord::Base.raise_in_transactional_callbacks = true

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Medicaldevicehub
  class Application < Rails::Application

    # To avail logger output in the console and Heroku
    config.middleware.use Rails::Rack::LogTailer
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    I18n.config.enforce_available_locales = true

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.active_record.schema_format = :sql

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.initialize_on_precompile = false
    config.assets.precompile+=%w(*.png *.jpg *.jpeg *.gif)

    # For font awesome
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    # To generate full controller command
    config.app_generators.scaffold_controller = :scaffold_controller
  end
end
