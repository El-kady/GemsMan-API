Rails.application.routes.draw do
  devise_for :users, path: 'auth'

  resources :users, except: :show
  resources :ruby_gems, except: :show

  namespace :api, defaults: { format: :json } do
    post 'query', to: 'gems#query'
  end

  root to: "ruby_gems#index"
end
