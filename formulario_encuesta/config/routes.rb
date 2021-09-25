Rails.application.routes.draw do
  get '/' => 'formularios#new'
  post '/create' => 'formularios#create'
  get '/result' => 'formularios#result'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
