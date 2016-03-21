Rails.application.routes.draw do

  get 'session/new' => 'sessions#new', as: :sign_in
  post 'session/new' => 'sessions#create'
  delete 'session' => 'sessions#delete', as: :sign_out

  get 'users/new' => 'users#new', as: :new_user
  post 'users' => 'users#create', as: :users
  get 'users/:confirm_token/verify' => 'users#verify', as: :verify_user

  root 'speeches#index'
  get 'speeches/:id' => 'speeches#show', as: :speech
  post 'speeches/:id/share' => 'speeches#share', as: :share_speech
  get 'users/pending' => 'users#confirm_pending', as: :confirm_pending

  namespace :api do
    get "speeches" => 'speeches#index'
    post 'speeches' => 'speeches#create'
    get 'speeches/:id' => 'speeches#show'
  end
end
