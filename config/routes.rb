Rails.application.routes.draw do

  root 'speeches#index'
  get 'speeches/:id' => 'speeches#show', as: :speech

  namespace :api do
    get "speeches" => 'speeches#index'
    post 'speeches' => 'speeches#create'
    get 'speeches/:id' => 'speeches#show'
  end
end
