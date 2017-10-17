# 控制器命名约定，最后一个单词采用复数形式，控制器必须继承自 ApplicationController
class ClientsController < ApplicationController

  # 访问 /clients/new.json 或者 /clients/new 会默认渲染 new.json.jbuilder 或者 new.html.erb
  # 可以在视图中使用 @client 实例变量
  def new
    @client = Client.new
  end

  # /clients?status=1
  # /clients?status=true
  # /clients?status=ok
  # /clients?status[]=open&status[]=close
  # 请求参数的类型不会自动转换，统一的被处理为字符串或数组
  def index
    logger.info "  [LOGGER INFO] params[:status].class = #{params[:status].class}"
    @parameters = params
  end
end
