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
Mood.destroy_all
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
  action_type: 'Activity',
  duration: 1.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 5],
  lowenergy_highenergy: [5, 10],
  anxious_social: [0, 10],
  time_of_day: ['Morning', 'Afternoon', 'Evening'] )

bowling = Action.new(
  name: 'bowling',
  action_type: 'Activity',
  duration: 1.hour,
  sad_happy: [5, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [5, 10],
  anxious_social: [5, 10],
  time_of_day: ['Morning', 'Afternoon', 'Evening'] )

archery = Action.new(
  name: 'archery',
  action_type: 'Activity',
  duration: 1.hour,
  sad_happy: [5, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [5, 10],
  anxious_social: [5, 10],
  time_of_day: ['Morning', 'Afternoon'] )

pottery = Action.new(
  name: 'pottery',
  action_type: 'Activity',
  duration: 2.hour,
  sad_happy: [0, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [0, 5],
  anxious_social: [0, 10],
  time_of_day: ['Morning', 'Afternoon', 'Evening'] )

horseback_riding = Action.new(
  name: 'horseback riding',
  action_type: 'Activity',
  duration: 3.hour,
  sad_happy: [5, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [5, 10],
  anxious_social: [0, 10],
  time_of_day: ['Morning', 'Afternoon'] )

axe.save
bowling.save
archery.save
pottery.save
horseback_riding.save

mood1 = Mood.new(
  sad_happy: rand(0..10),
  angry_calm: rand(0..10),
  lowenergy_highenergy: rand(0..10),
  anxious_social: rand(0..10),
  user: kai
  )

  mood2 = Mood.new(
  sad_happy: rand(0..10),
  angry_calm: rand(0..10),
  lowenergy_highenergy: rand(0..10),
  anxious_social: rand(0..10),
  user: kai
  )

  mood3 = Mood.new(
  sad_happy: rand(0..10),
  angry_calm: rand(0..10),
  lowenergy_highenergy: rand(0..10),
  anxious_social: rand(0..10),
  user: kai
  )

  mood4 = Mood.new(
  sad_happy: rand(0..10),
  angry_calm: rand(0..10),
  lowenergy_highenergy: rand(0..10),
  anxious_social: rand(0..10),
  user: kai
  )

  mood1.save
  mood2.save
  mood3.save
  mood4.save

puts 'seed ended'
