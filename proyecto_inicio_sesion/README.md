# README

Cree un nuevo proyecto llamado 'proyecto_inicio_sesion'.

Un recordatorio más, asegúrate de cambiar tu archivo Gemfile de Rails y la gema sqlite3 a las versiones correctas en tus proyectos. Luego nesitarás ejecutar el comando bundle install para poder actualizar tu aplicación.

Crea un nuevo modelo llamado 'Usuario' que tenga los siguientes atributos/campos:

* id INT
* first_name VARCHAR(255)
* last_name VARCHAR(255)
* email_address VARCHAR(255)
* age INT
* created_at DATETIME
* updated_at DATETIME

Por favor haz lo siguiente:

* Cree un nuevo proyecto usando el comando rails new proyecto_inicio_sesion.
    
    ```rails g new proyecto_inicio_sesion```
* Cree un nuevo modelo llamado 'Usuario' con la información anterior.
    
    ```rails g model Usuario first_name:string last_name:string email_address:string age:integer```
    ```rake db:migrate```

* Rails inmediatamente creará el campo ID como clave primaria, que se incrementa automáticamente así como las marcas de tiempo created_at  y updated_at.
* Cree algunos registros en la tabla usuarios utilizando la consola de Rails.
    
    ```Usuario.create(first_name:"Ed", last_name:"Stark", email_address:"ed_stark@gmail.com", age:35)```
    ```Usuario.create(first_name:"Robert", last_name:"Baratheon ", email_address:"robB@yahoo.com", age:36)```
    ```Usuario.create(first_name:"Jaime", last_name:"Lannister", email_address:"jLannister@gmail.com", age:43)```
    ```Usuario.create(first_name:"Catelyn", last_name:"Stark", email_address:"cat_stark@gmail.com", age:35)```
    ```Usuario.create(first_name:"Cersei", last_name:"Lannister", email_address:"cersei.lannister@yahoo.com", age:43)```
    ```Usuario.create(first_name:"Daenerys", last_name:"Targaryen", email_address:"TarDaen@hotmail.com", age:16)```
    ```Usuario.create(first_name:"Jon", last_name:"Snow", email_address:"snowthewall@gmail.com", age:17)```

