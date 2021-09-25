class PublicacionsController < ApplicationController
  layout "three_columns"
  def index
      @publicaciones = Publicacion.all
      @publicacion = Publicacion.new
      @user_name = user_name()
  end

  def create
    @publicacion = Publicacion.new(publicacion_params).save
    redirect_to '/publicacions'
  end

  private
  # Only allow a list of trusted parameters through.
  def publicacion_params
    params.require(:publicacion).permit(:titulo, :contenido, :usuario_id)
  end

  def user_name(arr)
    user_name = []
    arr.each do |r|
      user_name.push([Usuario.find(r).rol, r])
    end
    user_name
  end

  def user_name
    user_name = []
    Usuario.all.each do |user|
      user_name.push(["#{user.nombre} #{user.apellido}", user.id])
    end
    user_name
  end

end
