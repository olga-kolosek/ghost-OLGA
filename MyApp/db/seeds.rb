# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(name: :admin)
Role.create(name: :author)
Role.create(name: :editor)

user1 = User.create(
					email: 'admin@gmail.com',
					password: 'password1234',
					password_confirmation: 'password1234',
					role: 'admin')
user1.add_role(:admin)
user2 = User.create(
					email: 'author@gmail.com',
					password: 'password1234',
					password_confirmation: 'password1234', 
					role: 'author')
user2.add_role(:author)
user2 = User.create(
					email: 'editor@gmail.com',
					password: 'password1234',
					password_confirmation: 'password1234', 
					role: 'editor')
user2.add_role(:editor)