* Ahora, agregue algunas validaciones al modelo para que:
    1- Requiera los cuatro campos.
    2- La edad tiene que ser numérica.
    3- El nombre y el apellido deben tener una longitud mínima de 2 caracteres cada uno.
    4- La edad tiene que estar entre 10 y 150 (consulte http://apidock.com/rails/ActiveModel/Validations/HelperMethods/validates_numericality_of para obtener ayuda)
* Estás familiarizado con .save  y  .valid?
* Utilice .errors  y  .errors.full_messages para que pueda ver o mostrar los mensajes de error cuando fallen las validaciones.
* Usando la consola de Rails...
    1- Verifique si le permite ingresar algunos registro que no cumplan con las reglas de validación que establecimos (ej. trate de crear un registro don la edad sea 5 ó mayor a 150 ó donde el nombre sea solo 1 caracter, etc.).
    
        ```usuario1 = Usuario.new(first_name:"w", last_name:"j", age:5)```
        ```=> ["First name is too short (minimum is 2 characters)", "Last name is too short (minimum is 2 characters)", "Email address can't be blank", "Age must be greater than 10"]```
        ```usuario2 = Usuario.new(first_name:"w", last_name:"j", age:205)```
        ```=> ["First name is too short (minimum is 2 characters)", "Last name is too short (minimum is 2 characters)", "Email address can't be blank", "Age must be less than 150"]```

    2- Asegúrate que tu consola devuelva los mensaje de error apropiados cuando intentas guardar un registro que no cumple con las reglas de validación.
    
        ```usuario1.save => false```
        ```usuario2.save => false```

    3- Consultar todos los usuarios.
    
        ```Usuario.all```
        ```Usuario Load (2.4ms)  SELECT "usuarios".* FROM "usuarios"```
        
        | id | first_name | last_name  | email_address              | age | created_at              | updated_at              |
        |----|------------|------------|----------------------------|-----|-------------------------|-------------------------|
        | 1  | Ed         | Stark      | ed_stark@gmail.com         | 35  | 2021-07-18 22:52:32 UTC | 2021-07-18 22:52:32 UTC |
        | 2  | Robert     | Baratheon  | robB@yahoo.com             | 36  | 2021-07-18 22:52:40 UTC | 2021-07-18 22:52:40 UTC |
        | 3  | Jaime      | Lannister  | jLannister@gmail.com       | 43  | 2021-07-18 22:52:48 UTC | 2021-07-18 22:52:48 UTC |
        | 4  | Catelyn    | Stark      | cat_stark@gmail.com        | 35  | 2021-07-18 22:52:55 UTC | 2021-07-18 22:52:55 UTC |
        | 5  | Cersei     | Lannister  | cersei.lannister@yahoo.com | 43  | 2021-07-18 22:53:02 UTC | 2021-07-18 22:53:02 UTC |
        | 6  | Daenerys   | Targaryen  | TarDaen@hotmail.com        | 16  | 2021-07-18 22:53:11 UTC | 2021-07-18 22:53:11 UTC |
        | 7  | Jon        | Snow       | snowthewall@gmail.com      | 17  | 2021-07-18 22:53:20 UTC | 2021-07-18 22:53:20 UTC |
        

    4- Consultar el primer usuario.
    
        ```Usuario.first```
        ```Usuario Load (2.4ms)  SELECT "usuarios".* FROM "usuarios" ORDER BY "usuarios"."id" ASC LIMIT ?  [["LIMIT", 1]]```
        
        | id | first_name | last_name | email_address      | age | created_at              | updated_at              |
        |----|------------|-----------|--------------------|-----|-------------------------|-------------------------|
        | 1  | Ed         | Stark     | ed_stark@gmail.com | 35  | 2021-07-18 22:52:32 UTC | 2021-07-18 22:52:32 UTC |

    5- Consultar el último usuario.
    
        ```Usuario.last```
        ```Usuario Load (2.4ms)  SELECT "usuarios".* FROM "usuarios" ORDER BY "usuarios"."id" DESC LIMIT ?  [["LIMIT", 1]]```
        
        | id | first_name | last_name | email_address         | age | created_at              | updated_at              |
        |----|------------|-----------|-----------------------|-----|-------------------------|-------------------------|
        | 7  | Jon        | Snow      | snowthewall@gmail.com | 17  | 2021-07-18 22:53:20 UTC | 2021-07-18 22:53:20 UTC |
        
    6- Consultar todos los usuarios ordenados por el primer nombre (consulte las reglas para ordenar y más en  http://guides.rubyonrails.org/active_record_querying.html#ordering)
    
        ```Usuario.all.order('first_name')```
        ```Usuario Load (2.5ms)  SELECT "usuarios".* FROM "usuarios" ORDER BY first_name```
        
        | id | first_name | last_name  | email_address              | age | created_at              | updated_at              |
        |----|------------|------------|----------------------------|-----|-------------------------|-------------------------|
        | 4  | Catelyn    | Stark      | cat_stark@gmail.com        | 35  | 2021-07-18 22:52:55 UTC | 2021-07-18 22:52:55 UTC |
        | 5  | Cersei     | Lannister  | cersei.lannister@yahoo.com | 43  | 2021-07-18 22:53:02 UTC | 2021-07-18 22:53:02 UTC |
        | 6  | Daenerys   | Targaryen  | TarDaen@hotmail.com        | 16  | 2021-07-18 22:53:11 UTC | 2021-07-18 22:53:11 UTC |
        | 1  | Ed         | Stark      | ed_stark@gmail.com         | 35  | 2021-07-18 22:52:32 UTC | 2021-07-18 22:52:32 UTC |
        | 3  | Jaime      | Lannister  | jLannister@gmail.com       | 43  | 2021-07-18 22:52:48 UTC | 2021-07-18 22:52:48 UTC |
        | 7  | Jon        | Snow       | snowthewall@gmail.com      | 17  | 2021-07-18 22:53:20 UTC | 2021-07-18 22:53:20 UTC |
        | 2  | Robert     | Baratheon  | robB@yahoo.com             | 36  | 2021-07-18 22:52:40 UTC | 2021-07-18 22:52:40 UTC |

    7- Consultar el registro de usuario cuyo id es 3 y cambiar el apellido por otro valor. Haz esto directamente en la consola utilizando .find  y  .save.
    
        ```Usuario.find(3)```
        
        | id | first_name | last_name | email_address        | age | created_at              | updated_at              |
        |----|------------|-----------|----------------------|-----|-------------------------|-------------------------|
        | 3  | Jaime      | Lannister | jLannister@gmail.com | 43  | 2021-07-18 22:52:48 UTC | 2021-07-18 22:52:48 UTC |
        
        ```usuario3 = Usuario.find(3)```
        ```usuario3.last_name = 'Sand'```
        ```usuario3.save```
        ```Usuario.find(3)```
        
        | id | first_name | last_name | email_address        | age | created_at              | updated_at              |
        |----|------------|-----------|----------------------|-----|-------------------------|-------------------------|
        | 3  | Jaime      | Sand      | jLannister@gmail.com | 43  | 2021-07-18 22:52:48 UTC | 2021-07-18 23:23:52 UTC |

    8- Elimine el registro de usuario cuyo id es 4 (utilice algo como Usuario.find(2).destroy...).
        
        ```Usuario.find(4).destroy```
        ```Usuario.all```
        
        | id | first_name | last_name  | email_address              | age | created_at              | updated_at              |
        |----|------------|------------|----------------------------|-----|-------------------------|-------------------------|
        | 1  | Ed         | Stark      | ed_stark@gmail.com         | 35  | 2021-07-18 22:52:32 UTC | 2021-07-18 22:52:32 UTC |
        | 2  | Robert     | Baratheon  | robB@yahoo.com             | 36  | 2021-07-18 22:52:40 UTC | 2021-07-18 22:52:40 UTC |
        | 3  | Jaime      | Sand       | jLannister@gmail.com       | 43  | 2021-07-18 22:52:48 UTC | 2021-07-18 23:23:52 UTC |
        | 5  | Cersei     | Lannister  | cersei.lannister@yahoo.com | 43  | 2021-07-18 22:53:02 UTC | 2021-07-18 22:53:02 UTC |
        | 6  | Daenerys   | Targaryen  | TarDaen@hotmail.com        | 16  | 2021-07-18 22:53:11 UTC | 2021-07-18 22:53:11 UTC |
        | 7  | Jon        | Snow       | snowthewall@gmail.com      | 17  | 2021-07-18 22:53:20 UTC | 2021-07-18 22:53:20 UTC |
