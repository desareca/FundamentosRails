class RcontrollersController < ApplicationController
  @@visit = 0 # Activa la sesion
  # Pagina inicial
  def index
    render plain: '¿Qué quieres que diga?'    
  end
  # /hola/
  def hola
    render plain: 'Hola Coding Dojo'    
  end
  # /dice/hola/
  def dice_hola
    render plain: '¡Diciendo Hola!'    
  end
  # /dice/hola/:st
  def nombre
    if params[:st]=='joe'
      render plain: '¡Saludando a Joe!'    
    elsif params[:st]=='michael'

      redirect_to '/dice/hola/joe'
    end
  end
  # /visitas/
  def visita
    # inicializa la cuenta de visitas en la sesion
    if @@visit==0
      session[:v]= @@visit
      @@visit = -1
    end

    session[:v] = session[:v] + 1 # agrega 1 a las visitas
    # imprime mensaje
    if session[:v]==1
      render plain: "Haz visitado esta página #{session[:v]} vez"
    elsif session[:v]>1
      render plain: "Haz visitado esta página #{session[:v]} veces"
    end
  end
  # /visitas/restart/
  def restart
    session.delete(:v) #elimina :v de sesion
    @@visit=0 # inicializa las visitas
    render plain: "¡Sesión destruida!"
  end
end