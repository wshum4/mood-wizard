# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seed started'

Rating.destroy_all
UserAction.destroy_all
Action.destroy_all
User.destroy_all

kai = User.new(
  email: 'kai@email.com',
  password: '123456',
  password_confirmation: '123456',
  address: "5333 Casgrain Avenue",
  availability: ['Morning', 'Afternoon']
)

kai.save

axe = Action.new(
  name: 'axe throwing',
  type: 'Activity',
  happy_sad: 4,
  calm_angry: 10,
  highenergy_lowenergy: 0,
  social_anxious: 5,
  duration: ,
  time_of_day: ['Morning', 'Afternoon', 'Evening'] )

puts 'seed ended'
