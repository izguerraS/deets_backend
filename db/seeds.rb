# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: "Seeds", email: "seeds@seeds.com", password: "password")

Recipe.create!([
  {title: "Seeds", chef: "seeds", ingredients: "seeds", dirctions: "seeds", image_url: "n/a", prep_time: 10, user_id: user.id},
  {title: "Seeds 2", chef: "seeds 2", ingredients: "seeds 2", dirctions: "seeds 2", image_url: "n/a 2", prep_time: 12, user_id: user.id}
])
