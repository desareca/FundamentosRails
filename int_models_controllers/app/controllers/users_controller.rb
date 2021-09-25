class UsersController < ApplicationController
  def index
    @usuarios = User.all
    render json: @usuarios
  end

  def new
    @usuario = User.new
  end

  def show
    @usuario_id = User.find(params[:id])
    render json: @usuario_id
  end

  def edit
    @us_id = User.find(params[:id])
  end

  def create
    @usuario = User.new(parametros_user)
    if @usuario.save
      session[:user_id] = @usuario.id
      flash[:notice] = "User creado exitosamente "
      redirect_to users_path
    else
      flash[:errors] = [@usuario.errors.full_messages]
      redirect_to users_new_path
    end
  end

  def total
    @usuarios = User.all
  end

  def parametros_user
    params.require(:user).permit(:first_name, :last_name)
  end

end
