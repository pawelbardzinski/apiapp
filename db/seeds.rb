# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'myemail1@test.com', password: '12345678', auth_token: Devise.friendly_token)
User.create(email: 'myemail2@test.com', password: '12345678', auth_token: Devise.friendly_token)
User.create(email: 'myemail3@test.com', password: '12345678', auth_token: Devise.friendly_token)

List.create(title: 'list 1', description: 'description for list 1', user_id: 1)
List.create(title: 'list 2', description: 'description for list 2', user_id: 1)
List.create(title: 'list 3', description: 'description for list 3', user_id: 1)
List.create(title: 'list 4', description: 'description for list 4', user_id: 2)
List.create(title: 'list 5', description: 'description for list 5', user_id: 2)
List.create(title: 'list 6', description: 'description for list 6', user_id: 2)
List.create(title: 'list 7', description: 'description for list 7', user_id: 3)
List.create(title: 'list 8', description: 'description for list 8', user_id: 3)
List.create(title: 'list 9', description: 'description for list 9', user_id: 3)

Item.create(title: 'item 1', state: 'undone', list_id: 1)
Item.create(title: 'item 2', state: 'undone', list_id: 2)
Item.create(title: 'item 3', state: 'done', list_id: 3)
Item.create(title: 'item 4', state: 'undone', list_id: 4)
Item.create(title: 'item 5', state: 'done', list_id: 5)
Item.create(title: 'item 6', state: 'undone', list_id: 6)
Item.create(title: 'item 7', state: 'done', list_id: 7)
Item.create(title: 'item 8', state: 'undone', list_id: 8)
Item.create(title: 'item 9', state: 'undone', list_id: 9)
Item.create(title: 'item 10', state: 'done', list_id: 1)
Item.create(title: 'item 11', state: 'undone', list_id: 5)
Item.create(title: 'item 12', state: 'undone', list_id: 7)
