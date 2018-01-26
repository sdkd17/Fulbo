# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# :nick, :password, :password_confirmation, :nombre, :apellido, :nacimiento, :email, :descripcion)
puts 'start loading data'

puts 'Cargo usuarios...'
15.times do |i|
	i = i + 1
	User.create!([	id: i ,nick: "nick"+i.to_s, password: "coso123", password_confirmation: "coso123", 
						  nombre: "nombre"+i.to_s, apellido: "apellido"+i.to_s, nacimiento: "12-12-1990", 
						  email: "email"+i.to_s+"@email.com", descripcion: "desc"])
end

puts 'cargo seguidores...'

Relationship.create([follower_id: 1, followed_id: 2])
Relationship.create([follower_id: 1, followed_id: 3])
Relationship.create([follower_id: 1, followed_id: 4])
Relationship.create([follower_id: 4, followed_id: 2])
Relationship.create([follower_id: 4, followed_id: 3])
Relationship.create([follower_id: 6, followed_id: 7])
Relationship.create([follower_id: 6, followed_id: 8])
Relationship.create([follower_id: 9, followed_id: 8])
Relationship.create([follower_id: 10, followed_id: 11])


puts 'cargo partidos'

5.times do |i|
	i = i + 1
	Partido.create!([user_id: i , lugar: "lugar" + i.to_s, fecha: "25-12-2018 12:00"])
end

puts 'Finish loading data'
