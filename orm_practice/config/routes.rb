Rails.application.routes.draw do
  resources :roles
  get 'roles/perro'
  resources :rols
  resources :usuarios
  resources :clientes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
