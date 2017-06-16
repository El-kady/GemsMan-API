Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  resources :users, except: :show
  resources :ruby_gems, except: :show
  root to: "users#index"
end
