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
10.times do |i|
	i = i + 1
	User.create!([	id: i ,nick: "nick_player"+i.to_s, password: "coso123", password_confirmation: "coso123", 
						  nombre: "nombre"+i.to_s, apellido: "apellido"+i.to_s, nacimiento: "12-12-1990", 
						  email: "email_player"+i.to_s+"@email.com", descripcion: "desc", role: "player"])
end

5.times do |i|
	i = i + 1
	User.create!([	id: i+10 ,nick: "nick_owner"+i.to_s, password: "coso123", password_confirmation: "coso123", 
						  nombre: "nombre"+i.to_s, apellido: "apellido"+i.to_s, nacimiento: "12-12-1990", 
						  email: "email_owner"+i.to_s+"@email.com", descripcion: "desc", role: "local_owner"])
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
Relationship.create([follower_id: 8, followed_id: 9])

puts 'cargo locales'
3.times do |i|
	Local.create!([nombre: "Local_"+(i+1).to_s , user_id: 11+i, barrio: "barrio", direccion: "direccion", 
							telefono: "12346789", email: "email@email.com", opens: "17", closes: "23" ])
	#creo una cancha en el local

	Court.create!([local_id: i+1, court_type: "F5", precio: "150"])
	i = i+1
end

puts 'cargo partidos'

5.times do |i|
	i = i + 1
	Partido.create!([user_id: i , local_id: ((i/3)+1), court_id: 1, fecha: "25-12-2018 12:00"])
end

puts 'cargo anotados'

10.times do |i|
	Anotado.create!([user_id: i+1, partido_id: 2, aceptado: true])
	i = i + 1
end

puts 'Finish loading data'
