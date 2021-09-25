# README

## Dojo Ninjas

Cree un nuevo proyecto llamado 'dojo_ninjas' y haga que utilice la base de datos SQLite predeterminada para el entorno de desarrollo y pruebas. 

Para este proyecto, vas a necesitar las siguientes tablas/modelos. Por favor vea el siguiente diagrama y cree los modelos necesarios.

### dojos:

* id INT
* name VARCHAR(255)
* city VARCHAR(255)
* state VARCHAR(255)
* created_at DATETIME
* updated_at DATETIME

Haga que incluya el nombre del dojo, la ciudad y el estado de cada dojo.
Haga que el primero dojo sea "CodingDojo Silicon Valley" en "Mountain View", "CA".
Haga que el segundo dojo sea "CodingDojo Seattle" en "Seattle", "WA".
Haga que el tercer dojo sea "CodingDojo New York" en "New York", "NY".

### ninjas:

* id INT
* dojo_id INT (FK)
* first_name VARCHAR(255)
* last_name VARCHAR(255)
* created_at DATETIME
* updated_at DATETIME

Haga que incluya el nombre y apellido de cada ninja en el dojo.
Cada dojo puede tener múltiples ninjas y cada ninja pertenece a un dojo específico.

### INFORMACIÓN IMPORTANTE: 

Cuando realices cualquiera de estas actividades en esta sección, no debes referenciar a las claves foráneas directamente. Por ejemplo, en lugar de hacer Ninja.create(dojo_id: 1, ...), debes escribir algo como esto: Ninja.create(dojo: Dojo.first, ...). Haciendo esto, estamos preservando nuestra base de datos para que no tenga mala información. En el primer ejemplo, un ninja será creado incluso si el dojo con id 1 no existe todavía. En el segundo ejemplo, Active Record solo creará un ninja si hay al menos un dojo en nuestra base de datos.

### Esto es lo que harás:

1- Empieza un nuevo proyecto (el nombre del proyecto debe ser 'dojo_ninjas').

    ```rails new dojo_ninjas```

2- Crea las tablas/modelos apropiados.

    ```rails g model Dojo name:string city:string state:string```
    ```rails g model Ninja first_name:string last_name:string dojo:references```
    ```rake db:migrate```

3- Usando la consola de Ruby

    1- Cree 3 dojos (ingrese algunos datos en blanco solo para asegurarse que le permite ingresar datos en blanco).

        ```Dojo.create(name:"CodingDojo Silicon Valley", city:"Mountain View", state:"CA")```
        ```Dojo.create(name:"CodingDojo Seattle", state:"WA")```
        ```Dojo.create(name:"CodingDojo New York", city:"New York")```

        | id | name                      | city          | state | created_at              | updated_at              |
        |----|---------------------------|---------------|-------|-------------------------|-------------------------|
        | 1  | CodingDojo Silicon Valley | Mountain View | CA    | 2021-07-19 20:12:37 UTC | 2021-07-19 20:12:37 UTC |
        | 2  | CodingDojo Seattle        |               | WA    | 2021-07-19 20:12:45 UTC | 2021-07-19 20:12:45 UTC |
        | 3  | CodingDojo New York       | New York      |       | 2021-07-19 20:12:51 UTC | 2021-07-19 20:12:51 UTC |

4- Cambia tu modelo para que haga las siguientes validaciones:

    1- Para dojo, requerir nombre, ciudad, estado. También haga que el estados sea de 2 caracteres de longitud. 
            
        ```# name y city```
        ```validates :name, :city, presence: true```
        ```# state```
        ```validates :state, presence: true, length: 2```

    2- Para ninja, requerir nombre y apellido.

        ```belongs_to :dojo```
        ```# name y city```
        ```validates :first_name, :last_name, presence: true```

5- Asegúrate que el modelo ninja pertenece a dojo (especifique esto en ambos modelos tanto dojo como en ninja).

    ```has_many :ninjas```

