# README

# README

## ¡Familiarizarte con Rutas y Controladores!

Antes de profundizar más sobre las vistas y otros conceptos en el marco de Rails, hagamos unos ejercicios para asegurarnos que te sientes cómodo con las rutas y los controladores de Rails. Para estos ejercicios, no utilizarás ningún archivo vista, simplemente usarás "render plain" directamente en el controlador.

El propósito de esta actividad es hacerte sentir cómodo utilizando las rutas, controladores, sesiones y flash, así como también que se sienta cómodo aplicando lo que aprendió en la sección anterior sobre los modelos y usarlos junto con los nuevos conceptos que acabas de aprender. 

Por favor complete lo siguiente:

~~~
rails new ruta_controlador

rails g controller Rcontrollers index hola dice_hola nombre visita restart
~~~

* Cuando se envíe una solicitud HTTP - GET a http://localhost:3000/hola, haz que muestre un texto que diga "Hola Coding Dojo"

    ***config/routes.rb***
    ~~~
    get 'hola' => "rcontrollers#hola"
    ~~~

    ***controllers/rcontrollers_controller.rb***
    ~~~
    def hola
        render plain: 'Hola Coding Dojo'    
    end
    ~~~

* Cuando se * envíe una solicitud HTTP - GET a http://localhost:3000/dice/hola, haz que muestre un texto que diga "¡Diciendo Hola!"  

    ***config/routes.rb***
    ~~~
    get 'dice/hola' => "rcontrollers#dice_hola"
    ~~~

    ***controllers/rcontrollers_controller.rb***
    ~~~
    def dice_hola
        render plain: '¡Diciendo Hola!'    
    end
    ~~~

* Cuando se envíe una solicitud HTTP - GET a http://localhost:3000/dice/hola/joe, haz que muestre un texto que diga "¡Saludando a Joe!"

    ***config/routes.rb***
    ~~~
    get 'dice/hola/:st' => "rcontrollers#nombre"
    ~~~

    ***controllers/rcontrollers_controller.rb***
    ~~~
    def nombre
        if params[:st]=='joe'
            render plain: '¡Saludando a Joe!'    
        elsif params[:st]=='michael'
            redirect_to '/dice/hola/joe'
        end
    end
    ~~~

* Cuando se envíe una solicitud HTTP - GET a http://localhost:3000/dice/hola/michael, haz que se redireccione a la URL 'dice/hola/joe'. 

    ***config/routes.rb***
    ~~~
    get 'dice/hola/:st' => "rcontrollers#nombre"
    ~~~

    ***controllers/rcontrollers_controller.rb***
    ~~~
    def nombre
        if params[:st]=='joe'
            render plain: '¡Saludando a Joe!'    
        elsif params[:st]=='michael'
            redirect_to '/dice/hola/joe'
        end
    end
    ~~~

* Cuando se envíe una solicitud HTTP - GET a http://localhost:3000, haz que el método index del controlador maneje la respuesta. Haz que muestre un mensaje que diga "¿Qué quieres que diga?".

    ***config/routes.rb***
    ~~~
    get '/' => "rcontrollers#index"
    ~~~

    ***controllers/rcontrollers_controller.rb***
    ~~~
    def index
        render plain: '¿Qué quieres que diga?'    
    end
    ~~~

* Cuando se envíe una solicitud HTTP - GET a http://localhost:3000/visitas, muestre cuántas veces haz visitado la página. 

    ***config/routes.rb***
    ~~~
    get 'visitas' => "rcontrollers#visita"
    ~~~

    ***controllers/rcontrollers_controller.rb***
    ~~~
    def visita
        @@visit = @@visit + 1
        if @@visit==1
        render plain: "Haz visitado esta página #{@@visit} vez"
        elsif @@visit>1
        render plain: "Haz visitado esta página #{@@visit} veces"
        end
    end
    ~~~

* Cuando visites por primera vez esa url, debe decir "Haz visitado esta página 1 vez". Recarga la página varias veces para asegurarte que el número aumenta.  Cuando se envíe una solicitud HTTP - GET a http://localhost:3000/visitas/restart, elimine la sesión y muestre un mensaje que diga "¡Sesión destruida!"

    ***config/routes.rb***
    ~~~
    get 'visitas/restart' => "rcontrollers#restart"
    ~~~

    ***controllers/rcontrollers_controller.rb***
    ~~~
    def restart
        @@visit=0
        render plain: "¡Sesión destruida!"
    end
    ~~~




