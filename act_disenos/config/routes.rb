Rails.application.routes.draw do
  get '/usuarios' => 'usuarios#index'
  post '/usuarios' => 'usuarios#create'
  get '/publicacions' => 'publicacions#index'
  post '/publicacions' => 'publicacions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
