# README

## Blogs/Publicaciones/Mensajes I

Empiece un nuevo proyecto y cree los modelos para el siguiente ERD. Esta es una aplicación que permite a las personas crear blogs, escribir publicaciones para cada blog y dejar mensajes para las publicaciones (post).

### blogs:

* id INT
* name VARCHAR(255)
* description TEXT
* created_at DATETIME
* updated_at DATETIME

### posts:

* id INT
* blog_id INT (FK)
* title VARCHAR(255)
* content TEXT
* created_at DATETIME
* updated_at DATETIME

### messages:

* id INT
* post_id INT (FK)
* author VARCHAR(255)
* message TEXT
* created_at DATETIME
* updated_at DATETIME

Cree los archivos migration así como los modelos para la aplicación anterior.

    ```rails new blog_pubs_msjes```

    En la carpeta blog_pubs_msjes:

    ```rails g scaffold Blog name:string description:text```
    ```rails g scaffold Post title:string content:text blog:references```
    ```rails g scaffold Message author:string message:text post:references```
    ```rake db:migrate```

    ```rake db:migrate:status```

    |Status|   Migration ID |   Migration Name|
    |------|----------------|-----------------|
    |up    | 20210721022100 | Create blogs    |
    |up    | 20210721022109 | Create posts    |
    |up    | 20210721022126 |Create messages  |

    En webpacker.yml (dejar compile en false):
        ```development:
        <<: *default
        compile: false #true```

    En app/views/layouts/application.html.erb:
        Eliminar linea 9:
        ```<%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>```

Implemente las siguientes validaciones:

1- Requerir el nombre y la descripción para el blog.

    En app/models/blog.rb : 
    ```has_many :posts```
    ```validates :name, :description, presence: true```

2- Requerir el título y el contenido de las publicaciones (post). El título tiene que ser de al menos 7 caracteres de longitud.

    En app/models/post.rb : 
    ```has_many :messages```
    ```validates :title, presence: true, length: { minimum: 7}```
    ```validates :content, presence: true```

3- Requerir el autor y el mensaje para los mensajes. El mensaje de tener al menos 15 caracteres de longitud.

    En app/models/message.rb : 
    ```validates :author, presence: true```
    ```validates :message, presence: true, length: { minimum: 15}```

Usando la consola:

1- Cree 5 nuevos blogs.

    ```Blog.new(name:"CodingDojo Blog", description:"Blog Principal de Coding Dojo").save```
    ```Blog.new(name:"Coding Ruby on Rails", description:"Blog sobre Ruby on Rails (RoR)").save```
    ```Blog.new(name:"Coding Python Django", description:"Blog sobre Python + Django").save```
    ```Blog.new(name:"Coding JavaScript", description:"Blog sobre JavaScript").save```
    ```Blog.new(name:"Coding HTML - CSS", description:"Blog sobre HTML y CSS").save```

    ```Blog.all```

    | id | name                 | description                    | created_at              | updated_at              |
    |----|----------------------|--------------------------------|-------------------------|-------------------------|
    | 1  | CodingDojo Blog      | Blog Principal de Coding Dojo  | 2021-07-21 02:23:21 UTC | 2021-07-21 02:23:21 UTC |
    | 2  | Coding Ruby on Rails | Blog sobre Ruby on Rails (RoR) | 2021-07-21 02:23:29 UTC | 2021-07-21 02:23:29 UTC |
    | 3  | Coding Python Django | Blog sobre Python + Django     | 2021-07-21 02:23:36 UTC | 2021-07-21 02:23:36 UTC |
    | 4  | Coding JavaScript    | Blog sobre JavaScript          | 2021-07-21 02:23:44 UTC | 2021-07-21 02:23:44 UTC |
    | 5  | Coding HTML - CSS    | Blog sobre HTML y CSS          | 2021-07-21 02:23:53 UTC | 2021-07-21 02:23:53 UTC |

