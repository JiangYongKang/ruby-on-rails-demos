require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RubyOnRailsSessionExample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # 在应用缓存中存储会话信息，这也是默认实现
    # Rails.application.config.session_store :cache_store

    # 在 cookie 中存储会话信息
    # Rails.application.config.session_store :cookie_store
    # 签署会话的时候，Rails 会用到会话的键 (cookie 的名称)，这个值也是可以配置的，还可以执行可以使用此 cookie 的域名
    # config.session_store :cookie_store, key: 'YOUR_APP_SESSION', domain: 'YOUR_APP_DOMAIN'

    # 在数据库中存储会话信息
    # Rails.application.config.session_store :active_record_store

    # 在 Memcached 中存储会话信息
    # Rails.application.config.session_store :mem_cache_store

    # 在 Redis 中存储会话信息
    config.session_store :redis_store
  end
end
