# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BOOL = [0, 1]

5.times do
  List.create!(title: Faker::StarWars.specie)
end

5.times do
  Task.create!(body: Faker::StarWars.quote, completed: BOOL)
end
