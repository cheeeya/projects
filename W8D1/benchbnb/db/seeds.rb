# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create({ username: 'test', password: 'password'})
Bench.create({ description: 'Sandler Neuroscience Bench', lat: 37.769271, lng: -122.392270 })
Bench.create({ description: 'Spark Social Bench', lat: 37.770687, lng: -122.391433 })
Bench.create({ description: 'DNA Lounge Bench', lat: 37.771045, lng: -122.412828 })
Bench.create({ description: 'Golden Gate Park Bench', lat: 37.770910, lng: -122.465711 })
