class FormulariosController < ApplicationController
  def new
  end

  def create
    @form = Formulario.new(form_parameter)
    if @form.save
      session[:form_id] = @form.id
      puts session[:form_id]
      flash[:notice] = "Formulario creado exitosamente "
      redirect_to "/result"
    else
      flash[:errors] = [@form.errors.full_messages]
      redirect_to '/' #retorno al welcome#index con errores
    end
  end

  def result
    @form = Formulario.find_by(id: session[:form_id])
    #redirect_to '/'
  end

  def form_parameter
      params.require(:data).permit(:nombre, :dojo, :lenguaje, :comentario)
  end

end