Rails.application.routes.draw do
  devise_for :users
  resources :headlines 
  root 'headlines#index'
end
