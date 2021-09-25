Rails.application.routes.draw do
  get 'users/' => 'users#index'
  get 'users/new/' => 'users#new'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  post 'users/create' => 'users#create'
  get 'total' => 'users#total'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
