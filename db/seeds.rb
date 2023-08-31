# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

restaurants = [
  { id: 1, name: 'Restaurante Alpha'},
  { id: 2, name: 'Restaurante Beta'}
]

Restaurant.create(restaurants)

devices = [
  { id: 1, name: 'Impresora', status: true, restaurant_id: 1},
  { id: 2, name: 'Servidor web', status: true, restaurant_id: 1},
  { id: 3, name: 'Servidor de base de datos', status: true, restaurant_id: 1},
  { id: 4, name: 'Impresora', status: true, restaurant_id: 2},
  { id: 5, name: 'Servidor web', status: true, restaurant_id: 2},
  { id: 6, name: 'Servidor de base de datos', status: true, restaurant_id: 2}
]

Device.create(devices)