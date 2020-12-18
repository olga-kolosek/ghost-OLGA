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
          password: 'password',
          password_confirmation: 'password',
          role: 'admin')
user1.add_role(:admin)
user2 = User.create(
          email: 'author@gmail.com',
          password: 'password',
          password_confirmation: 'password', 
          role: 'author')
user2.add_role(:author)
user2 = User.create(
          email: 'editor@gmail.com',
          password: 'password',
          password_confirmation: 'password', 
          role: 'editor')
user2.add_role(:editor)

story1 = Story.create(title: 'First story',
                      content: 'This is the content of the first story by AUTHOR',
                      user_id: 2)
story2 = Story.create(title: 'Second story',
                      content: 'This is the content of the second story by AUTHOR',
                      user_id: 2)
story3 = Story.create(title: 'Third story',
                      content: 'This is the content of the third story by AUTHOR',
                      user_id: 2)