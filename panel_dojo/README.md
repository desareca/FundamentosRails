# README

## Panel Dojo

Crear un nuevo modelo llamado Dojo con los siguientes campos:

sucursal:string
calle:string
ciudad:string
estado:string

Utilizando la consola, cree algunos registros.

Ahora, en el método index de DojosController:

Obtenga toda la información de los dojos.
Envíe esa información al archivo vista apropiado.
Utilice el método **.each** para mostrar la información de cada dojo.

![dojo1.png](/public/dojo1.png)

~~~
rails g model Dojo sucursal:string calle:string ciudad:string estado:string
rake db:migrate
~~~

~~~
Dojo.new(sucursal:'CD Seattle', calle:'1111 Main St', ciudad:'Bellevue', estado:'WA').save
Dojo.new(sucursal:'CD San Jose', calle:'2222 Zanker Rd', ciudad:'San Jose', estado:'CA').save
Dojo.new(sucursal:'CD Burbank', calle:'3333 Olive Ave', ciudad:'Burbank', estado:'CA').save
Dojo.new(sucursal:'CD Chicago', calle:'4444 Institute PI', ciudad:'Chicago', estado:'IL').save
Dojo.all
~~~

| id | sucursal    | calle             | ciudad   | estado | created_at              | updated_at              |
|----|-------------|-------------------|----------|--------|-------------------------|-------------------------|
| 1  | CD Seattle  | 1111 Main St      | Bellevue | WA     | 2021-08-02 05:00:59 UTC | 2021-08-02 05:00:59 UTC |
| 2  | CD San Jose | 2222 Zanker Rd    | San Jose | CA     | 2021-08-02 05:00:59 UTC | 2021-08-02 05:00:59 UTC |
| 3  | CD Burbank  | 3333 Olive Ave    | Burbank  | CA     | 2021-08-02 05:00:59 UTC | 2021-08-02 05:00:59 UTC |
| 4  | CD Chicago  | 4444 Institute PI | Chicago  | IL     | 2021-08-02 05:00:59 UTC | 2021-08-02 05:00:59 UTC |

~~~
rails g controller Dojos index show new create edit update delete
~~~
