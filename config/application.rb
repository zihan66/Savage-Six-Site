require_relative 'boot'

require 'rails/all'
require File.expand_path('../boot', __FILE__)
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module SavageSixSite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    # from stack overflow for heroku push error:
    # https://stackoverflow.com/questions/19650621/heroku-upload-precompiling-assets-failed
    config.assets.initialize_on_precompile = false

  end
end