2- Cree varias publicaciones para cada blog.

    Blog 1:

    ```Post.new(title:"Lenguajes de Programacion", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(1)).save```
    ```Post.new(title:"FrameWorks JS", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(1)).save```
    ```Post.new(title:"Full Stack Development", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(1)).save```

    ```Blog.find(1).posts```

    | id | title                     | content                                     | blog_id |         created_at      |        updated_at        |
    |----|---------------------------|---------------------------------------------|---------|-------------------------+--------------------------|
    | 1  | Lenguajes de Programacion | Lorem Ipsum is simply dummy text of the ... |    1    | 2021-07-21 02:25:16 UTC | 2021-07-21 02:25:16 UTC  |
    | 2  | FrameWorks JS             | Lorem Ipsum is simply dummy text of the ... |    1    | 2021-07-21 02:25:26 UTC | 2021-07-21 02:25:26 UTC  |
    | 3  | Full Stack Development    | Lorem Ipsum is simply dummy text of the ... |    1    | 2021-07-21 02:25:36 UTC | 2021-07-21 02:25:36 UTC  |


    Blog 2:

    ```Post.new(title:"Programación en Ruby I", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(2)).save```
    ```Post.new(title:"Programación en Ruby & Rails", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(2)).save```
    ```Post.new(title:"Rails Development", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(2)).save```

    ```Blog.find(2).posts```

    | id | title                        | content                                     | blog_id | created_at              | updated_at              |
    |----|------------------------------|---------------------------------------------|---------|-------------------------|-------------------------|
    | 4  | Programación en Ruby I       | Lorem Ipsum is simply dummy text of the ... |    2    | 2021-07-21 02:38:03 UTC | 2021-07-21 02:38:03 UTC |
    | 5  | Programación en Ruby & Rails | Lorem Ipsum is simply dummy text of the ... |    2    | 2021-07-21 02:38:10 UTC | 2021-07-21 02:38:10 UTC |
    | 6  | Rails Development            | Lorem Ipsum is simply dummy text of the ... |    2    | 2021-07-21 02:38:18 UTC | 2021-07-21 02:38:18 UTC |


    Blog 3:

    ```Post.new(title:"Programación en Python", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(3)).save```
    ```Post.new(title:"Introducción a Python/Djamgo", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(3)).save```
    ```Post.new(title:"Desarrollo con Django", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(3)).save```

    ```Blog.find(3).posts```

    | id | title                        | content                                     | blog_id | created_at              | updated_at              |
    |----|------------------------------|---------------------------------------------|---------|-------------------------|-------------------------|
    | 7  | Programación en Python       | Lorem Ipsum is simply dummy text of the ... |    3    | 2021-07-21 03:04:20 UTC | 2021-07-21 03:04:20 UTC |
    | 8  | Introducción a Python/Djamgo | Lorem Ipsum is simply dummy text of the ... |    3    | 2021-07-21 03:04:28 UTC | 2021-07-21 03:04:28 UTC |
    | 9  | Desarrollo con Django        | Lorem Ipsum is simply dummy text of the ... |    3    | 2021-07-21 03:04:34 UTC | 2021-07-21 03:04:34 UTC |


    Blog 4:

    ```Post.new(title:"Fundamentos de Javascript", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(4)).save```
    ```Post.new(title:"Introducción a JQuery", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(4)).save```
    ```Post.new(title:"API & AJAX", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(4)).save```

    ```Blog.find(4).posts```

    | id | title                     | content                                     | blog_id | created_at              | updated_at              |
    |----|---------------------------|---------------------------------------------|---------|-------------------------|-------------------------|
    | 10 | Fundamentos de Javascript | Lorem Ipsum is simply dummy text of the ... |    4    | 2021-07-21 03:09:39 UTC | 2021-07-21 03:09:39 UTC |
    | 11 | Introducción a JQuery     | Lorem Ipsum is simply dummy text of the ... |    4    | 2021-07-21 03:09:49 UTC | 2021-07-21 03:09:49 UTC |
    | 12 | API & AJAX                | Lorem Ipsum is simply dummy text of the ... |    4    | 2021-07-21 03:09:56 UTC | 2021-07-21 03:09:56 UTC |


    Blog 5:

    ```Post.new(title:"Introducción a HTML", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(5)).save```
    ```Post.new(title:"Introducción a CSS", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(5)).save```
    ```Post.new(title:"Bootstrap", content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", blog:Blog.find(5)).save```

    ```Blog.find(5).posts```

    | id | title               | content                                     | blog_id | created_at              | updated_at              |
    |----|---------------------|---------------------------------------------|---------|-------------------------|-------------------------|
    | 13 | Introducción a HTML | Lorem Ipsum is simply dummy text of the ... |    5    | 2021-07-21 03:15:35 UTC | 2021-07-21 03:15:35 UTC |
    | 14 | Introducción a CSS  | Lorem Ipsum is simply dummy text of the ... |    5    | 2021-07-21 03:15:41 UTC | 2021-07-21 03:15:41 UTC |
    | 15 | Bootstrap           | Lorem Ipsum is simply dummy text of the ... |    5    | 2021-07-21 03:15:48 UTC | 2021-07-21 03:15:48 UTC |

