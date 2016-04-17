# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed Users:
User.create(username: "Admin", email: "admin@finance.cloud", password: "adminadmin", rank: 999)
User.create(username: "Moderator", email: "modo@finance.cloud", password: "modomodo", rank: 1)
User.create(username: "User", email: "user@finance.cloud", password: "useruser", rank: 0)
User.create(username: "User1", email: "user1@finance.cloud", password: "useruser", rank: 0)
User.create(username: "User2", email: "user2@finance.cloud", password: "useruser", rank: 0)
User.create(username: "User3", email: "user3@finance.cloud", password: "useruser", rank: 0)
User.create(username: "User4", email: "user4@finance.cloud", password: "useruser", rank: 0)
User.create(username: "User5", email: "user5@finance.cloud", password: "useruser", rank: 0)

# Seed Articles:
Article.create(title: "Admin Article 1", content: "This is generated content from the seed", user_id: 1, created_at: "2016-01-01 08:10:00")
Article.create(title: "Admin Article 2", content: "This is generated content from the seed", user_id: 1, created_at: "2016-01-02 09:20:10")
Article.create(title: "Modo Article 1", content: "This is generated content from the seed", user_id: 2, created_at: "2016-01-03 10:30:20")
Article.create(title: "Modo Article 2", content: "This is generated content from the seed", user_id: 2, created_at: "2016-02-01 11:40:30")
Article.create(title: "Modo Article 3", content: "This is generated content from the seed", user_id: 2, created_at: "2016-02-02 12:50:40")
Article.create(title: "User Article 1", content: "This is generated content from the seed", user_id: 3, created_at: "2016-03-05 13:00:50")
Article.create(title: "User Article 2", content: "This is generated content from the seed", user_id: 3, created_at: "2016-04-05 14:10:00")
Article.create(title: "User Article 3", content: "This is generated content from the seed", user_id: 3, created_at: "2016-05-07 15:20:10")
Article.create(title: "User Article 4", content: "This is generated content from the seed", user_id: 3, created_at: "2016-06-08 16:30:20")
Article.create(title: "User Article 5", content: "This is generated content from the seed", user_id: 3, created_at: "2016-05-07 17:40:30")
Article.create(title: "User Article 6", content: "This is generated content from the seed", user_id: 3, created_at: "2016-05-07 18:50:40")
Article.create(title: "User Article 7", content: "This is generated content from the seed", user_id: 3, created_at: "2016-05-07 19:00:50")