6- Usando la consola de Ruby

    1- Elimine los 3 dojos que creó (ej. Dojo.find(1).destroy, también consulte el método destroy_all).

        ```Dojo.find(1).destroy```
        ```Dojo.find(2).destroy```
        ```Dojo.find(3).destroy```

    2- Cree 3 dojos adicionales usando el comando Dojo.new.

        ```Dojo.new(name:"CodingDojo Silicon Valley", city:"Mountain View", state:"CA").save```
        ```Dojo.new(name:"CodingDojo Seattle", city:"Seattle", state:"WA").save```
        ```Dojo.new(name:"CodingDojo New York", city:"New York", state:"NY").save```


    3- Intente crear algunos dojos adicionales pero sin especificar algunos de los campos requeridos. Asegúrese que las validaciones están funcionando y que le devuelve los mensajes de error.
        
        ```dojo2 = Dojo.new(name:"CodingDojo Silicon Valley", state:"CA")```
        ```dojo2.errors.full_messages => ["City can't be blank"]```
    4- Cree 3 ninjas que pertenezcan al primer dojo que creó.

        ```Ninja.new(first_name:"Shinoda", last_name:"Ebisu", dojo: Dojo.first).save```
        ```Ninja.new(first_name:"Gekko", last_name:"Hayate", dojo: Dojo.first).save```
        ```Ninja.new(first_name:"Mitarashi", last_name:"Anko", dojo: Dojo.first).save```

        | id | first_name | last_name | dojo_id | created_at              | updated_at              |
        |----|------------|-----------|---------|-------------------------|-------------------------|
        | 1  | Shinoda    | Ebisu     | 4       | 2021-07-20 02:44:04 UTC | 2021-07-20 02:44:04 UTC |
        | 2  | Gekko      | Hayate    | 4       | 2021-07-20 02:44:10 UTC | 2021-07-20 02:44:10 UTC |
        | 3  | Mitarashi  | Anko      | 4       | 2021-07-20 02:44:15 UTC | 2021-07-20 02:44:15 UTC |

    5- Cree 3 ninjas más que pertenezcan al segundo dojo que creó.

        ```Ninja.new(first_name:"Kabuto", last_name:"Yakushi", dojo: Dojo.second).save```
        ```Ninja.new(first_name:"Kakashi", last_name:"Hatake", dojo: Dojo.second).save```
        ```Ninja.new(first_name:"Iruka", last_name:"Umino", dojo: Dojo.second).save```

        | id | first_name | last_name | dojo_id | created_at              | updated_at              |
        |----|------------|-----------|---------|-------------------------|-------------------------|
        | 4  | Kabuto     | Yakushi   | 5       | 2021-07-20 02:49:25 UTC | 2021-07-20 02:49:25 UTC |
        | 5  | Kakashi    | Hatake    | 5       | 2021-07-20 02:49:31 UTC | 2021-07-20 02:49:31 UTC |
        | 6  | Iruka      | Umino     | 5       | 2021-07-20 02:49:37 UTC | 2021-07-20 02:49:37 UTC |

    6- Cree 3 ninjas más que pertenezcan al tercer dojo que creó.

        ```Ninja.new(first_name:"Genma", last_name:"Shiranui", dojo: Dojo.third).save```
        ```Ninja.new(first_name:"Izumo", last_name:"Kamizuki", dojo: Dojo.third).save```
        ```Ninja.new(first_name:"Ibiki", last_name:"Morino", dojo: Dojo.third).save```

        | id | first_name | last_name | dojo_id | created_at              | updated_at              |
        |----|------------|-----------|---------|-------------------------|-------------------------|
        | 7  | Genma      | Shiranui  | 6       | 2021-07-20 02:51:27 UTC | 2021-07-20 02:51:27 UTC |
        | 8  | Izumo      | Kamizuki  | 6       | 2021-07-20 02:51:37 UTC | 2021-07-20 02:51:37 UTC |
        | 9  | Ibiki      | Morino    | 6       | 2021-07-20 02:51:43 UTC | 2021-07-20 02:51:43 UTC |

    7- Asegúrate de entender cómo obtener todos los ninjas para cualquier dojo (ej. obtener todos los ninjas para el primer dojo, segundo dojo, etc).

        ```Dojo.first.ninjas```

        | id | first_name | last_name | dojo_id | created_at              | updated_at              |
        |----|------------|-----------|---------|-------------------------|-------------------------|
        | 1  | Shinoda    | Ebisu     | 4       | 2021-07-20 02:44:04 UTC | 2021-07-20 02:44:04 UTC |
        | 2  | Gekko      | Hayate    | 4       | 2021-07-20 02:44:10 UTC | 2021-07-20 02:44:10 UTC |
        | 3  | Mitarashi  | Anko      | 4       | 2021-07-20 02:44:15 UTC | 2021-07-20 02:44:15 UTC |

        ```Dojo.second.ninjas```

        | id | first_name | last_name | dojo_id | created_at              | updated_at              |
        |----|------------|-----------|---------|-------------------------|-------------------------|
        | 4  | Kabuto     | Yakushi   | 5       | 2021-07-20 02:49:25 UTC | 2021-07-20 02:49:25 UTC |
        | 5  | Kakashi    | Hatake    | 5       | 2021-07-20 02:49:31 UTC | 2021-07-20 02:49:31 UTC |
        | 6  | Iruka      | Umino     | 5       | 2021-07-20 02:49:37 UTC | 2021-07-20 02:49:37 UTC |

        ```Dojo.third.ninjas```

        | id | first_name | last_name | dojo_id | created_at              | updated_at              |
        |----|------------|-----------|---------|-------------------------|-------------------------|
        | 7  | Genma      | Shiranui  | 6       | 2021-07-20 02:51:27 UTC | 2021-07-20 02:51:27 UTC |
        | 8  | Izumo      | Kamizuki  | 6       | 2021-07-20 02:51:37 UTC | 2021-07-20 02:51:37 UTC |
        | 9  | Ibiki      | Morino    | 6       | 2021-07-20 02:51:43 UTC | 2021-07-20 02:51:43 UTC |

    8- ¿Cómo recuperar solo el nombre de los ninjas que pertenecen al segundo dojo y ordenar el resultado por created_at en orden descendiente?

        ```Dojo.second.ninjas.order('id desc').select('first_name')```

        | id | first_name |
        |----|------------|
        |    | Iruka      |
        |    | Kakashi    |
        |    | Kabuto     |

    9- Elimine el segundo dojo. ¿Cómo podrías ajustar tu modelo para que automáticamente elimine todos los ninjas asociados con ese dojo?
        Modificar dojo.rb:

            ```before_destroy :destroy_ninja
            ...
            ...
            has_many :ninjas, :dependent => :destroy

            def destroy_ninja
                Ninja.find_by(dojo: self).destroy
            end```

        Luego en consola:

            ```Dojo.second.destroy```
            ```Dojo.all```

            | id | name                      | city          | state | created_at              | updated_at              |
            |----|---------------------------|---------------|-------|-------------------------|-------------------------|
            | 4  | CodingDojo Silicon Valley | Mountain View | CA    | 2021-07-20 01:30:24 UTC | 2021-07-20 01:30:24 UTC |
            | 6  | CodingDojo New York       | New York      | NY    | 2021-07-20 01:30:40 UTC | 2021-07-20 01:30:40 UTC |            

            ```Ninja.all```

            | id | first_name | last_name | dojo_id | created_at              | updated_at              |
            |----|------------|-----------|---------|-------------------------|-------------------------|
            | 1  | Shinoda    | Ebisu     | 4       | 2021-07-20 02:44:04 UTC | 2021-07-20 02:44:04 UTC |
            | 2  | Gekko      | Hayate    | 4       | 2021-07-20 02:44:10 UTC | 2021-07-20 02:44:10 UTC |
            | 3  | Mitarashi  | Anko      | 4       | 2021-07-20 02:44:15 UTC | 2021-07-20 02:44:15 UTC |
            | 7  | Genma      | Shiranui  | 6       | 2021-07-20 02:51:27 UTC | 2021-07-20 02:51:27 UTC |
            | 8  | Izumo      | Kamizuki  | 6       | 2021-07-20 02:51:37 UTC | 2021-07-20 02:51:37 UTC |
            | 9  | Ibiki      | Morino    | 6       | 2021-07-20 02:51:43 UTC | 2021-07-20 02:51:43 UTC |


Asegúrate de sentirte complétamente cómodo utilizando .all, .valid?, .where, .order, .limit, .save, .create, .errors y los otros métodos que vimos en el video.
