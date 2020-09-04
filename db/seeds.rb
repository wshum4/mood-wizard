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

Mood.destroy_all
Rating.destroy_all
UserAction.destroy_all
Action.destroy_all
User.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

wince = User.create(
  email: 'wince@email.com',
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
  start_time: convert_time("T11:00AM EST"),
  end_time: convert_time("T9:00PM EST"),
  company_name: 'Rage: Axe Throwing',
  price: 33,
  address: '1436 R. Atateken, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598639290/axe_throwing_lrxmti.jpg',
  background_image_url: 'https://res.cloudinary.com/claidy/image/upload/v1598888067/jason-abdilla-jZWmw6007EY-unsplash_sqouci.jpg'
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
  address: '920 Rue Saint-Zotique, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631894/bowling_nxtlcx.jpg',
  background_image_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631894/bowling_nxtlcx.jpg'
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
  address: '3955 Rue de Rouen, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598639290/archery_ch5qdf.jpg',
  background_image_url: 'https://res.cloudinary.com/claidy/image/upload/v1598887379/annie-spratt-jY9mXvA15W0-unsplash_ywsg7y.jpg'
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
  address: '4338 St Denis St, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631896/pottery_hnguky.jpg',
  background_image_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631896/pottery_hnguky.jpg'
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
  address: '4900 Chemin Bellerive, Carignan',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631896/hoerse_backriding1_zdct5e.jpg',
  background_image_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631896/hoerse_backriding1_zdct5e.jpg'
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
  address: '312 Ontario St, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631895/comedy1_tqkwcr.jpg',
  background_image_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631895/comedy1_tqkwcr.jpg'
  )

golf = Action.create(
  name: 'Golf',
  action_type: 'Activity',
  duration: 5.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T08:00AM EST"),
  end_time: convert_time("T8:00PM EST"),
  company_name: 'Municipal Golf',
  price: 45,
  address: '4235 Viau St, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631896/golf_xwfpfn.jpg',
  background_image_url:'https://res.cloudinary.com/demifo4s4/image/upload/v1598631896/golf_xwfpfn.jpg'
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
  address: '1844 William St, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631894/painting1_cxr6uw.jpg',
  background_image_url:'https://res.cloudinary.com/demifo4s4/image/upload/v1598631894/painting1_cxr6uw.jpg'
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
  address: '1800 Avenue McGill College, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631896/yoga_yhx4gb.jpg',
  background_image_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631896/yoga_yhx4gb.jpg'
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
  company_name: 'Happy Tree Yoga',
  price: 35,
  address: '4812 St Laurent Blvd, Montreal',
  photo_url: 'https://res.cloudinary.com/claidy/image/upload/v1598995210/yannic-laderach-Dqx4XWuXu7w-unsplash_brdr9h.jpg',
  background_image_url: 'https://res.cloudinary.com/claidy/image/upload/v1598995210/yannic-laderach-Dqx4XWuXu7w-unsplash_brdr9h.jpg'
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
  address: '6381 St Laurent Blvd, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598639290/cooking_class_1_ldbfpt.jpg',
  background_image_url:'https://res.cloudinary.com/claidy/image/upload/v1598887624/cooking_class_1_cacrsf.jpg'
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
  address: '215 Rue Jean-Talon Ouest, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598639538/photo-1549719386-74dfcbf7dbed_bbspkw.jpg',
  background_image_url:'https://res.cloudinary.com/claidy/image/upload/v1598887780/bogdan-yukhymchuk-XmvuWRDimrg-unsplash_nls8va.jpg'
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
  address: '1228 Sherbrooke St, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598632480/taylor-simpson-Z8s3PRQVuUk-unsplash_xuudos.jpg',
  background_image_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598632480/taylor-simpson-Z8s3PRQVuUk-unsplash_xuudos.jpg'
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
  address: '1457 Ottawa St, Montreal',
  photo_url: 'https://res.cloudinary.com/claidy/image/upload/v1598887913/ergita-sela-8lZB_vv9kEE-unsplash_ypmrqs.jpg',
  background_image_url: 'https://res.cloudinary.com/claidy/image/upload/v1598887913/ergita-sela-8lZB_vv9kEE-unsplash_ypmrqs.jpg'
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
  address: '768 Rue Rachel, Montreal',
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631895/pilates_j1wa6v.jpg',
  background_image_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598631895/pilates_j1wa6v.jpg'
  )

