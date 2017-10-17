Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/clients/new', to: 'clients#new'
  get '/clients', to: 'clients#index'
end
