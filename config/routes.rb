Rails.application.routes.draw do
  devise_for :admins
  resources :categories
  resources :collections
  mount Avo::Engine, at: Avo.configuration.root_path
  root 'home#index'
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
