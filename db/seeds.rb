# Elimina todos los registros existentes para evitar duplicados
Post.delete_all
User.delete_all
Tag.delete_all

# Crear usuarios con Devise
ex = User.create!(name: 'Example', email: 'example@example.com', password: 'password', password_confirmation: 'password')
jm = User.create!(name: 'John McEnrow', email: 'jmcenrow@example.com', password: 'password', password_confirmation: 'password')
pg = User.create!(name: 'Peter Gabriel', email: 'pgabriel@example.com', password: 'password', password_confirmation: 'password')
pg = User.create!(name: 'Lukas Wolff', email: 'lwolff@miuandes.cl', password: '12344478', password_confirmation: '12344478')

# Crear etiquetas
t1 = Tag.create!(name: 'compsci')
t2 = Tag.create!(name: 'study')
t3 = Tag.create!(name: 'python')
t4 = Tag.create!(name: 'ruby')

# Crear publicaciones
p1 = Post.create!(title: 'Python es el mejor lenguaje', content: 'Bla bla bla', published_at: Time.now, user: ex, answers_count: 0, likes_count: 0)
p2 = Post.create!(title: 'Ruby es el mejor lenguaje', content: 'Bla bla bla', published_at: Time.now, user: pg, answers_count: 0, likes_count: 0)

# Asociar publicaciones y etiquetas
PostsTag.create!(post: p1, tag: t1)
PostsTag.create!(post: p1, tag: t3)
PostsTag.create!(post: p2, tag: t4)
PostsTag.create!(post: p2, tag: t2)