# medium 4
spotify = Action.create(
  name: 'Spotify',
  action_type: 'Medium',
  url: 'open.spotify.com/playlist/37i9dQZF1DX3rxVfibe1L0',
  duration: 3.hour,
  sad_happy: [0, 10],
  angry_calm: [0, 10],
  lowenergy_highenergy: [0, 10],
  anxious_social: [0, 10],
  start_time: convert_time("T9:00AM EST"),
  end_time: convert_time("T8:00PM EST"),
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598637269/spotify_wt262b.jpg'
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
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598637269/medium_tisx7i.png'
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
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598637269/netflix_sg6mcg.jpg'
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
  photo_url: 'https://res.cloudinary.com/demifo4s4/image/upload/v1598637269/headspace_g0dzrn.jpg'
  )

# user_actions
user_action1 = UserAction.create(
  user: wince,
  action: golf,
  created_at: DateTime.parse('2020-08-28 T 09:00')
  )

user_action2 = UserAction.create(
  user: wince,
  action: boxing,
  created_at: DateTime.parse('2020-08-29 T 09:00')
  )

user_action3 = UserAction.create(
  user: wince,
  action: golf,
  created_at: DateTime.parse('2020-08-30 T 09:00')
  )

user_action4 = UserAction.create(
  user: wince,
  action: yoga,
  created_at: DateTime.parse('2020-08-31 T 13:00')
  )

user_action5 = UserAction.create(
  user: wince,
  action: boxing,
  created_at: DateTime.parse('2020-09-01 T 16:00')
)

user_action6 = UserAction.create(
  user: wince,
  action: paint_class,
  created_at: DateTime.parse('2020-09-02 T 10:00')
  )

user_action7 = UserAction.create(
  user: wince,
  action: archery,
  created_at: DateTime.parse('2020-09-03 T 14:00')
  )

user_action8 = UserAction.create(
  user: wince,
  action: netflix,
  created_at: DateTime.parse('2020-09-03 T 10:00')
  )

user_action9 = UserAction.create(
  user: wince,
  action: spotify,
  created_at: DateTime.parse('2020-09-03 T 10:00')
  )

user_action10 = UserAction.create(
  user: wince,
  action: headspace,
  created_at: DateTime.parse('2020-09-03 T 10:00')
  )

user_action11 = UserAction.create(
  user: wince,
  action: medium,
  created_at: DateTime.parse('2020-09-03 T 10:00')
  )

# mood
mood1 = Mood.create(
  sad_happy: 10,
  angry_calm: 10,
  lowenergy_highenergy: 9,
  anxious_social: 8,
  created_at: DateTime.parse('2020-08-28 T 09:00'),
  user: wince
  )

mood2 = Mood.create(
  sad_happy: 7,
  angry_calm: 9,
  lowenergy_highenergy: 8,
  anxious_social: 9,
  created_at: DateTime.parse('2020-08-28 T 23:00'),
  user_action: user_action1,
  user: wince
  )

mood3 = Mood.create(
  sad_happy:8,
  angry_calm: 9,
  lowenergy_highenergy: 10,
  anxious_social: 8,
  created_at: DateTime.parse('2020-08-29 T 09:00'),
  user: wince
  )

mood4 = Mood.create(
  sad_happy: 9,
  angry_calm: 10,
  lowenergy_highenergy: 7,
  anxious_social: 7,
  created_at: DateTime.parse('2020-08-29 T 23:00'),
  user_action: user_action2,
  user: wince
  )