3- Cree varios mensajes para la primera publicación.

    ```Message.new(author: "Marco Alvarado", message: "En C puedes hacer cualquier cosa con la máquina. Puede danzar, recitar...", post:Post.first).save```
    ```Message.new(author: "Wilbert Frias", message: "En Java hay demasiadas clases, construir una gui es un dolor de cabeza...", post:Post.first).save```
    ```Message.new(author: "Luis Masuelli", message: "No, para nada. Primero que nada, cuando querés aprender a programar en ...", post:Post.first).save```
    ```Message.new(author: "César Rincón", message: "Linus Torvalds piensa que Java y C++ son lenguajes de programación ...", post:Post.first).save```
    ```Message.new(author: "Javy Rodriguez", message: "Estará presente por mucho tiempo, es un estándar de la industria ...", post:Post.first).save```

    ```Message.all```

    | id | author         | message                                                                  | post_id | created_at              | updated_at              |
    |----|----------------|--------------------------------------------------------------------------|---------|-------------------------|-------------------------|
    | 1  | Marco Alvarado | En C puedes hacer cualquier cosa con la máquina. Puede danzar, recita... |    1    | 2021-07-21 03:28:42 UTC | 2021-07-21 03:28:42 UTC |
    | 2  | Wilbert Frias  | En Java hay demasiadas clases, construir una gui es un dolor de cabez... |    1    | 2021-07-21 03:28:48 UTC | 2021-07-21 03:28:48 UTC |
    | 3  | Luis Masuelli  | No, para nada. Primero que nada, cuando querés aprender a programar e... |    1    | 2021-07-21 03:28:55 UTC | 2021-07-21 03:28:55 UTC |
    | 4  | César Rincón   | Linus Torvalds piensa que Java y C++ son lenguajes de programación ...   |    1    | 2021-07-21 03:29:02 UTC | 2021-07-21 03:29:02 UTC |
    | 5  | Javy Rodriguez | Estará presente por mucho tiempo, es un estándar de la industria ...     |    1    | 2021-07-21 03:29:08 UTC | 2021-07-21 03:29:08 UTC |    


4- Obtener todas las publicaciones para el primer blog.

    ```Blog.first.posts```

    | id | title                     | content                                     | blog_id |         created_at      |        updated_at        |
    |----|---------------------------|---------------------------------------------|---------|-------------------------+--------------------------|
    | 1  | Lenguajes de Programacion | Lorem Ipsum is simply dummy text of the ... |    1    | 2021-07-21 02:25:16 UTC | 2021-07-21 02:25:16 UTC  |
    | 2  | FrameWorks JS             | Lorem Ipsum is simply dummy text of the ... |    1    | 2021-07-21 02:25:26 UTC | 2021-07-21 02:25:26 UTC  |
    | 3  | Full Stack Development    | Lorem Ipsum is simply dummy text of the ... |    1    | 2021-07-21 02:25:36 UTC | 2021-07-21 02:25:36 UTC  |

5- Obtener todas las publicaciones para el último blog (ordenadas por titulo en orden descendiente).

    ```Blog.last.posts.order("title desc")```

    | id | title               | content                                     | blog_id | created_at              | updated_at              |
    |----|---------------------|---------------------------------------------|---------|-------------------------|-------------------------|
    | 13 | Introducción a HTML | Lorem Ipsum is simply dummy text of the ... |    5    | 2021-07-21 03:15:35 UTC | 2021-07-21 03:15:35 UTC |
    | 14 | Introducción a CSS  | Lorem Ipsum is simply dummy text of the ... |    5    | 2021-07-21 03:15:41 UTC | 2021-07-21 03:15:41 UTC |
    | 15 | Bootstrap           | Lorem Ipsum is simply dummy text of the ... |    5    | 2021-07-21 03:15:48 UTC | 2021-07-21 03:15:48 UTC |

6- Actualizar el título de la primera publicación.

    ```post1 = Post.first```
    ```post1.title => "Lenguajes de Programacion"```
    ```post1.title = "Lenguajes Más Utilizados"```
    ```post1.save```
    ```Post.first.title => "Lenguajes Más Utilizados"```

