require File.expand_path('../boot', __FILE__)

require 'rails/all'
require File.expand_path('../../lib/guestbook', __FILE__)

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Guestbook
  class Application < Rails::Application
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :github, ENV["GUESTBOOK_OAUTH_CLIENT_ID"], ENV["GUESTBOOK_OAUTH_SECRET"]
    end
  end
end
