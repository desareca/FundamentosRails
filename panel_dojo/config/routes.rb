Rails.application.routes.draw do
  get '/dojos/' => 'dojos#index'
  get '/dojos/new/' => 'dojos#new'
  get '/dojos/:dojo_id' => 'dojos#show'
  post '/dojos/create' => 'dojos#create'
  get 'dojos/:dojo_id/edit' => 'dojos#edit'
  post 'dojos/:dojo_id' => 'dojos#update'
  delete '/dojos/:dojo_id' => 'dojos#destroy'#delete 'dojos/delete'

  get '/dojos/:dojo_id/estudiantes' => 'estudiantes#index'
  get '/dojos/:dojo_id/estudiantes/new' => 'estudiantes#new'
  post '/dojos/:dojo_id/estudiantes' => 'estudiantes#create'
  get '/dojos/:dojo_id/estudiantes/:id' => 'estudiantes#show'
  get '/dojos/:dojo_id/estudiantes/:id/edit' => 'estudiantes#edit'
  post '/dojos/:dojo_id/estudiantes/:id' => 'estudiantes#update'
  delete '/dojos/:dojo_id/estudiantes/:id' => 'estudiantes#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
