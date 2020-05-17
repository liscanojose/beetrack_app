# config/initializers/sidekiq.rb

Sidekiq::Extensions.enable_delay!

Sidekiq.configure_server do |config|
  #config.redis = { url: ENV['REDIS_SERVER_URL'] }
  config.redis = { db: 1 }
end

Sidekiq.configure_client do |config|
  #config.redis = { url: ENV['REDIS_CLIENT_URL'] }
  config.redis = { db: 1 }
end
