Rails.application.routes.draw do

  devise_for :users
  resources :articles do
    resources :comments
  end

  resources :users 

  # email subscribe path to UsersController 
  patch "users/:id/email_subscribe", to: "users#email_subscribe", as: :email_subscribe  

  # there should not be a create resource on the shallow route
  resources :comments, except: [:new, :create] do
    resources :comments
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
