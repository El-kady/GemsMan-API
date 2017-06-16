Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  root to: "auth#sign_in"
end
