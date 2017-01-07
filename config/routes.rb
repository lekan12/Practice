Rails.application.routes.draw do
  resources :headlines 
  root 'headlines#index'
end
