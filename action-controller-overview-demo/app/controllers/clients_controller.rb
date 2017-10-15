# 控制器命名约定，最后一个单词采用复数形式，控制器必须继承自 ApplicationController
class ClientsController < ApplicationController

  # 访问 /clients.json 或者 /clients 会默认渲染 new.json.jbuilder 或者 new.html.erb
  # 可以在视图中使用 @client 实例变量
  def new
    @client = Client.new
  end
end
