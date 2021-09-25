# README

## Integrando Modelos y Controladores

Ya debes sentirte un poco más cómodo con las rutas y controladores. Hagamos ahora algunos ejercicios para asegurarnos que te sientes cómodo utilizando los modelos con tus controladores.

En esta actividad, es posible que deba utilizar "render json". Por ejemplo, si quieres generar una salida JSON de todos tus productos, podrías hacer algo como esto:

~~~
def index
  render json: Producto.all
end
~~~

Con esto en mente, por favor complete lo siguiente: 

~~~
# terminal
rails g model user first_name:string last_name:string
rake db:migrate

rails g controller Users index new edit create total

# console rails
apellido = [
    'González',
    'Muñoz',
    'Rojas',
    'Díaz',
    'Pérez',
    'Soto',
    'Contreras',
    'Silva',
    'Martínez',
    'Sepúlveda',
    'Morales',
    'Rodríguez',
    'López',
    'Fuentes',
    'Hernández'
]

nombre = ['Mateo',
    'Isabella',
    'Sofía',
    'Agustina',
    'Agustín',
    'Santiago',
    'Emilia',
    'Tomás',
    'Benjamín',
    'Lucas',
    'Josefa',
    'Isidora',
    'Emma',
    'Trinidad',
    'Gaspar'
]

(1..30).each do |i|
    User.create(first_name: nombre[rand(0...nombre.length)], last_name: apellido[rand(0...apellido.length)])
end

User.all
~~~

| id | first_name | last_name | created_at              | updated_at              |
|----|------------|-----------|-------------------------|-------------------------|
| 1  | Santiago   | Rojas     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 2  | Josefa     | González  | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 3  | Tomás      | González  | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 4  | Santiago   | López     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 5  | Isabella   | Silva     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 6  | Isabella   | Sepúlveda | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 7  | Emilia     | Rojas     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 8  | Emma       | Morales   | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 9  | Trinidad   | Muñoz     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 10 | Agustín    | Pérez     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 11 | Agustín    | Soto      | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 12 | Isidora    | Muñoz     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 13 | Sofía      | Rojas     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 14 | Gaspar     | Pérez     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 15 | Agustín    | González  | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 16 | Josefa     | Silva     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 17 | Mateo      | López     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 18 | Mateo      | Pérez     | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 19 | Mateo      | Morales   | 2021-07-26 19:49:14 UTC | 2021-07-26 19:49:14 UTC |
| 20 | Santiago   | Rojas     | 2021-07-26 19:49:15 UTC | 2021-07-26 19:49:15 UTC |
| 21 | Tomás      | Muñoz     | 2021-07-26 19:49:15 UTC | 2021-07-26 19:49:15 UTC |
| 22 | Emilia     | Sepúlveda | 2021-07-26 19:49:15 UTC | 2021-07-26 19:49:15 UTC |
| 23 | Santiago   | González  | 2021-07-26 19:49:15 UTC | 2021-07-26 19:49:15 UTC |
| 24 | Tomás      | Silva     | 2021-07-26 19:49:15 UTC | 2021-07-26 19:49:15 UTC |
| 25 | Agustina   | López     | 2021-07-26 19:49:15 UTC | 2021-07-26 19:49:15 UTC |
| 26 | Mateo      | González  | 2021-07-26 19:49:15 UTC | 2021-07-26 19:49:15 UTC |
| 27 | Sofía      | Muñoz     | 2021-07-26 19:49:15 UTC | 2021-07-26 19:49:15 UTC |
| 28 | Josefa     | López     | 2021-07-26 19:49:15 UTC | 2021-07-26 19:49:15 UTC |
| 29 | Benjamín   | Hernández | 2021-07-26 19:49:15 UTC | 2021-07-26 19:49:15 UTC |
| 30 | Santiago   | Rojas     | 2021-07-26 19:49:15 UTC | 2021-07-26 19:49:15 UTC |

* Cuando se reciba una solicitud HTTP - GET en '/usuarios', haz que la aplicación de Rails muestre, en formato json, todos los usuarios que están en la base de datos. Tu tabla de usuarios debe estar compuesta simplemente por id, nombre, created_at y updated_at.  

    ***/config/routes.rb***
    ~~~
    get 'users/' => 'users#index'
    ~~~

    ***/controllers/users_controller.rb***
    ~~~
    def index
        @usuarios = User.all
        render json: @usuarios
    end
    ~~~

* Cuando se reciba una solicitud HTTP - GET en '/usuarios/new', haz que muestre un archivo de vista con un formulario vacío para crear un nuevo usuario.  

    ***/config/routes.rb***
    ~~~
    get 'users/new/' => 'users#new'
    ~~~

    ***/controllers/users_controller.rb***
    ~~~
    def new
        @usuario = User.new
    end
    ~~~

    ***/views/users/new.html.erb***
    ~~~
    <h1>Nuevo Usuario</h1>

    <%= form_for @usuario, url: {action: "create"}, html: {class: "nifty_form"} do |u| %>
        <%= u.label :first_name %><br>
        <%= u.text_field :first_name %><br>
        <%= u.label :last_name %><br>
        <%= u.text_field :last_name %><br><br>
        <%= u.submit "Create" %>
    <% end %>

    <%= link_to 'Back', users_path %>
    ~~~

* Cuando se reciba una solicitud HTTP - GET en '/usuarios/1', haz que muestre, en formato json, la información del usuario con id=1.  

    ***/config/routes.rb***
    ~~~
    get 'users/:id' => 'users#show'
    ~~~

    ***/controllers/users_controller.rb***
    ~~~
    def show
        @usuario_id = User.find(params[:id])
        render json: @usuario_id
    end
    ~~~

* Cuando se reciba una solicitud HTTP - GET en '/usuarios/1/edit', haz que muestre un archivo de vista con un formulario que contenga la información del usuario con id=1 en los campos apropiados para cada valor.  

    ***/config/routes.rb***
    ~~~
    get 'users/:id/edit' => 'users#edit'
    ~~~

    ***/controllers/users_controller.rb***
    ~~~
    def edit
        @us_id = User.find(params[:id])
    end
    ~~~

    ***/views/users/1/edit.html.erb***
    ~~~
    <h1>Editar Usuario</h1>

    <%= form_for @us_id, url: {action: "create"}, html: {class: "nifty_form"}, method: "get" do |u| %>
        <%= u.label :first_name %><br>
        <%= u.text_field :first_name %><br>
        <%= u.label :last_name %><br>
        <%= u.text_field :last_name %><br><br>
    <% end %>

    <%= link_to 'Back', users_path %>
    ~~~

* Cuando se reciba una solicitud HTTP - POST en '/usuarios' generada desde '/usuarios/new', haz que cree un un usuario con la información recibida en cada campo de entrada. Después de crear el usuario, redireccione a la ruta '/usuarios'.  

    ***/config/routes.rb***
    ~~~
    post 'users/create' => 'users#create'
    ~~~

    ***/controllers/users_controller.rb***
    ~~~
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
    ~~~

* Cuando se reciba una solicitud HTTP - GET en '/usuarios/total', haz que muestre el número total de usuarios.
    
    ***/config/routes.rb***
    ~~~
    get 'total' => 'users#total'
    ~~~

    ***/controllers/users_controller.rb***
    ~~~
    def total
        @usuarios = User.all
    end
    ~~~

    ***/views/users/total.html.erb***
    ~~~
    <h3>Cantidad de usuarios: <%= @usuarios.length %></h3>
    ~~~
