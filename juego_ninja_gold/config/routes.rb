Rails.application.routes.draw do
  get '/' => 'rpgs#index'
  post '/process' => 'rpgs#calc'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
