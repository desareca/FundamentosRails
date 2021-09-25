# Polimorfismo

Vamos a agregar otro modelo (Comentario) a nuestra actividad Blogs/Publicaciones/Mensajes. Digamos que queremos permitir a los usuarios dejar comentarios ya sea para un usuario, un blog, una publicación o un mensaje. En lugar de crear una nueva tabla Comentario para cada elemento (ej. usuario_comentarios, blog_comentarios, publicacion_comentario, mensaje_comentarios), solo necesitamos crear una simple tabla comentarios que especifique para cuál modelo/tabla (usuario, blog, publicacion, mensaje) es el comentario.

Agregue un nuevo modelo para la actividad anterior donde ahora el modelo llamado Comentario puede tener comentarios para un usuario, un blog, una publicación o un mensaje.

~~~
rails g model Comment content_comm:string comm:references{polymorphic}

rake db:migrate
~~~

```rake db:migrate:status```

| Status | Migration ID    | Migration Name  |
|--------|-----------------|-----------------|
|   up   |  20210723032426 | Create blogs    |
|   up   |  20210723032432 | Create users    |
|   up   |  20210723032436 | Create posts    |
|   up   |  20210723032441 | Create owners   |
|   up   |  20210724231336 | Create messages |
|   up   |  20210725010301 | Create comments |


***app/models/comment.rb***
~~~
class Comment < ApplicationRecord
  belongs_to :comm, polymorphic: true
end
~~~

***app/models/blog.rb***
~~~
class Blog < ApplicationRecord
    has_many :owner
    has_many :user, through: :owner

    has_many :post
    has_many :user, through: :post

    has_many :comments, as: :comm

    validates :name, presence: true
end
~~~

***app/models/message.rb***
~~~
class Message < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_many :comments, as: :comm

  validates :author, presence: true
end
~~~

***app/models/owner.rb***
~~~
class Owner < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  has_many :comments, as: :comm
end
~~~

***app/models/post.rb***
~~~
class Post < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  has_many :message
  # has_many :user, through: :message

  has_many :comments, as: :comm

  validates :title, presence: true
end
~~~

***app/models/user.rb***
~~~
class User < ApplicationRecord
    has_many :owner
    has_many :blog, through: :owner

    has_many :post
    has_many :blog, through: :post

    has_many :message

    has_many :comments, as: :comm
    
    validates :first_name, :last_name, presence: true
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
~~~

Compruébelo utilizando la consola y asegúrate que te permite agregar, actualizar y eliminar  comentarios para un usuario, un blog, una publicación o un mensaje.

* Se crean 4 comentarios aleatorios:

  ~~~
  Comment.create(content_comm:"Numero aleatorio: #{rand(1..1000)}", comm: User.find(rand(1..User.all.length)))
  Comment.create(content_comm:"Numero aleatorio: #{rand(1..1000)}", comm: Blog.find(rand(1..Blog.all.length)))
  Comment.create(content_comm:"Numero aleatorio: #{rand(1..1000)}", comm: Post.find(rand(1..Post.all.length)))
  Comment.create(content_comm:"Numero aleatorio: #{rand(1..1000)}", comm: Message.find(rand(1..Message.all.length)))

  Comment.all
  ~~~

  | id | content_comm          | comm_type | comm_id | created_at              | updated_at              |
  |----|-----------------------|-----------|---------|-------------------------|-------------------------|
  | 1  | Numero aleatorio: 704 | User      | 4       | 2021-07-25 01:13:22 UTC | 2021-07-25 01:13:22 UTC |
  | 2  | Numero aleatorio: 446 | Blog      | 1       | 2021-07-25 01:13:23 UTC | 2021-07-25 01:13:23 UTC |
  | 3  | Numero aleatorio: 305 | Post      | 13      | 2021-07-25 01:13:24 UTC | 2021-07-25 01:13:24 UTC |
  | 4  | Numero aleatorio: 142 | Message   | 7       | 2021-07-25 01:13:24 UTC | 2021-07-25 01:13:24 UTC |


* Actualización de datos (segundo comentario):

  ~~~
  Comment.second.update(content_comm:"Actualización num aleatorio: #{rand(1..1000)}")

  Comment.all
  ~~~

  | id | content_comm                     | comm_type | comm_id | created_at              | updated_at              |
  |----|----------------------------------|-----------|---------|-------------------------|-------------------------|
  | 1  | Numero aleatorio: 704            | User      | 4       | 2021-07-25 01:13:22 UTC | 2021-07-25 01:13:22 UTC |
  | 2  | Actualización num aleatorio: 408 | Blog      | 1       | 2021-07-25 01:13:23 UTC | 2021-07-25 01:18:22 UTC |
  | 3  | Numero aleatorio: 305            | Post      | 13      | 2021-07-25 01:13:24 UTC | 2021-07-25 01:13:24 UTC |
  | 4  | Numero aleatorio: 142            | Message   | 7       | 2021-07-25 01:13:24 UTC | 2021-07-25 01:13:24 UTC |


* Eliminar registro (tercer comentario):

  ~~~
  Comment.third.delete

  Comment.all
  ~~~

  | id | content_comm                     | comm_type | comm_id | created_at              | updated_at              |
  |----|----------------------------------|-----------|---------|-------------------------|-------------------------|
  | 1  | Numero aleatorio: 704            | User      | 4       | 2021-07-25 01:13:22 UTC | 2021-07-25 01:13:22 UTC |
  | 2  | Actualización num aleatorio: 408 | Blog      | 1       | 2021-07-25 01:13:23 UTC | 2021-07-25 01:18:22 UTC |
  | 4  | Numero aleatorio: 142            | Message   | 7       | 2021-07-25 01:13:24 UTC | 2021-07-25 01:13:24 UTC |