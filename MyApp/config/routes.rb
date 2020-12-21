Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', invitations: 'users/invitations' }, param: :slug
  devise_scope :user do
     match '/users/sign_out' => 'users/sessions#destroy', via: [:get, :delete], param: :slug
     post 'users/sign_in' => 'users/sessions#create' , param: :slug
     post '/users/invitation/new' => 'users/invitations#invite_resource'
     put '/users/invitation/update' => 'users/invitations#accept_resource'

  end

  get 'team', action: :index, controller: 'team'
  match '/team/destroy/:id' => 'team#destroy', via: [:get, :delete]
  resources :stories
  resources :tags

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
