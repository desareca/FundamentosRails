# README

## Mostrando el Tiempo

Crea un controlador llamado *Tiempo* y un método llamado *main*. Cuando el usuario vaya a *localhost:3000* el método *main* debería desplegar una vista y pasar a esa vista una variable que contenga la fecha y hora actual y mostrarla en la página.

Cuando trabajas con aplicaciones web, es importantes entender cómo se pasan los datos de un controlador a la vista. Esta actividad es para ayudarte a comprender cómo se hace esto en Rails.

![time.png](/public/time.png)


Para este proyecto, queremos que utilice la gema 'rails-footnotes'  (ve a https://github.com/josevalim/rails-footnotes para más información sobre esta gema). ***La gema no está disponible para las versiones actuales de rails, por lo que se obviará***

## Desarrollo

* En terminal:

    ~~~
    rails new showtime
    ~~~

* En terminal (/showtime):

    ~~~
    rails g controller Tiempo main
    ~~~

* Modificar archivos:

    ***tiempos_controller.rb***
    ~~~
    get '/main' => 'tiempos#main'
    ~~~

    ***main.html.erb***
    ~~~
    <div class='container'>
        <div class='row justify-content-center mt-3'>
        <h6 class='col-3 my-3 mx-2 mb-4'>The current time and date:</h6>
        </div>

        <div class='row time mt-5 pt-3 px-5'>
            <p><%= I18n.l(Date.today, format: '%A, %d de %B de %Y')  %></p>
            <p><%= Time.now.strftime("%H:%M:%S %p") %></p>
        </div>
    </div>
    ~~~

    ***tiempos.scss***
    ~~~
    * {
        text-align: center;
    }

    h6 {
        display: inline-block;
        //padding: 5px 10px;
        border: 1px solid black;
    }

    .time {
        display: inline-block;
        margin: auto;
        padding: 5px 10px;
        border: 1px solid black;
        font-size: 40px;
        vertical-align: middle;
    }
    ~~~




