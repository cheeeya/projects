# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ username: 'johntheartist' }])
User.create([{ username: 'bobbybob' }])
User.create([{ username: 'chubaga' }])

Artwork.create([{ title: 'Chubacca', image_url: 'chubacca.jpg', artist_id: '3' }])
Artwork.create([{ title: 'bob', image_url: 'bob.jpg', artist_id: '2' }])
Artwork.create([{ title: 'johnny', image_url: 'johnny.jpg', artist_id: '1' }])
Artwork.create([{ title: 'han', image_url: 'hansolo.jpg', artist_id: '3' }])
