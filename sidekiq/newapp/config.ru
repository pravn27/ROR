# This file is used by Rack-based servers to start the application.

#require ::File.expand_path('../config/environment', __FILE__)
#run Rails.application

require 'sidekiq' 

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

require 'sidekiq/web'
run Sidekiq::Web