mood5 = Mood.create(
  sad_happy: 9,
  angry_calm: 8,
  lowenergy_highenergy: 8,
  anxious_social: 8,
  created_at: DateTime.parse('2020-08-30 T 09:00'),
  user: wince
  )

mood6 = Mood.create(
  sad_happy: 8,
  angry_calm: 10,
  lowenergy_highenergy: 8,
  anxious_social: 8,
  created_at: DateTime.parse('2020-08-30 T 23:00'),
  user_action: user_action3,
  user: wince
  )

mood7 = Mood.create(
  sad_happy: 8,
  angry_calm: 7,
  lowenergy_highenergy: 7,
  anxious_social: 9,
  created_at: DateTime.parse('2020-08-31 T 13:00'),
  user: wince
  )

mood8 = Mood.create(
  sad_happy: 8,
  angry_calm: 9,
  lowenergy_highenergy: 8,
  anxious_social: 8,
  created_at: DateTime.parse('2020-08-31 T 23:00'),
  user_action: user_action4,
  user: wince
  )

mood9 = Mood.create(
  sad_happy: 7,
  angry_calm: 6,
  lowenergy_highenergy: 7,
  anxious_social: 9,
  created_at: DateTime.parse('2020-09-01 T 16:00'),
  user: wince
  )

mood10 = Mood.create(
  sad_happy: 6,
  angry_calm: 6,
  lowenergy_highenergy: 6,
  anxious_social: 7,
  created_at: DateTime.parse('2020-09-01 T 23:00'),
  user_action: user_action5,
  user: wince
  )

mood11 = Mood.create(
  sad_happy: 6,
  angry_calm: 5,
  lowenergy_highenergy: 6,
  anxious_social: 8,
  created_at: DateTime.parse('2020-09-02 T 10:00'),
  user: wince
  )

mood12 = Mood.create(
  sad_happy: 7,
  angry_calm: 5,
  lowenergy_highenergy: 6,
  anxious_social: 8,
  created_at: DateTime.parse('2020-09-02 T 23:00'),
  user_action: user_action6,
  user: wince
  )

mood13 = Mood.create(
  sad_happy: 5,
  angry_calm: 3,
  lowenergy_highenergy: 4,
  anxious_social: 9,
  created_at: DateTime.parse('2020-09-03 T 14:00'),
  user: wince
  )

mood14 = Mood.create(
  sad_happy: 6,
  angry_calm: 5,
  lowenergy_highenergy: 5,
  anxious_social: 7,
  created_at: DateTime.parse('2020-09-03 T 23:00'),
  user_action: user_action7,
  user: wince
  )

# ratings
# rating1 = Rating.create(
#   user: wince,
#   user_action: user_action1,
#   rating: 5,
#   comment: 'Good, feel more relaxed now!'
#   )

# rating2 = Rating.create(
#   user: wince,
#   user_action: user_action2,
#   rating: 4,
#   comment: 'So great to sweat it out, I feel better!'
#   )

# rating3 = Rating.create(
#   user: wince,
#   user_action: user_action3,
#   rating: 4,
#   comment: 'Amazing!'
#   )

# rating4 = Rating.create(
#   user: wince,
#   user_action: user_action4,
#   rating: 5,
#   comment: 'Good, feel more relaxed now!'
#   )

# rating5 = Rating.create(
#   user: wince,
#   user_action: user_action5,
#   rating: 3,
#   comment: 'Great!'
#   )

# rating6 = Rating.create(
#   user: wince,
#   user_action: user_action6,
#   rating: 5,
#   comment: 'First time doing this. I would probably doing it again!'
#   )

# rating7 = Rating.create(
#   user: wince,
#   user_action: user_action7,
#   rating: 5,
#   comment: 'Good!'
#   )

puts 'seed ended'
