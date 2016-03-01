# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed Users:
User.create(username: "Admin", email: "admin@finance.cloud", password: "admin", rank: 999)
User.create(username: "Moderator", email: "modo@finance.cloud", password: "modo", rank: 1)
User.create(username: "User", email: "user@finance.cloud", password: "user", rank: 0)

# Seed Articles:
Article.create(title: "Admin Article 1", content: "This is generated content from the seed", user_id: 1)
Article.create(title: "Admin Article 2", content: "This is generated content from the seed", user_id: 1)
Article.create(title: "Modo Article 1", content: "This is generated content from the seed", user_id: 2)
Article.create(title: "Modo Article 2", content: "This is generated content from the seed", user_id: 2)
Article.create(title: "Modo Article 3", content: "This is generated content from the seed", user_id: 2)
Article.create(title: "User Article 1", content: "This is generated content from the seed", user_id: 3)
Article.create(title: "User Article 2", content: "This is generated content from the seed", user_id: 3)
Article.create(title: "User Article 3", content: "This is generated content from the seed", user_id: 3)
Article.create(title: "User Article 4", content: "This is generated content from the seed", user_id: 3)
