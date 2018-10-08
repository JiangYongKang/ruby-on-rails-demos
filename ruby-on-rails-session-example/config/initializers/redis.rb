redis_config = Rails.application.config_for(:redis).symbolize_keys!

redis_server = redis_config[:redis_server]
redis_port   = redis_config[:redis_port]
redis_db_num = redis_config[:redis_db_num]

$redis = Redis.new(host: redis_server, port: redis_port, db: redis_db_num)