Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #    Prefix Verb   URI Pattern               Controller#Action
  #     users GET    /users(.:format)          users#index
  #           POST   /users(.:format)          users#create
  #  new_user GET    /users/new(.:format)      users#new
  # edit_user GET    /users/:id/edit(.:format) users#edit
  #      user GET    /users/:id(.:format)      users#show
  #           PATCH  /users/:id(.:format)      users#update
  #           PUT    /users/:id(.:format)      users#update
  #           DELETE /users/:id(.:format)      users#destroy
  #
  # 路由按照声明顺序进行匹配
  # 生成路由的同时也会生成辅助方法，辅助方法属于 `app` 对象，在 rails c 中可以查看
  # 例如：app.users_path app.new_user_path app.edit_user_path(1)
  #      app.users_url app.new_user_url app.edit_user_url(1)
  # resources :users

  #     Prefix Verb   URI Pattern                Controller#Action
  #     books  GET    /books(.:format)           books#index
  #            POST   /books(.:format)           books#create
  #  new_book  GET    /books/new(.:format)       books#new
  #  edit_book GET    /books/:id/edit(.:format)  books#edit
  #      book  GET    /books/:id(.:format)       books#show
  #            PATCH  /books/:id(.:format)       books#update
  #            PUT    /books/:id(.:format)       books#update
  #            DELETE /books/:id(.:format)       books#destroy
  #    videos  GET    /videos(.:format)          videos#index
  #            POST   /videos(.:format)          videos#create
  #  new_video GET    /videos/new(.:format)      videos#new
  # edit_video GET    /videos/:id/edit(.:format) videos#edit
  #     video  GET    /videos/:id(.:format)      videos#show
  #            PATCH  /videos/:id(.:format)      videos#update
  #            PUT    /videos/:id(.:format)      videos#update
  #            DELETE /videos/:id(.:format)      videos#destroy
  #
  # 同时定义多个资源
  # resources :books, :videos

  #  Prefix Verb   URI Pattern                Controller#Action
  # profile GET    /profile(.:format)         users#show
  #
  # 单独定义资源
  # get 'profile', to: 'users#show'

  # Prefix Verb   URI Pattern                Controller#Action
  #  index GET    /index(.:format)           groups#index
  # create GET    /create(.:format)          groups#create
  #    new GET    /new(.:format)             groups#new
  #
  # 为某个 Action 定义路径
  # `to` 后面的符号指的是 Action 动作，如：edit、update、show
  # `controller` 后面指定哪个控制器接收处理
  # `get` 后面跟的就是具体的路径
  # 也会生成对应的辅助方法
  # get 'index', to: :index, controller: 'groups'
  # get 'create', to: :create, controller: 'groups'
  # get 'new', to: :new, controller: 'groups'

  #             Prefix Verb   URI Pattern                        Controller#Action
  #     admin_articles GET    /admin/articles(.:format)          admin/articles#index
  #                    POST   /admin/articles(.:format)          admin/articles#create
  #  new_admin_article GET    /admin/articles/new(.:format)      admin/articles#new
  # edit_admin_article GET    /admin/articles/:id/edit(.:format) admin/articles#edit
  #      admin_article GET    /admin/articles/:id(.:format)      admin/articles#show
  #                    PATCH  /admin/articles/:id(.:format)      admin/articles#update
  #                    PUT    /admin/articles/:id(.:format)      admin/articles#update
  #                    DELETE /admin/articles/:id(.:format)      admin/articles#destroy
  #     admin_comments GET    /admin/comments(.:format)          admin/comments#index
  #                    POST   /admin/comments(.:format)          admin/comments#create
  #  new_admin_comment GET    /admin/comments/new(.:format)      admin/comments#new
  # edit_admin_comment GET    /admin/comments/:id/edit(.:format) admin/comments#edit
  #      admin_comment GET    /admin/comments/:id(.:format)      admin/comments#show
  #                    PATCH  /admin/comments/:id(.:format)      admin/comments#update
  #                    PUT    /admin/comments/:id(.:format)      admin/comments#update
  #                    DELETE /admin/comments/:id(.:format)      admin/comments#destroy
  #
  # 如果想去掉 "url" 中的 "/admin" 前缀，可以使用：
  # scope module: 'admin' do
  #   resources :articles, :comments
  # end
  #
  # 单个资源可以这样使用：
  # resources :articles, module: 'admin'
  #
  # 如果想去掉控制器中的 "admin/" 前缀，即去掉 "Admin::"，可以使用：
  # scope '/admin' do
  #   resources :articles, :comments
  # end
  #
  # 单个资源可以这样使用：
  # resources :articles, path: '/admin/articles'
  # namespace :admin do
  #   resources :articles, :comments
  # end

  #            Prefix Verb   URI Pattern                                    Controller#Action
  #     account_roles GET    /accounts/:account_id/roles(.:format)          roles#index
  #                   POST   /accounts/:account_id/roles(.:format)          roles#create
  #  new_account_role GET    /accounts/:account_id/roles/new(.:format)      roles#new
  # edit_account_role GET    /accounts/:account_id/roles/:id/edit(.:format) roles#edit
  #      account_role GET    /accounts/:account_id/roles/:id(.:format)      roles#show
  #                   PATCH  /accounts/:account_id/roles/:id(.:format)      roles#update
  #                   PUT    /accounts/:account_id/roles/:id(.:format)      roles#update
  #                   DELETE /accounts/:account_id/roles/:id(.:format)      roles#destroy
  #          accounts GET    /accounts(.:format)                            accounts#index
  #                   POST   /accounts(.:format)                            accounts#create
  #       new_account GET    /accounts/new(.:format)                        accounts#new
  #      edit_account GET    /accounts/:id/edit(.:format)                   accounts#edit
  #           account GET    /accounts/:id(.:format)                        accounts#show
  #                   PATCH  /accounts/:id(.:format)                        accounts#update
  #                   PUT    /accounts/:id(.:format)                        accounts#update
  #                   DELETE /accounts/:id(.:format)                        accounts#destroy
  #
  # 嵌套路由的使用
  # resources :accounts do
  #   resources :roles
  # end

  #            Prefix Verb   URI Pattern                                    Controller#Action
  #    order_products GET    /orders/:order_id/products(.:format)           products#index
  #                   POST   /orders/:order_id/products(.:format)           products#create
  # new_order_product GET    /orders/:order_id/products/new(.:format)       products#new
  #            orders GET    /orders(.:format)                              orders#index
  #                   POST   /orders(.:format)                              orders#create
  #         new_order GET    /orders/new(.:format)                          orders#new
  #        edit_order GET    /orders/:id/edit(.:format)                     orders#edit
  #             order GET    /orders/:id(.:format)                          orders#show
  #                   PATCH  /orders/:id(.:format)                          orders#update
  #                   PUT    /orders/:id(.:format)                          orders#update
  #                   DELETE /orders/:id(.:format)                          orders#destroy
  #      edit_product GET    /products/:id/edit(.:format)                   products#edit
  #           product GET    /products/:id(.:format)                        products#show
  #                   PATCH  /products/:id(.:format)                        products#update
  #                   PUT    /products/:id(.:format)                        products#update
  #                   DELETE /products/:id(.:format)                        products#destroy
  #
  # 为了防止路由嵌套太多难以阅读，可以通过 only: [:action1, :action2] 来限定路由的创建
  # resources :orders do
  #   resources :products, only: [:index, :new, :create]
  # end
  # resources :products, only: [:show, :edit, :update, :destroy]

  #            Prefix Verb   URI Pattern                              Controller#Action
  #    order_products GET    /orders/:order_id/products(.:format)     products#index
  #                   POST   /orders/:order_id/products(.:format)     products#create
  # new_order_product GET    /orders/:order_id/products/new(.:format) products#new
  #      edit_product GET    /products/:id/edit(.:format)             products#edit
  #           product GET    /products/:id(.:format)                  products#show
  #                   PATCH  /products/:id(.:format)                  products#update
  #                   PUT    /products/:id(.:format)                  products#update
  #                   DELETE /products/:id(.:format)                  products#destroy
  #            orders GET    /orders(.:format)                        orders#index
  #                   POST   /orders(.:format)                        orders#create
  #         new_order GET    /orders/new(.:format)                    orders#new
  #        edit_order GET    /orders/:id/edit(.:format)               orders#edit
  #             order GET    /orders/:id(.:format)                    orders#show
  #                   PATCH  /orders/:id(.:format)                    orders#update
  #                   PUT    /orders/:id(.:format)                    orders#update
  #                   DELETE /orders/:id(.:format)                    orders#destroy
  #
  # 限制路由的简化写法
  # resources :orders do
  #   resources :products, shallow: true
  # end

  #             Prefix Verb   URI Pattern                                Controller#Action
  #    artice_comments GET    /artices/:artice_id/comments(.:format)     comments#index
  #                    POST   /artices/:artice_id/comments(.:format)     comments#create
  # new_artice_comment GET    /artices/:artice_id/comments/new(.:format) comments#new
  #       edit_comment GET    /comments/:id/edit(.:format)               comments#edit
  #            comment GET    /comments/:id(.:format)                    comments#show
  #                    PATCH  /comments/:id(.:format)                    comments#update
  #                    PUT    /comments/:id(.:format)                    comments#update
  #                    DELETE /comments/:id(.:format)                    comments#destroy
  #      artice_quotes GET    /artices/:artice_id/quotes(.:format)       quotes#index
  #                    POST   /artices/:artice_id/quotes(.:format)       quotes#create
  #   new_artice_quote GET    /artices/:artice_id/quotes/new(.:format)   quotes#new
  #         edit_quote GET    /quotes/:id/edit(.:format)                 quotes#edit
  #              quote GET    /quotes/:id(.:format)                      quotes#show
  #                    PATCH  /quotes/:id(.:format)                      quotes#update
  #                    PUT    /quotes/:id(.:format)                      quotes#update
  #                    DELETE /quotes/:id(.:format)                      quotes#destroy
  #      artice_drafts GET    /artices/:artice_id/drafts(.:format)       drafts#index
  #                    POST   /artices/:artice_id/drafts(.:format)       drafts#create
  #   new_artice_draft GET    /artices/:artice_id/drafts/new(.:format)   drafts#new
  #         edit_draft GET    /drafts/:id/edit(.:format)                 drafts#edit
  #              draft GET    /drafts/:id(.:format)                      drafts#show
  #                    PATCH  /drafts/:id(.:format)                      drafts#update
  #                    PUT    /drafts/:id(.:format)                      drafts#update
  #                    DELETE /drafts/:id(.:format)                      drafts#destroy
  #            artices GET    /artices(.:format)                         artices#index
  #                    POST   /artices(.:format)                         artices#create
  #         new_artice GET    /artices/new(.:format)                     artices#new
  #        edit_artice GET    /artices/:id/edit(.:format)                artices#edit
  #             artice GET    /artices/:id(.:format)                     artices#show
  #                    PATCH  /artices/:id(.:format)                     artices#update
  #                    PUT    /artices/:id(.:format)                     artices#update
  #                    DELETE /artices/:id(.:format)                     artices#destroy
  #
  # 限定路由还可以应用到每一个子元素中
  # resources :artices, shallow: true do
  #   resources :comments
  #   resources :quotes
  #   resources :drafts
  # end
end
