class UsuariosController < ApplicationController
  layout "two_columns"

  def index
    @usuarios = Usuario.all
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params).save
    redirect_to '/usuarios'
  end

  private
  def usuario_params
    params.require(:usuario).permit(:nombre, :apellido, :lenguaje_favorito)
  end


end
