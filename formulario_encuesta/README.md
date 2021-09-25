# README

## Formulario de Encuesta

Tu próxima actividad es construir un nuevo proyecto Rails para hacer lo que se muestra a continuación. Para cualquier aplicación web, es crítico que entiendas cómo se envían los **formularios** y cómo funcionan los datos **POST** y datos de **SESSION**. Comprender estos conceptos es crítico para construir cualquier aplicación web. Por ahora, también deberías saber que **nunca debes** desplegar una ruta POST, A medida que construya la aplicación descrita a continuación, asegúrate de sentirte cómodo sobre cómo se transmite la información entre formularios, controladores y vistas y cómo los datos de **session** y **post** se manejan en Rails.

**Nota:**  *process* **es una palabra reservada en Rails. NO utilice este nombre para crear métodos del controlador. ¡O sufrirá mucho!**

Haga esto sin utilizar la gema *simple_form*. Para los mensajes en la caja verde, utilice **flash** en lugar de session.

![form-basic.png!](/public/form-basic.png)

## Controladores y vistas

* En consola:
    ~~~
    rails g controller Formularios new create result
    ~~~

* ***config/routes.rb***:

    ~~~
    get '/' => 'formularios#new'
    post '/create' => 'formularios#create'
    get '/result' => 'formularios#result'
    ~~~

* Modificación de ***app/views/new.html.erb***, agrega formulario, se extraen datos a través de ```:data```.

* Modificación de ***app/views/result.html.erb***, se muestran datos del formulario, se muestran datos a través de ```:current_form```.

* ***app/controllers/routes.rb***:

    ~~~
    class FormulariosController < ApplicationController
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
    ~~~

* ***app/controllers/routes.rb***:

    ~~~
    class ApplicationController < ActionController::Base
        def current_form
            Formulario.find(session[:form_id]) if session[:form_id]
            end
        helper_method :current_form    
    end
    ~~~


