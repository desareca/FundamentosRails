Rails.application.routes.draw do
  get '/' => "rcontrollers#index"
  get 'hola' => "rcontrollers#hola"
  get 'dice/hola' => "rcontrollers#dice_hola"
  get 'dice/hola/:st' => "rcontrollers#nombre"
  get 'visitas' => "rcontrollers#visita"
  get 'visitas/restart' => "rcontrollers#restart"
end