7- Eliminar la tercera publicación (haga que el modelo borre automáticamente todos los mensajes asociados con la tercera publicación cuando la elimines).

    Modificar app/models/post.rb por lo siguiente:

    ```class Post < ApplicationRecord
            belongs_to :blog
            before_destroy :destroy_msg

            validates :title, presence: true, length: { minimum: 7}
            validates :content, presence: true

            has_many :messages, :dependent => :destroy
        end

        def destroy_msg
            if Message.find_by(post: self)==nil
                true
            else
                Message.find_by(post: self).destroy
            end
        end
    ```
    
    Luego en consola:

        ```Post.third.destroy```

        ```   Post Load (1.6ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT ? OFFSET ?  [["LIMIT", 1], ["OFFSET", 2]]
        (0.2ms)  begin transaction```
        ```  Message Load (0.1ms)  SELECT "messages".* FROM "messages" WHERE "messages"."post_id" = ? LIMIT ?  [["post_id", 3], ["LIMIT", 1]]
        Message Load (0.1ms)  SELECT "messages".* FROM "messages" WHERE "messages"."post_id" = ?  [["post_id", 3]]
        Post Destroy (8.3ms)  DELETE FROM "posts" WHERE "posts"."id" = ?  [["id", 3]]
        (11.0ms)  commit transaction```

        ```Post.limit(4)```

        | id | title                        | content                                                    | blog_id | created_at              | updated_at              |
        |----|------------------------------|------------------------------------------------------------|---------|-------------------------|-------------------------|
        | 1  | Lenguajes Más Utilizados     | Lorem Ipsum is simply dummy text of the printing and ty... |    1    | 2021-07-21 02:25:16 UTC | 2021-07-21 03:39:52 UTC |
        | 2  | FrameWorks JS                | Lorem Ipsum is simply dummy text of the printing and ty... |    1    | 2021-07-21 02:25:26 UTC | 2021-07-21 02:25:26 UTC |
        | 4  | Programación en Ruby I       | Lorem Ipsum is simply dummy text of the printing and ty... |    2    | 2021-07-21 02:38:03 UTC | 2021-07-21 02:38:03 UTC |
        | 5  | Programación en Ruby & Rails | Lorem Ipsum is simply dummy text of the printing and ty... |    2    | 2021-07-21 02:38:10 UTC | 2021-07-21 02:38:10 UTC |


8- Obtener todos los blog.

    ```Blog.all```

    | id | name                 | description                    | created_at              | updated_at              |
    |----|----------------------|--------------------------------|-------------------------|-------------------------|
    | 1  | CodingDojo Blog      | Blog Principal de Coding Dojo  | 2021-07-21 02:23:21 UTC | 2021-07-21 02:23:21 UTC |
    | 2  | Coding Ruby on Rails | Blog sobre Ruby on Rails (RoR) | 2021-07-21 02:23:29 UTC | 2021-07-21 02:23:29 UTC |
    | 3  | Coding Python Django | Blog sobre Python + Django     | 2021-07-21 02:23:36 UTC | 2021-07-21 02:23:36 UTC |
    | 4  | Coding JavaScript    | Blog sobre JavaScript          | 2021-07-21 02:23:44 UTC | 2021-07-21 02:23:44 UTC |
    | 5  | Coding HTML - CSS    | Blog sobre HTML y CSS          | 2021-07-21 02:23:53 UTC | 2021-07-21 02:23:53 UTC |

9- Obtener todos los blog con id menor a 5.

    ```Blog.where("id < 5")```

    | id | name                 | description                    | created_at              | updated_at              |
    |----|----------------------|--------------------------------|-------------------------|-------------------------|
    | 1  | CodingDojo Blog      | Blog Principal de Coding Dojo  | 2021-07-21 02:23:21 UTC | 2021-07-21 02:23:21 UTC |
    | 2  | Coding Ruby on Rails | Blog sobre Ruby on Rails (RoR) | 2021-07-21 02:23:29 UTC | 2021-07-21 02:23:29 UTC |
    | 3  | Coding Python Django | Blog sobre Python + Django     | 2021-07-21 02:23:36 UTC | 2021-07-21 02:23:36 UTC |
    | 4  | Coding JavaScript    | Blog sobre JavaScript          | 2021-07-21 02:23:44 UTC | 2021-07-21 02:23:44 UTC |
