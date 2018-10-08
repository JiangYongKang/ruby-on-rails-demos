# 由于 Rails 并没有提供将会话信息缓存到 Redis 中的实现，如果想将 session 缓存在 Redis 中，需要自己单独实现
# 1. 首先必须在 ActionDispatch::Session 这个 module 中创建一个类，类名任意，但是必须属于 ActionDispatch::Session，
# 因为当我们通过 Rails.application.config.session_store 去配置 store 类时，Rails 会在 ActionDispatch::Session 下面去查找与此对应的类
# 比如当我们指定 store 类为 example_store 时，Rails 会查找 ActionDispatch::Session::ExampleStore 是否存在
# 2. 必须继承自 ActionDispatch::Session::AbstractStore
# 3. 必须实现 find_session、write_session、delete_session 方法，创建构造方法，并且调用父类的构造方法。
class ActionDispatch::Session::RedisStore < ActionDispatch::Session::AbstractStore

  # 必须调用父类的构造方法
  def initialize(app, options = {})
    @options = options
    super
  end

  # 按 sid 查找 session
  def find_session(env, sid)
    unless sid && $redis.exists(sid) && (session = JSON.parse($redis.get(sid)))
      sid, session = generate_sid, {}
    end
    [sid, session]
  end

  # 缓存 session 到 redis 中并设置超时，sid 作为 key
  def write_session(env, sid, session, options)
    if session
      $redis.set(sid, session.to_json)
      $redis.expire(sid, expire_time)
    else
      $redis.del(sid)
    end
    sid
  end

  # 从缓存中移除 session
  def delete_session(env, sid, options)
    $redis.del(sid)
    generate_sid
  end

  private

  def expire_time
    @options[:expire_time] || 24 * 60 * 60
  end

end
