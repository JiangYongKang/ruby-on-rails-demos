Rails.application.routes.draw do
  resources :live, only: :index
end
