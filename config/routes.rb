Rails.application.routes.draw do
  resources :list_shoppings do
    resources :items
  end
  devise_for :users
  root 'list_shoppings#index'


end
