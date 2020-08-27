# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def convert_time(time_string)
  # time_string is a string of this format: "T10:00AM EST",  the T and EST are very important
  DateTime.parse(time_string).utc
end

puts 'seed started'

Rating.destroy_all
UserAction.destroy_all
Action.destroy_all
Mood.destroy_all
User.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

kai = User.create(
  email: 'kai@email.com',
  password: '123456',
  password_confirmation: '123456',
  address: "5333 Casgrain Avenue",
)

# activities
axe = Action.create(
  name: 'Axe Throwing',
  action_type: 'Activity',
  duration: 1.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 5],
  lowenergy_highenergy: [5, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T10:00AM EST"),
  end_time: convert_time("T9:00PM EST"),
  company_name: 'Rage: Axe Throwing',
  price: 33,
  address: '1436 R. Atateken, Montreal'
  )

bowling = Action.create(
  name: 'Bowling',
  action_type: 'Activity',
  duration: 1.hour,
  sad_happy: [5, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [5, 10],
  anxious_social: [5, 10],
  start_time: convert_time("T10:00AM EST"),
  end_time: convert_time("T10:00PM EST"),
  company_name: 'Bowling G Plus',
  price: 15,
  address: '920 Rue Saint-Zotique, Montreal'
  )

archery = Action.create(
  name: 'Archery',
  action_type: 'Activity',
  duration: 1.hour,
  sad_happy: [5, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [5, 10],
  anxious_social: [5, 10],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T5:00PM EST"),
  company_name: 'Combat Archery',
  price: 38,
  address: '3955 Rue de Rouen, Montreal'
  )

pottery = Action.create(
  name: 'Pottery',
  action_type: 'Activity',
  duration: 2.hour,
  sad_happy: [0, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [0, 5],
  anxious_social: [0, 10],
  start_time: convert_time("T8:00AM EST"),
  end_time: convert_time("T7:00PM EST"),
  company_name: 'Céramic Café Studio Montréal',
  price: 45,
  address: '4338 St Denis St, Montreal'
  )

horseback_riding = Action.create(
  name: 'Horseback Riding',
  action_type: 'Activity',
  duration: 2.hour,
  sad_happy: [5, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [5, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T4:00PM EST"),
  company_name: 'Cavalli Equestrian Center',
  price: 120,
  address: '4900 Chemin Bellerive, Carignan'
  )

comedy_show = Action.create(
  name: 'Comedy Show',
  action_type: 'Activity',
  duration: 1.hour,
  sad_happy: [0, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [5, 10],
  start_time: convert_time("T12:00pm EST"),
  end_time: convert_time("T10:00PM EST"),
  company_name: 'Le Bordel Comedie Club',
  price: 30,
  address: '312 Ontario St, Montreal'
  )

laser_tag = Action.create(
  name: 'Laser Tag',
  action_type: 'Activity',
  duration: 1.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 10],
  lowenergy_highenergy: [5, 10],
  anxious_social: [5, 10],
  start_time: convert_time("T11:00AM EST"),
  end_time: convert_time("T8:00PM EST"),
  company_name: 'Zero Latency',
  price: 36,
  address: '910 Jean Talon St, Montreal'
  )

paint_class = Action.create(
  name: 'Painting Class',
  action_type: 'Activity',
  duration: 3.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T5:00PM EST"),
  company_name: 'Zoya Art Studio',
  price: 40,
  address: '1844 William St, Montreal'
  )

meditation = Action.create(
  name: 'Meditation Class',
  action_type: 'Activity',
  duration: 1.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T8:00AM EST"),
  end_time: convert_time("T8:00PM EST"),
  company_name: 'Tadaima Meditation',
  price: 38,
  address: '1565 Mont-Royal Ave, Montreal'
  )

yoga = Action.create(
  name: 'Yoga Class',
  action_type: 'Activity',
  duration: 1.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T8:00AM EST"),
  end_time: convert_time("T5:00PM EST"),
  company_name: 'Naada Yoga',
  price: 35,
  address: '5540 Casgrain Ave, Montreal'
  )

cooking_class = Action.create(
  name: 'Cooking Class',
  action_type: 'Activity',
  duration: 4.hour,
  sad_happy: [0, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T10:00AM EST"),
  end_time: convert_time("T5:00PM EST"),
  company_name: 'Culinary Guild',
  price: 60,
  address: '6381 St Laurent Blvd, Montreal'
  )

boxing = Action.create(
  name: 'Boxing',
  action_type: 'Activity',
  duration: 3.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 5],
  lowenergy_highenergy: [5, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T8:00PM EST"),
  company_name: 'Underdog Boxing Gym',
  price: 32,
  address: '9 St Catherine St, Montreal'
  )

spa = Action.create(
  name: 'Spa',
  action_type: 'Activity',
  duration: 5.hour,
  sad_happy: [0, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [0, 5],
  anxious_social: [0, 5],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T7:00PM EST"),
  company_name: 'Spa Ovarium',
  price: 160,
  address: '400 Rue Beaubien, Montreal'
  )

plant_arrangement = Action.create(
  name: 'Plant Arrangement Class',
  action_type: 'Activity',
  duration: 3.hour,
  sad_happy: [0, 10],
  angry_calm: [5, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T5:00PM EST"),
  company_name: 'Plantzy',
  price: 40,
  address: '5445 Gaspe Ave, Montreal'
  )

pilates = Action.create(
  name: 'Pilates',
  action_type: 'Activity',
  duration: 1.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T8:00PM EST"),
  company_name: 'Espace Pilates',
  price: 30,
  address: '768 Rue Rachel, Montreal'
  )

# medium 4
spotify = Action.create(
  name: 'Spotify',
  action_type: 'Medium',
  url: 'www.spotify.com',
  duration: 3.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T8:00PM EST"),
  )

medium = Action.create(
  name: 'Medium',
  action_type: 'Medium',
  url: 'www.medium.com',
  duration: 2.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T8:00PM EST"),
  )

netflix = Action.create(
  name: 'Netflix',
  action_type: 'Medium',
  url: 'www.netflix.com',
  duration: 4.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T8:00PM EST"),
  )

headspace = Action.create(
  name: 'Headspace',
  action_type: 'Medium',
  url: 'www.headspace.com',
  duration: 1.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T8:00PM EST"),
  )

# mood
mood1 = Mood.create(
  sad_happy: 3,
  angry_calm: 3,
  lowenergy_highenergy: 9,
  anxious_social: 6,
  manual_created_at: DateTime.parse('2020-08-20 T 09:00'),
  user: kai
  )

mood2 = Mood.create(
  sad_happy: 4,
  angry_calm: 2,
  lowenergy_highenergy: 10,
  anxious_social: 8,
  manual_created_at: DateTime.parse('2020-08-21 T 09:00'),
  user: kai
  )

mood3 = Mood.create(
  sad_happy: 8,
  angry_calm: 7,
  lowenergy_highenergy: 3,
  anxious_social: 4,
  manual_created_at: DateTime.parse('2020-08-22 T 09:00'),
  user: kai
  )

mood4 = Mood.create(
  sad_happy: rand(0..10),
  angry_calm: rand(0..10),
  lowenergy_highenergy: rand(0..10),
  anxious_social: rand(0..10),
  manual_created_at: DateTime.parse('2020-08-23 T 13:00'),
  user: kai
  )

mood5 = Mood.create(
  sad_happy: 8,
  angry_calm: 9,
  lowenergy_highenergy: 7,
  anxious_social: 6,
  manual_created_at: DateTime.parse('2020-08-24 T 16:00'),
  user: kai
  )

mood6 = Mood.create(
  sad_happy: 6,
  angry_calm: 7,
  lowenergy_highenergy: 6,
  anxious_social: 6,
  manual_created_at: DateTime.parse('2020-08-25 T 10:00'),
  user: kai
  )

mood7 = Mood.create(
  sad_happy: rand(0..10),
  angry_calm: rand(0..10),
  lowenergy_highenergy: rand(0..10),
  anxious_social: rand(0..10),
  manual_created_at: DateTime.parse('2020-08-26 T 14:00'),
  user: kai
  )

user_action1 = UserAction.create(
  user: kai,
  action: axe,
  created_at: DateTime.parse('2020-08-20 T 09:00')
  )

user_action2 = UserAction.create(
  user: kai,
  action: boxing,
  created_at: DateTime.parse('2020-08-21 T 09:00')
  )

user_action3 = UserAction.create(
  user: kai,
  action: pottery,
  created_at: DateTime.parse('2020-08-22 T 09:00')
  )

user_action4 = UserAction.create(
  user: kai,
  action: yoga,
  created_at: DateTime.parse('2020-08-23 T 13:00')
  )

user_action5 = UserAction.create(
  user: kai,
  action: archery,
  created_at: DateTime.parse('2020-08-24 T 16:00')
)

user_action6 = UserAction.create(
  user: kai,
  action: plant_arrangement,
  created_at: DateTime.parse('2020-08-25 T 10:00')
  )

user_action7 = UserAction.create(
  user: kai,
  action: meditation,
  created_at: DateTime.parse('2020-08-26 T 14:00')
  )

user_action8 = UserAction.create(
  user: kai,
  action: netflix,
  created_at: DateTime.parse('2020-08-25 T 10:00')
  )

user_action9 = UserAction.create(
  user: kai,
  action: spotify,
  created_at: DateTime.parse('2020-08-25 T 10:00')
  )

user_action10 = UserAction.create(
  user: kai,
  action: headspace,
  created_at: DateTime.parse('2020-08-25 T 10:00')
  )

user_action11 = UserAction.create(
  user: kai,
  action: medium,
  created_at: DateTime.parse('2020-08-25 T 10:00')
  )

puts 'seed ended'
