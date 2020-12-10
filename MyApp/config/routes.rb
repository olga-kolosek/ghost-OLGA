Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  #match 'users/sign_out' => "users/sessions#destroy", via: [:get, :delete]
  devise_scope :user do
     match '/users/sign_out' => 'users/sessions#destroy', via: [:get, :delete]
     post 'users/sign_in' => 'users/sessions#create' 
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
