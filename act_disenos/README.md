# README

## Actividad Diseñando

Cree un nuevo proyecto Rails con los siguientes modelos:

~~~
rails new act_disenos
rails generate model Usuario nombre:string apellido:string lenguaje_favorito:string
rails generate model Publicacion titulo:string contenido:text usuario:references
~~~

Para esta actividad queremos que cree 2 archivos de diseño separados, dos_columnas.html.erb y tres_columnas.html.erb. También vamos a necesitar Twitter Bootstrap.

### Instalación de Twitter Bootstrap

1. Descarga: Descarguemos manuelamente los archivos del [sitio web Bootstrap](https://getbootstrap.com/). Asegúrate de descargar la versión compilada y comprimida (compiled and minified version).
2. CSS: 
    1. Mover bootstrap-dist/css/bootstrap.min.css -> 
    2. a vendor/assets/stylesheets en tu aplicación Rails.
3. JS: 
    1. Mover bootstrap-dist/js/bootstrap.min.js ->
    2. a vendor/assets/javascripts en tu aplicación Rails.
4. En ***app/assets/stylesheets/application.css***, actualízalo a:
    ~~~
    /*
    * This is a manifest file that'll be compiled into application.css, which will include all the files
    * listed below.
    *
    * Any CSS and SCSS file within this directory, lib/assets/stylesheets, vendor/assets/stylesheets,
    * or any plugin's vendor/assets/stylesheets directory can be referenced here using a relative path.
    *
    * You're free to add application-wide styles to this file and they'll appear at the bottom of the
    * compiled file so the styles you add here take precedence over styles defined in any styles
    * defined in the other CSS/SCSS files in this directory. It is generally better to create a new
    * file per style scope.
    *
    *= require bootstrap.min
    *= require_tree .
    *= require_self
    */
    ~~~
5. En ***app/assets/javascripts/application.js***, actualízalo a:
    ~~~
    // This is a manifest file that'll be compiled into application.js, which will include all the files
    // listed below.
    //
    // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
    // or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
    //
    // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
    // compiled file.
    //
    // Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
    // about supported directives.
    //
    //= require jquery
    //= require jquery_ujs
    //= require turbolinks
    //= require bootstrap.min
    //= require_tree .
    ~~~

#### *Antes de comenzar, voy a utilizar la gema de bootstrap por problemas de compatibilidad*

**Qué Hacer**
Para el diseño **dos_columnas**:

Utilizando bootstrap, cree un div con una clase *row*. Dentro de esa división, cree dos div que separen esa *row* en dos columnas de manera uniforme. Invocar el método *yield* en esos div y nombrarlos adecuadamente.

![two_column.png](/public/two_column.png)

Para el diseño **tres_columnas**:

Utilizando bootstrap, cree un div con una clase *row*. Dentro de esa división, cree tres div que separen esa *row* en tres columnas de manera uniforme. Invocar el método *yield* en esos div y nombrarlos adecuadamente. 

![three_column2.png](/public/three_column2.png)

Una vez está listo:

1. Cree dos controladores llamados *Usuarios y Publicacions*.
    ~~~
    rails generate controller Usuarios index
    rails generate controller Publicacions index
    ~~~
2. Para cada controlador, cree un método index y su archivo de vista.
3. Haz que el método index del controlador Usuarios use el diseño de dos columnas - [Descarga la estructura](https://s3.amazonaws.com/General_V88/boomyeah2015/codingdojo/curriculum/content/chapter/users.png). 

    Un lado de las columnas debe tener una tabla que muestre todos los usuarios en tu base de datos.
    El otro lado debe tener un formulario para crear un nuevo usuario y un enlace a "/publicaciones".
4. Haz que el método index del controlador Publicaciones use el diseño de las tres columnas - [Descarga la estructura](https://s3.amazonaws.com/General_V88/boomyeah2015/codingdojo/curriculum/content/chapter/posts.png).

    La primera columna debe tener una tabla que muestre todas las publicaciones.
    La segunda columna debe tener un formulario para crear una nueva publicación.
    La tercera columna debe tener una etiqueta h1 y un enlace para ir a la página de usuarios.

