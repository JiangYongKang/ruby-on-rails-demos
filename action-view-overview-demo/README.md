### 使用脚手架生成器新建资源
```shell
$ rails generate scaffold article                                                                                       
Running via Spring preloader in process 34362
      invoke  active_record
      create    db/migrate/20170918073907_create_articles.rb
      create    app/models/article.rb
      invoke    test_unit
      create      test/models/article_test.rb
      create      test/fixtures/articles.yml
      invoke  resource_route
       route    resources :articles
      invoke  scaffold_controller
      create    app/controllers/articles_controller.rb
      invoke    erb
      create      app/views/articles
      create      app/views/articles/index.html.erb
      create      app/views/articles/edit.html.erb
      create      app/views/articles/show.html.erb
      create      app/views/articles/new.html.erb
      create      app/views/articles/_form.html.erb
      invoke    test_unit
      create      test/controllers/articles_controller_test.rb
      invoke    helper
      create      app/helpers/articles_helper.rb
      invoke      test_unit
      invoke    jbuilder
      create      app/views/articles/index.json.jbuilder
      create      app/views/articles/show.json.jbuilder
      create      app/views/articles/_article.json.jbuilder
      invoke  test_unit
      create    test/system/articles_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/articles.coffee
      invoke    scss
      create      app/assets/stylesheets/articles.scss
      invoke  scss
      create    app/assets/stylesheets/scaffolds.scss
```

### ERB 模板
* ERB 模板的扩展名是在 `.html` 扩展名的基础上扩展出 `.erb`，如 `index.html.erb`
* ERB 模板可以混合使用 `HTML` 元素和嵌入式 `Ruby` 编写
* 使用 `<% %>` 和 `<%= %>` 标签来包含 `Ruby` 代码
* `<% %>` 标签用于执行不返回任何内容的 `Ruby` 代码，例如条件、循环或块，而 `<%= %>` 标签用于输出 `Ruby` 代码的执行结果。
* 普通的输出方法，例如 `print` 和 `puts` 方法，在 `ERB` 模板中无法正常渲染。
* 删除前导和结尾空格，可以把 `<% %>` 标签替换为 `<%- -%>` 标签。

### Builder 模板
* 在扩展名为 `.builder` 的模板中，常用于生成 `XML` 内容。可以直接使用名为 `xml` 的 `XmlMarkup` 对象。
例如，通过如下的代码生成 `xml`
```ruby
xml.em("emphasized")
xml.em { xml.b("emph & bold") }
xml.a("A Link", "href" => "http://rubyonrails.org")
xml.target("name" => "compile", "option" => "fast")
```
```xml
<em>emphasized</em>
<em><b>emph &amp; bold</b></em>
<a href="http://rubyonrails.org">A link</a>
<target option="fast" name="compile" />
```

### JBuilder 模板
* `JBuilder` 是由 `Rails` 团队维护并默认包含在 `Rails Gemfile` 中的 `gem`。
* `JBuilder` 的扩展名是 `.jubilder`，如 `index.json.jbuilder`。
* 官方文档地址：[https://github.com/rails/jbuilder#jbuilder](https://github.com/rails/jbuilder#jbuilder)

### 视图
局部视图一般以下划线开头，引用局部视图使用 `render` 方法，例如：
```
# 渲染 app/views/_menu.html.erb
<%= render 'menu' %>

# 渲染 app/views/shared/_menu.html.erb
<%= render 'shared/menu' %>
```
局部视图可以简化视图，抽取公共部分代码
```
<%= render "shared/ad_banner" %>
<h1>Products</h1>
<p>Here are a few of our fine products:</p>
<% @products.each do |product| %>
  <%= render partial: "product", locals: { product: product } %>
<% end %>
<%= render "shared/footer" %>
```
渲染集合(两种方法是等同的)
```
<% @products.each do |product|%>
  <%= render partial: "product", locals: { product: product }%>
<% end %>
```
```
<%= render partial: "product", collection: @products %>
```
间隔模板
```
<%= render partial: @products, spacer_template: "product_ruler" %>
```
视图路径默认在 `app/views` 下查找，其他的查找方式如下：
```ruby
# 视图放在不同子域名的文件夹中
prepend_view_path "app/views/#{request.subdomain}"
```

### 辅助方法
链接专用的静态资源文件服务器
```ruby
config.action_controller.asset_host = "assets.example.com"
# <img src="http://assets.example.com/images/rails.png" alt="Rails" />
image_tag("rails.png")
```
获取 app/assets/images 文件夹中的资源路径
```ruby
# /assets/edit.png
image_path("edit.png")
```
为图像资源的文件名添加指纹
```ruby
config.assets.digest = true
# /assets/edit-2d1a2db63fc738690021fedb5a65b68e.png
image_path("edit.png")
```
JavaScript 标签
```ruby
# <script src="/assets/common.js"></script>
javascript_include_tag "common"
# 包含全部 JavaScript
javascript_include_tag :all
# 不使用 Assets Pipeline，包含 jQuery 文件
javascript_include_tag :defaults
```
计算 JavaScript 资源路径
```ruby
# http://www.example.com/assets/common.js
javascript_url "common"
```
