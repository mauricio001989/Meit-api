# Create user of rols
user1 = User.create(name: 'Maucicio Vasques', email: 'Mauro@hotmail.com',
                    password: '12345678', password_confirmation: '12345678')

user2 = User.create(name: 'Camilo Aldana ', email: 'camilo@hotmail.com',
                    password: '12345678', password_confirmation: '12345678')

# Create Concerts
concert = Concert.create(name: 'Bon Jovi', city: 'Medellin')

Comment.create(user: user1, concert: concert, comment: 'hll')
Comment.create(user: user2, concert: concert, comment: 'hll')
