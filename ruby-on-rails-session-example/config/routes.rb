Rails.application.routes.draw do
  resources :cookies, only: :index
  resources :sessions, only: %w(index update destroy)
end
