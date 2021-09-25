class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
    if params[:sort] == "sucursal"
      @dojos = Dojo.all.sort_by{|dojo| dojo.sucursal}
    elsif params[:sort] == "calle"
      @dojos = Dojo.all.sort_by{|dojo| dojo.calle}
    elsif params[:sort] == "ciudad"
      @dojos = Dojo.all.sort_by{|dojo| dojo.ciudad}
    elsif params[:sort] == "estado"
      @dojos = Dojo.all.sort_by{|dojo| dojo.estado}
    else
      @dojos = Dojo.all
    end
  end

  def show
    @dojo = Dojo.find(params[:dojo_id])
    @estudiantes = Estudiante.where(dojo:@dojo)
  end

  def new
    @dojo = Dojo.new
  end

  def create
    @dojo = Dojo.new(data_parameter)
    if @dojo.save
      session[:dojo_id] = @dojo.id
      puts session[:dojo_id]
      flash[:notice] = "Dojo creado exitosamente "
      redirect_to "/dojos/"
    else
      flash[:errors] = [@form.errors.full_messages]
      redirect_to '/dojos/new' #retorno al welcome#index con errores
    end
  end

  def edit
    @dojo = Dojo.find(params[:dojo_id])
  end

  def update
    @dojo = Dojo.find(params[:dojo_id])
    if @dojo.update(data_parameter)
      flash[:notice] = @dojo.sucursal + " actualizado exitosamente "
      redirect_to "/dojos/"+ @dojo.id.to_s
    else
      flash[:errors] = [@form.errors.full_messages]
      redirect_to '/dojos/'+ @dojo.id.to_s + '/edit'#retorno al welcome#index con errores
    end
  end

  def delete
  end

  def destroy
    Dojo.find(params[:dojo_id]).destroy
    redirect_to "/dojos/"
  end


  def data_parameter
    params.require(:data).permit(:sucursal, :calle, :ciudad, :estado)
  end

end
