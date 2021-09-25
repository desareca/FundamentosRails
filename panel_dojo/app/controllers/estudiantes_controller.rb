class EstudiantesController < ApplicationController
  def index
  end

  def new
    @dojo = Dojo.find(params[:dojo_id])
    @dojos = Dojo.all
    @estudiante = Estudiante.new()
  end

  def create
    @dojo = Dojo.find(params[:dojo])
    @estudiante = Estudiante.new(nombre:params[:nombre], apellido:params[:apellido], email:params[:email], dojo:@dojo)
    if @estudiante.save
      flash[:notice] = "Estudiante creado exitosamente "
      redirect_to "/dojos/"+@dojo.id.to_s
    else
      flash[:errors] = [@form.errors.full_messages]
      redirect_to '/dojos/new' #retorno al welcome#index con errores
    end
  end

  def show
    @dojo = Dojo.find(params[:dojo_id])
    @dojos = Dojo.all
    @estudiante = Estudiante.find(params[:id])
  end

  def edit
    @dojo = Dojo.find(params[:dojo_id])
    @dojos = Dojo.all
    @estudiante = Estudiante.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:dojo]) 
    @estudiante = Estudiante.find(params[:id])
    if @estudiante.update(nombre:params[:nombre], apellido:params[:apellido], email:params[:email], dojo:@dojo)
      flash[:notice] = @estudiante.nombre + " " + @estudiante.apellido + " actualizado exitosamente "
      redirect_to "/dojos/"+ @dojo.id.to_s
    else
      flash[:errors] = [@form.errors.full_messages]
      redirect_to '/dojos/'+ @dojo.id.to_s + '/edit'#retorno al welcome#index con errores
    end
  end

  def destroy
    @dojo = Dojo.find(params[:dojo_id]) 
    Estudiante.find(params[:id]).delete
    redirect_to "/dojos/"+ @dojo.id.to_s
  end


end
