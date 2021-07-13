Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users

  get '/admin', to: 'users#index', as: 'admin'
  get '/admin/:id/edit', to: 'users#admin_update', as: 'edit_admin'

  resources :stores
  resources :roles
  resources :users

  authenticated :user do
    root to: 'stores#index', as: :authenticated_root
  end

  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
