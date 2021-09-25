# README

## Polimorfismo

En Ruby on Rails, Polimorfismo es la habilidad que tiene un modelo de pertenecer a más de un modelo. Creemos una nueva aplicación que implementará el ejemplo de [La guía de Ruby on Rails](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations).

```rails new poly```

En esta aplicación crearemos 3 modelos:

1- Imagen - Nuestro modelo polimórfico.
2- Empleado - Un empleado puede tener muchas imágenes..
3- Producto - Un producto puede tener muchas imágenes.

~~~
rails g model Imagen foto:references{polymorphic}
rails g model Empleado nombre:string apellido:string
rails g model Producto nombre:string
rake db:migrate
~~~

Ahora en cada archivo modelo, debemos agregar estas relaciones.

***app/models/imagen.rb***
~~~
class Imagen < ApplicationRecord
  belongs_to :foto, polymorphic: true
end
~~~

***app/models/empleado.rb***
~~~
class Empleado < ApplicationRecord
  has_many :imagens, as: :foto
end
~~~

***app/models/producto.rb***
~~~
class Producto < ApplicationRecord
  has_many :imagens, as: :foto
end
~~~

Si consultamos nuestra tabla *imagen*, tendremos una columna *foto_id* y una *foto_type*. Estas columnas junto con la referencia *foto* es lo que le permite a nuestro modelo Imagen ser polimórfico. Vamos a la consola de Rails y veámoslo en acción:

~~~
# una nueva instancia del modelo Imagen. Tome nota de las columnas foto_id  y  foto_type
Imagen.new
=> #<Imagen id: nil, foto_id: nil, foto_type: nil, created_at: nil, updated_at: nil> 
# creemos un par de empleados y productos y así podremos agregarles imágenes.
Empleado.create(nombre: "John", apellido: "Doe")
Empleado.create(nombre: "Jane", apellido: "Doe")
Producto.create(nombre: "Pillow")
Producto.create(nombre: "Sofa")
# creemos algunas imágenes para los empleados y productos que acabamos de crear. Hay varias formas de hacer esto.
# Primer ejemplo:
Imagen.create(foto_id: 1, foto_type: "Empleado")
Imagen.create(foto_id: 1, foto_type: "Producto")
# segundo ejemplo:
Imagen.create(foto: Empleado.second)
Imagen.create(foto: Producto.second)
# ahora para recuperar las imágenes de cualquier empleado o producto, podemos hacer lo siguiente:
pics1 = Empleado.first.imagens
pics2 = Empleado.second.imagens
pics3 = Producto.first.imagens
pics4 = Producto.second.imagens
~~~

| id | foto_type | foto_id | created_at              | updated_at              |
|----|-----------|---------|-------------------------|-------------------------|
| 1  | Empleado  | 1       | 2021-07-25 00:28:17 UTC | 2021-07-25 00:28:17 UTC |

| id | foto_type | foto_id | created_at              | updated_at              |
|----|-----------|---------|-------------------------|-------------------------|
| 3  | Empleado  | 2       | 2021-07-25 00:29:02 UTC | 2021-07-25 00:29:02 UTC |

| id | foto_type | foto_id | created_at              | updated_at              |
|----|-----------|---------|-------------------------|-------------------------|
| 2  | Producto  | 1       | 2021-07-25 00:28:23 UTC | 2021-07-25 00:28:23 UTC |

| id | foto_type | foto_id | created_at              | updated_at              |
|----|-----------|---------|-------------------------|-------------------------|
| 4  | Producto  | 2       | 2021-07-25 00:29:18 UTC | 2021-07-25 00:29:18 UTC |
